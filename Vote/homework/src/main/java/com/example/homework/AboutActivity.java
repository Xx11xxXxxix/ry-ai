// AboutActivity.java
package com.example.homework;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import com.example.homework.databinding.ActivityAboutBinding;

public class AboutActivity extends AppCompatActivity {
    private ActivityAboutBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityAboutBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 设置返回按钮
        binding.btnBack.setOnClickListener(v -> finish());

        // 初始化关于页面内容
        initAboutContent();
    }

    private void initAboutContent() {
        // 设置应用名称
        binding.tvAppName.setText("投票应用");

        // 设置版本信息
        binding.tvVersion.setText("版本: 1.0.0");

        // 设置版权声明
        binding.tvCopyright.setText("版权所有 © 2025飘肠乐园团队\n保留所有权利");

        // 设置应用描述
        binding.tvDescription.setText("这是一款简洁易用的投票应用，帮助您轻松创建和参与各种投票活动。");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}
