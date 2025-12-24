package com.example.homework;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import com.example.homework.databinding.ActivityResultStatisticsBinding;
import com.google.android.material.card.MaterialCardView;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ResultStatisticsActivity extends AppCompatActivity {
    private ActivityResultStatisticsBinding binding;
    private DatabaseHelper dbHelper;
    private int voteId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityResultStatisticsBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据库助手
        dbHelper = new DatabaseHelper(this);

        // 获取传递的投票ID
        voteId = getIntent().getIntExtra("vote_id", -1);
        
        // 返回按钮点击事件
        binding.btnBack.setOnClickListener(v -> finish());
        
        // 初始化统计数据
        initStatisticsData();
    }
    
    /**
     * 初始化统计数据
     */
    private void initStatisticsData() {
        if (voteId == -1) {
            return;
        }
        
        // 获取投票信息
        DatabaseHelper.Vote vote = dbHelper.getVoteById(voteId);
        if (vote != null) {
            binding.tvVoteTitle.setText(vote.getTitle());
        }
        
        // 获取投票选项数据
        List<DatabaseHelper.VoteOption> options = dbHelper.getVoteOptions(voteId);
        
        // 计算总票数
        int totalVotes = 0;
        for (DatabaseHelper.VoteOption option : options) {
            totalVotes += option.getVoteCount();
        }
        
        // 设置总参与人数
        binding.tvTotalParticipants.setText(totalVotes + "人");
        
        // 添加选项统计数据
        addOptionStatistics(options, totalVotes);
    }
    
    /**
     * 添加选项统计数据
     */
    private void addOptionStatistics(List<DatabaseHelper.VoteOption> options, int totalVotes) {
        // 清空容器
        binding.optionsContainer.removeAllViews();
        
        // 对选项进行排序
        sortOptions(options);
        
        for (int i = 0; i < options.size(); i++) {
            DatabaseHelper.VoteOption option = options.get(i);
            
            // 创建选项统计视图
            View optionView = LayoutInflater.from(this).inflate(R.layout.item_vote_option, null);
            
            // 查找视图组件
            TextView optionText = optionView.findViewById(R.id.optionText);
            TextView voteCountText = optionView.findViewById(R.id.voteCountText);
            TextView votePercentageText = optionView.findViewById(R.id.votePercentageText);
            ProgressBar progressBar = optionView.findViewById(R.id.voteProgressBar);
            
            // 设置数据
            optionText.setText(option.getOptionText());
            voteCountText.setText(option.getVoteCount() + "票");
            
            // 计算百分比
            double percentage = totalVotes > 0 ? (double) option.getVoteCount() / totalVotes * 100 : 0;
            votePercentageText.setText(String.format("%.1f", percentage) + "%");
            
            // 设置进度条
            progressBar.setProgress((int) percentage);
            progressBar.setVisibility(View.VISIBLE);
            
            // 为进度条设置颜色以区分不同选项
            if (i % 4 == 0) {
                progressBar.setProgressTintList(getResources().getColorStateList(R.color.primary_gradient_end, null));
            } else if (i % 4 == 1) {
                progressBar.setProgressTintList(getResources().getColorStateList(R.color.secondary_gradient_start, null));
            } else if (i % 4 == 2) {
                progressBar.setProgressTintList(getResources().getColorStateList(R.color.success, null));
            } else {
                progressBar.setProgressTintList(getResources().getColorStateList(R.color.warning, null));
            }
            
            // 将视图添加到容器中
            binding.optionsContainer.addView(optionView);
        }
    }
    
    /**
     * 根据设置对选项进行排序
     */
    private void sortOptions(List<DatabaseHelper.VoteOption> options) {
        // 从SharedPreferences获取排序设置
        android.content.SharedPreferences sharedPreferences = getSharedPreferences("VoteWallSettings", MODE_PRIVATE);
        int resultOrder = sharedPreferences.getInt("result_order", 0); // 默认为ORDER_DEFAULT
        
        switch (resultOrder) {
            case 1: // ORDER_COUNT_DESC
                Collections.sort(options, new Comparator<DatabaseHelper.VoteOption>() {
                    @Override
                    public int compare(DatabaseHelper.VoteOption o1, DatabaseHelper.VoteOption o2) {
                        return Integer.compare(o2.getVoteCount(), o1.getVoteCount());
                    }
                });
                break;
            case 2: // ORDER_COUNT_ASC
                Collections.sort(options, new Comparator<DatabaseHelper.VoteOption>() {
                    @Override
                    public int compare(DatabaseHelper.VoteOption o1, DatabaseHelper.VoteOption o2) {
                        return Integer.compare(o1.getVoteCount(), o2.getVoteCount());
                    }
                });
                break;
            case 0: // ORDER_DEFAULT (保持原有顺序)
            default:
                // 不进行排序，保持数据库中的顺序
                break;
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}