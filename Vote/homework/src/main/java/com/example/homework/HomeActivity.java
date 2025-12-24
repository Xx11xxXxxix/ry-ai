package com.example.homework;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;

import com.example.homework.databinding.ActivityHomeBinding;

import java.util.ArrayList;
import java.util.List;

public class HomeActivity extends AppCompatActivity {
    private ActivityHomeBinding binding;
    private VoteListAdapter adapter;
    private List<VoteListAdapter.VoteItem> voteItems;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityHomeBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据
        initVoteData();
        // 设置RecyclerView
        setupRecyclerView();
        // 设置底部导航
        setupBottomNav();
        // 设置悬浮按钮
        setupFabButton();
        // 设置快捷功能
        setupQuickFunctions();
    }

    // 初始化问卷数据
    private void initVoteData() {
        voteItems = new ArrayList<>();
        voteItems.add(new VoteListAdapter.VoteItem("年度最佳员工评选", "2025-01-15 至 2025-01-25", 156, false));
        voteItems.add(new VoteListAdapter.VoteItem("公司年会地点投票", "2025-01-10 至 2025-01-20", 89, false));
        voteItems.add(new VoteListAdapter.VoteItem("新产品功能投票", "2025-01-05 至 2025-01-15", 234, true));
    }

    // 设置RecyclerView
    private void setupRecyclerView() {
        adapter = new VoteListAdapter(HomeActivity.this, voteItems, new VoteListAdapter.OnVoteItemClickListener() {
            @Override
            public void onItemClick(VoteListAdapter.VoteItem item) {
                Intent intent = new Intent(HomeActivity.this, VoteDetailActivity.class);
                intent.putExtra("VOTE_TITLE", item.getTitle());
                startActivity(intent);
            }

            @Override
            public void onShareClick(VoteListAdapter.VoteItem item) {
                Toast.makeText(HomeActivity.this, "分享投票: " + item.getTitle(), Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onResultsClick(VoteListAdapter.VoteItem item) {
                Intent intent = new Intent(HomeActivity.this, ResultStatisticsActivity.class);
                intent.putExtra("vote_title", item.getTitle());
                startActivity(intent);
            }
            
            @Override
            public void onParticipateClick(VoteListAdapter.VoteItem item) {
                Intent intent = new Intent(HomeActivity.this, VoteDetailActivity.class);
                intent.putExtra("VOTE_TITLE", item.getTitle());
                startActivity(intent);
            }
        });

        binding.voteRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        binding.voteRecyclerView.setAdapter(adapter);
    }

    // 设置底部导航
    private void setupBottomNav() {
        binding.homeTab.setSelected(true);

        // 首页点击
        binding.homeTab.setOnClickListener(v -> {
            binding.homeTab.setSelected(true);
            binding.myTab.setSelected(false);
        });

        // 我的点击
        binding.myTab.setOnClickListener(v -> {
            binding.homeTab.setSelected(false);
            binding.myTab.setSelected(true);
            if (isUserLoggedIn()) {
                Intent intent = new Intent(HomeActivity.this, MyPageActivity.class);
                intent.putExtra("USER_EMAIL", getCurrentUserEmail());
                startActivity(intent);
            } else {
                redirectToLogin();
            }
        });
    }

    // 设置悬浮按钮
    private void setupFabButton() {
        binding.fabCreate.setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(HomeActivity.this, CreateVoteActivity.class));
            } else {
                redirectToLogin();
            }
        });
    }

    // 设置快捷功能
    private void setupQuickFunctions() {
        // 创建问卷
        binding.createVoteLayout.setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(HomeActivity.this, CreateVoteActivity.class));
            } else {
                redirectToLogin();
            }
        });

        // 我的问卷
        binding.myVotesLayout.setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(HomeActivity.this, MyVoteActivity.class));
            } else {
                redirectToLogin();
            }
        });

        // 问卷模板
        binding.voteTemplatesLayout.setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(HomeActivity.this, VoteTemplateActivity.class));
            } else {
                redirectToLogin();
            }
        });

        // 结果统计
        binding.statisticsLayout.setOnClickListener(v -> {
            if (isUserLoggedIn()) {
                startActivity(new Intent(HomeActivity.this, ResultStatisticsActivity.class));
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
        startActivity(new Intent(HomeActivity.this, LoginActivity.class));
    }

    // 获取当前登录用户邮箱
    private String getCurrentUserEmail() {
        SharedPreferences sp = getSharedPreferences("user_info", MODE_PRIVATE);
        return sp.getString("user_email", "");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}