// MyPageActivity.java
package com.example.homework;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.homework.databinding.ActivityMyPageBinding;

public class MyPageActivity extends AppCompatActivity {
    private ActivityMyPageBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMyPageBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 显示用户信息
        showUserInfo();

        // 设置底部导航
        setupBottomNav();

        // 退出登录按钮
        binding.btnLogout.setOnClickListener(v -> {
            logout();
        });

        // 添加设置功能
        setupSettingsFunction();

        // 添加"我创建的投票"功能
        setupMyCreatedVotesFunction();

        // 添加"我参与的投票"功能
        setupMyParticipatedVotesFunction();
    }

    // 显示用户信息
    private void showUserInfo() {
        String userEmail = getIntent().getStringExtra("USER_EMAIL");
        if (userEmail == null || userEmail.isEmpty()) {
            SharedPreferences sp = getSharedPreferences("user_info", MODE_PRIVATE);
            userEmail = sp.getString("user_email", "未登录");
        }
        binding.tvUserEmail.setText(userEmail);
    }

    // 设置底部导航
    private void setupBottomNav() {
        // 我的标签默认选中
        binding.myTab.setSelected(true);

        // 首页点击
        binding.homeTab.setOnClickListener(v -> {
            binding.homeTab.setSelected(true);
            binding.myTab.setSelected(false);
            startActivity(new Intent(MyPageActivity.this, HomeActivity.class));
            finish();
        });

        // 我的点击
        binding.myTab.setOnClickListener(v -> {
            // 已在我的页面，仅更新选中状态
            binding.homeTab.setSelected(false);
            binding.myTab.setSelected(true);
        });
    }

    // 设置功能
    private void setupSettingsFunction() {
        // 添加设置按钮的点击事件
        binding.btnSettings.setOnClickListener(v -> {
            startActivity(new Intent(MyPageActivity.this, SettingsActivity.class));
        });
    }

    // "我创建的投票"功能
    private void setupMyCreatedVotesFunction() {
        // 找到"我创建的投票"的父布局（LinearLayout）
        // 根据布局文件，这是第一个功能项
        binding.functionList.getChildAt(0).setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(MyPageActivity.this, MyVoteActivity.class));
            } else {
                redirectToLogin();
            }
        });
    }

    // "我参与的投票"功能
    private void setupMyParticipatedVotesFunction() {
        binding.functionList.getChildAt(1).setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(MyPageActivity.this, ParticipatedVotesActivity.class));
            } else {
                redirectToLogin();
            }
        });
    }


    // 检查用户是否已登录
    private boolean isUserLoggedIn() {
        SharedPreferences sp = getSharedPreferences("user_info", MODE_PRIVATE);
        return sp.getBoolean("is_login", false);
    }

    // 跳转到登录页面
    private void redirectToLogin() {
        Toast.makeText(this, "请先登录", Toast.LENGTH_SHORT).show();
        startActivity(new Intent(MyPageActivity.this, LoginActivity.class));
    }

    // 退出登录
    private void logout() {
        SharedPreferences sp = getSharedPreferences("user_info", MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putBoolean("is_login", false);
        editor.putString("user_email", "");
        editor.apply();

        Toast.makeText(this, "退出登录成功", Toast.LENGTH_SHORT).show();
        startActivity(new Intent(MyPageActivity.this, LoginActivity.class));
        finish();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}
