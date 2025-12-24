package com.example.homework;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.RadioGroup;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.example.homework.databinding.ActivityVoteDetailBinding;
import com.google.android.material.radiobutton.MaterialRadioButton;
import java.util.List;

public class VoteDetailActivity extends AppCompatActivity {
    private ActivityVoteDetailBinding binding;
    private RadioGroup radioGroup;
    private DatabaseHelper dbHelper;
    private List<DatabaseHelper.VoteOption> voteOptions;
    private int selectedVoteId = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityVoteDetailBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据库助手
        dbHelper = new DatabaseHelper(this);

        // 接收并设置问卷标题
        String voteTitle = getIntent().getStringExtra("VOTE_TITLE");
        if (voteTitle != null) {
            binding.tvVoteTitle.setText(voteTitle);
        }

        // 获取投票ID
        selectedVoteId = getIntent().getIntExtra("VOTE_ID", -1);

        // 初始化选项
        initVoteOptions();

        // 核心修复：给返回按钮绑定点击事件
        binding.btnBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 关闭当前页面，返回上一级
                finish();
            }
        });

        // 提交按钮点击事件
        binding.btnSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                submitVote();
            }
        });
    }

    /**
     * 初始化投票选项
     */
    private void initVoteOptions() {
        radioGroup = binding.radioGroupOptions;
        
        // 清空现有的选项
        radioGroup.removeAllViews();
        
        // 从数据库获取投票选项
        if (selectedVoteId != -1) {
            voteOptions = dbHelper.getVoteOptions(selectedVoteId);
            
            for (int i = 0; i < voteOptions.size(); i++) {
                MaterialRadioButton radioButton = new MaterialRadioButton(this);
                radioButton.setText(voteOptions.get(i).getOptionText());
                radioButton.setTextSize(16);
                radioButton.setPadding(
                    16, // Start padding
                    12, // Top padding
                    16, // End padding
                    12  // Bottom padding
                );
                radioButton.setId(View.generateViewId());
                radioGroup.addView(radioButton);
                
                // 为第一个选项设置默认选中
                if (i == 0) {
                    radioButton.setChecked(true);
                }
            }
        }
    }

    /**
     * 提交投票
     */
    private void submitVote() {
        int selectedId = radioGroup.getCheckedRadioButtonId();
        if (selectedId == -1) {
            Toast.makeText(this, "请选择一个选项", Toast.LENGTH_SHORT).show();
            return;
        }

        MaterialRadioButton selectedRadioButton = findViewById(selectedId);
        String selectedOption = selectedRadioButton.getText().toString();
        
        // 检查用户是否已经参与过该投票
        int userId = getCurrentUserId();
        if (dbHelper.hasUserParticipated(userId, selectedVoteId)) {
            Toast.makeText(this, "您已经参与过此投票", Toast.LENGTH_SHORT).show();
            return;
        }
        
        Toast.makeText(this, "您选择了: " + selectedOption, Toast.LENGTH_SHORT).show();
        
        // 记录用户参与了该投票
        recordUserParticipation();
    }
    
    /**
     * 记录用户参与投票
     */
    private void recordUserParticipation() {
        // 获取当前用户ID
        int userId = getCurrentUserId();
        
        // 将用户参与记录保存到数据库
        if (selectedVoteId != -1) {
            boolean success = dbHelper.addParticipatedVote(userId, selectedVoteId);
            if (success) {
                Toast.makeText(this, "投票成功提交", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "投票提交失败", Toast.LENGTH_SHORT).show();
            }
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

    // 额外保障：点击手机物理返回键也能返回
    @Override
    public void onBackPressed() {
        finish();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}