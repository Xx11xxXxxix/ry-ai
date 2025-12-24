package com.example.homework;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.homework.databinding.ActivityRegisterBinding;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class RegisterActivity extends AppCompatActivity {
    private ActivityRegisterBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityRegisterBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 注册按钮
        binding.registerButton.setOnClickListener(v -> {
            registerUser();
        });

        // 返回登录
        binding.tvBackLogin.setOnClickListener(v -> {
            finish();
        });
    }

    // 注册用户
    private void registerUser() {
        String username = binding.emailInput.getText().toString().trim();
        String password = binding.passwordEditText.getText().toString().trim();
        String confirmPwd = binding.confirmPasswordEditText.getText().toString().trim();

        // 1. 本地基础校验
        if (username.isEmpty()) {
            Toast.makeText(this, "请输入账号", Toast.LENGTH_SHORT).show();
            return;
        }
        if (password.isEmpty()) {
            Toast.makeText(this, "请输入密码", Toast.LENGTH_SHORT).show();
            return;
        }
        if (!password.equals(confirmPwd)) {
            Toast.makeText(this, "两次密码不一致", Toast.LENGTH_SHORT).show();
            return;
        }

        // 2. 发起网络请求 (子线程)
        new Thread(() -> {
            try {
                // === 战术修正 1：IP地址 ===
                // 模拟器访问电脑本机必须用 10.0.2.2，不能用 127.0.0.1
                String apiUrl = "http://10.0.2.2:8080/app/api/register";

                URL url = new URL(apiUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setConnectTimeout(5000); // 5秒超时
                conn.setDoOutput(true);
                conn.setDoInput(true);
                conn.setUseCaches(false);
                conn.setRequestProperty("Content-Type", "application/json;charset=utf-8");

                // 3. 构建 JSON
                String jsonBody = "{\"username\":\"" + username + "\", \"password\":\"" + password + "\"}";

                // 4. 发送数据
                OutputStream os = conn.getOutputStream();
                os.write(jsonBody.getBytes("UTF-8"));
                os.flush();
                os.close();

                // 5. === 战术修正 2：读取服务器返回的真实内容 ===
                int responseCode = conn.getResponseCode();

                InputStream is;
                if (responseCode >= 200 && responseCode < 300) {
                    is = conn.getInputStream(); // 请求成功流
                } else {
                    is = conn.getErrorStream(); // 报错流
                }

                // 将流转换为字符串
                BufferedReader reader = new BufferedReader(new InputStreamReader(is));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();

                String serverResponse = response.toString();
                Log.e("EVA_DEBUG", "服务器返回: " + serverResponse);

                // 6. 根据返回内容判断结果
                // 若依成功的标志通常包含 "code":200 或 "msg":"操作成功"
                if (responseCode == 200 && (serverResponse.contains("\"code\":200") || serverResponse.contains("成功"))) {
                    runOnUiThread(() -> {
                        Toast.makeText(RegisterActivity.this, "注册成功，请登录", Toast.LENGTH_SHORT).show();
                        finish();
                    });
                } else {
                    // 失败：把服务器具体的错误原因（如“账号已存在”）显示出来
                    runOnUiThread(() -> {
                        Toast.makeText(RegisterActivity.this, "失败: " + serverResponse, Toast.LENGTH_LONG).show();
                    });
                }

            } catch (Exception e) {
                e.printStackTrace();
                runOnUiThread(() -> {
                    // 如果连不上，通常会在这里报错 (Connection refused)
                    Toast.makeText(RegisterActivity.this, "连接错误: " + e.getMessage(), Toast.LENGTH_SHORT).show();
                });
            }
        }).start();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}