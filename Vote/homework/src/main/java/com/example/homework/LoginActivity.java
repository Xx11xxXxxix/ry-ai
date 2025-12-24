package com.example.homework;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.homework.databinding.ActivityLoginBinding;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.textfield.TextInputEditText;

public class LoginActivity extends AppCompatActivity {
    private ActivityLoginBinding binding;
    private TextInputEditText emailInput;
    private TextInputEditText passwordInput;
    private MaterialButton gotoMyPageButton;
    private DatabaseHelper databaseHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityLoginBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据库
        databaseHelper = new DatabaseHelper(this);

        // 初始化控件
        emailInput = binding.emailInput;
        passwordInput = binding.passwordEditText;
        gotoMyPageButton = binding.gotoMyPageButton;

        // 设置底部导航
        setupBottomNav();
        // 设置登录按钮事件
        setupLoginButtons();
    }

    // 设置底部导航
    private void setupBottomNav() {
        // 默认选中首页
        binding.homeTab.setSelected(true);

        // 首页点击事件
        binding.homeTab.setOnClickListener(v -> {
            binding.homeTab.setSelected(true);
            binding.myTab.setSelected(false);
            startActivity(new Intent(LoginActivity.this, HomeActivity.class));
        });

        // 我的点击事件
        binding.myTab.setOnClickListener(v -> {
            binding.homeTab.setSelected(false);
            binding.myTab.setSelected(true);
            Log.d("LoginActivity", "我的标签被点击");
            Toast.makeText(this, "点击了我的标签", Toast.LENGTH_SHORT).show();
            try {
                Intent intent = new Intent(LoginActivity.this, MyPageActivity.class);
                startActivity(intent);
                Log.d("LoginActivity", "跳转MyPageActivity成功");
            } catch (Exception e) {
                Log.e("LoginActivity", "跳转失败", e);
                Toast.makeText(this, "跳转失败：" + e.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

    // 设置登录按钮事件
    private void setupLoginButtons() {
        // 登录按钮
        binding.accountLoginButton.setOnClickListener(v -> {
            if (binding.agreementCheckBox.isChecked()) {
                String email = emailInput.getText().toString().trim();
                String password = passwordInput.getText().toString().trim();

                if (email.isEmpty()) {
                    Toast.makeText(LoginActivity.this, "请输入账号", Toast.LENGTH_SHORT).show();
                    return;
                }

                if (password.isEmpty()) {
                    Toast.makeText(LoginActivity.this, "请输入密码", Toast.LENGTH_SHORT).show();
                    return;
                }

                // 验证用户
                if (databaseHelper.checkUser(email, password)) {
                    Toast.makeText(LoginActivity.this, "登录成功", Toast.LENGTH_SHORT).show();
                    // 保存登录状态
                    saveLoginState(true, email);
                    startActivity(new Intent(LoginActivity.this, HomeActivity.class));
                    finish();
                } else {
                    Toast.makeText(LoginActivity.this, "账号或密码错误", Toast.LENGTH_SHORT).show();
                }
            } else {
                Toast.makeText(LoginActivity.this, "请先同意服务协议", Toast.LENGTH_SHORT).show();
            }
        });

        // 注册按钮
        binding.registerText.setOnClickListener(v -> {
            startActivity(new Intent(LoginActivity.this, RegisterActivity.class));
        });

        // 直接进入我的页面
        gotoMyPageButton.setOnClickListener(v -> {
            String email = emailInput.getText().toString().trim();
            if (email.isEmpty()) {
                Toast.makeText(this, "请先输入账号", Toast.LENGTH_SHORT).show();
                return;
            }
            saveLoginState(true, email);
            Intent intent = new Intent(LoginActivity.this, MyPageActivity.class);
            intent.putExtra("USER_EMAIL", email);
            startActivity(intent);
            finish();
        });
    }

    // 保存登录状态
    private void saveLoginState(boolean isLogin, String email) {
        SharedPreferences sp = getSharedPreferences("user_info", MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putBoolean("is_login", isLogin);
        editor.putString("user_email", email);
        editor.apply();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}