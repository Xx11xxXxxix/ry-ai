package com.example.homework;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.example.homework.databinding.ActivityVoteTemplateBinding;

public class VoteTemplateActivity extends AppCompatActivity {
    private ActivityVoteTemplateBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityVoteTemplateBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 返回按钮点击事件
        binding.btnBack.setOnClickListener(v -> finish());

        // 模板1按钮点击事件
        binding.btnUseTemplate1.setOnClickListener(v -> {
            useTemplate("员工评选模板", new String[]{"张三", "李四", "王五", "赵六"});
        });

        // 模板2按钮点击事件
        binding.btnUseTemplate2.setOnClickListener(v -> {
            useTemplate("活动策划模板", new String[]{"户外拓展", "KTV聚会", "温泉度假", "自由活动"});
        });

        // 模板3按钮点击事件
        binding.btnUseTemplate3.setOnClickListener(v -> {
            useTemplate("意见调查模板", new String[]{"非常满意", "满意", "一般", "不满意", "非常不满意"});
        });
    }

    /**
     * 使用指定模板创建投票
     * @param title 模板标题
     * @param options 模板选项
     */
    private void useTemplate(String title, String[] options) {
        // 创建Intent跳转到创建投票页面
        Intent intent = new Intent(this, CreateVoteActivity.class);
        intent.putExtra("template_title", title);
        intent.putExtra("template_options", options);
        startActivity(intent);
        
        // 显示提示信息
        Toast.makeText(this, "已选择模板: " + title, Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}