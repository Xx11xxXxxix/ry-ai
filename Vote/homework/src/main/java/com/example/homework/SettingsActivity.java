// SettingsActivity.java
package com.example.homework;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;

import com.example.homework.databinding.ActivitySettingsBinding;

public class SettingsActivity extends AppCompatActivity {
    private ActivitySettingsBinding binding;
    private SharedPreferences appSettings;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivitySettingsBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化SharedPreferences
        appSettings = getSharedPreferences("app_settings", MODE_PRIVATE);

        // 设置返回按钮
        binding.btnBack.setOnClickListener(v -> finish());

        // 初始化设置选项
        initSettings();
    }

    private void initSettings() {
        // 主题设置
        boolean isDarkMode = appSettings.getBoolean("dark_mode", false);
        binding.switchDarkMode.setChecked(isDarkMode);
        binding.switchDarkMode.setOnCheckedChangeListener((buttonView, isChecked) -> {
            appSettings.edit().putBoolean("dark_mode", isChecked).apply();
            toggleDarkMode(isChecked);
        });

        // 通知设置
        binding.switchNotification.setChecked(isNotificationEnabled());
        binding.switchNotification.setOnCheckedChangeListener((buttonView, isChecked) -> {
            toggleNotifications(isChecked);
        });

        // 缓存清理
        binding.btnClearCache.setOnClickListener(v -> {
            clearAppCache();
        });

        // 关于应用
        binding.layoutAbout.setOnClickListener(v -> {
            // 跳转到关于页面
            startActivity(new Intent(SettingsActivity.this, AboutActivity.class));
        });


        // 版本信息
        binding.layoutVersion.setOnClickListener(v -> {
            Toast.makeText(this, "当前版本: 1.0.0", Toast.LENGTH_SHORT).show();
        });
    }

    private void toggleDarkMode(boolean enable) {
        if (enable) {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES);
        } else {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
        }
    }

    private boolean isNotificationEnabled() {
        return appSettings.getBoolean("notifications_enabled", true);
    }

    private void toggleNotifications(boolean enable) {
        // 保存设置
        appSettings.edit().putBoolean("notifications_enabled", enable).apply();

        if (enable) {
            Toast.makeText(this, "通知已开启", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, "通知已关闭", Toast.LENGTH_SHORT).show();
        }
    }

    private void clearAppCache() {
        // 实际应用中应添加真正的缓存清理逻辑
        Toast.makeText(this, "缓存已清理", Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}