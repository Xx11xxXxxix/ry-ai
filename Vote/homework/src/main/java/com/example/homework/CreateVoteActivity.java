package com.example.homework;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.example.homework.databinding.ActivityCreateVoteBinding;
import com.google.android.material.textfield.TextInputEditText;
import java.util.ArrayList;
import java.util.List;

public class CreateVoteActivity extends AppCompatActivity {
    private ActivityCreateVoteBinding binding;
    private List<TextInputEditText> optionList = new ArrayList<>();
    private DatabaseHelper dbHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // 初始化ViewBinding
        binding = ActivityCreateVoteBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据库助手
        dbHelper = new DatabaseHelper(this);

        // 设置返回按钮点击事件
        binding.btnBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 关闭当前Activity，返回上一级页面
                finish();
            }
        });

        // 添加选项按钮点击事件
        binding.btnAddOption.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                addOptionField();
            }
        });

        // 提交按钮点击事件
        binding.btnSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                submitVote();
            }
        });

        // 检查是否有从模板传入的数据
        checkTemplateData();

        // 如果没有模板数据，则默认添加两个选项
        if (optionList.isEmpty()) {
            addOptionField();
            addOptionField();
        }
    }

    /**
     * 检查是否有从模板传入的数据
     */
    private void checkTemplateData() {
        // 获取从模板页面传递过来的标题和选项数据
        String templateTitle = getIntent().getStringExtra("template_title");
        String[] templateOptions = getIntent().getStringArrayExtra("template_options");

        // 如果有模板数据，则填充到界面中
        if (templateTitle != null && !templateTitle.isEmpty()) {
            binding.editTitle.setText(templateTitle);
        }

        if (templateOptions != null && templateOptions.length > 0) {
            for (String option : templateOptions) {
                TextInputEditText editText = new TextInputEditText(this);
                editText.setText(option);
                binding.optionsContainer.addView(editText);
                optionList.add(editText);
            }
        }
    }

    /**
     * 添加一个新的选项输入框
     */
    private void addOptionField() {
        TextInputEditText editText = new TextInputEditText(this);
        editText.setHint("选项 " + (optionList.size() + 1));
        binding.optionsContainer.addView(editText);
        optionList.add(editText);
    }

    /**
     * 提交投票
     */
    private void submitVote() {
        String title = binding.editTitle.getText().toString().trim();
        String description = binding.editDescription.getText().toString().trim();

        // 检查标题是否为空
        if (title.isEmpty()) {
            binding.editTitle.setError("请输入投票标题");
            return;
        }

        // 检查是否有至少两个选项
        List<String> options = new ArrayList<>();
        for (TextInputEditText editText : optionList) {
            String option = editText.getText().toString().trim();
            if (!option.isEmpty()) {
                options.add(option);
            }
        }

        if (options.size() < 2) {
            Toast.makeText(this, "请至少填写两个选项", Toast.LENGTH_SHORT).show();
            return;
        }

        // 获取当前用户ID
        int userId = getCurrentUserId();
        
        // 保存投票信息到数据库
        boolean success = dbHelper.createVote(title, description, userId);

        if (success) {
            Toast.makeText(this, "投票创建成功", Toast.LENGTH_SHORT).show();
            finish(); // 返回上一页
        } else {
            Toast.makeText(this, "投票创建失败", Toast.LENGTH_SHORT).show();
        }
    }
    
    /**
     * 获取当前用户ID
     * @return 用户ID
     */
    private int getCurrentUserId() {
        SharedPreferences sp = getSharedPreferences("user_info", MODE_PRIVATE);
        String userEmail = sp.getString("user_email", "");
        // 在实际应用中，这里应该通过用户邮箱查询数据库获取用户ID
        // 这里为了简化，假设用户ID为1
        return 1;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}