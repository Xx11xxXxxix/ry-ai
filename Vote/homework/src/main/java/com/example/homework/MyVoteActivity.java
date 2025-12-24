package com.example.homework;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import com.example.homework.databinding.ActivityMyVoteBinding;
import java.util.List;

public class MyVoteActivity extends AppCompatActivity implements VoteAdapter.OnVoteOperationListener {
    private ActivityMyVoteBinding binding;
    private VoteAdapter voteAdapter;
    private DatabaseHelper dbHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMyVoteBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据库助手
        dbHelper = new DatabaseHelper(this);

        // 设置RecyclerView
        binding.recyclerViewVotes.setLayoutManager(new LinearLayoutManager(this));

        // 加载投票数据
        loadVotes();

        // 返回按钮点击事件
        binding.btnBack.setOnClickListener(v -> finish());
    }

    private void loadVotes() {
        // 在真实应用中，你需要从登录信息中获取用户ID
        // 这里假设用户ID为1
        List<DatabaseHelper.Vote> votes = dbHelper.getUserVotes(1);
        voteAdapter = new VoteAdapter(votes);
        voteAdapter.setContext(this);
        voteAdapter.setOnVoteOperationListener(this);
        binding.recyclerViewVotes.setAdapter(voteAdapter);
        
        // 更新统计信息
        updateStatistics(votes.size());
    }

    /**
     * 更新统计信息
     * @param totalVotes 总投票数
     */
    private void updateStatistics(int totalVotes) {
        // 设置总投票数
        binding.tvTotalVotes.setText(String.valueOf(totalVotes));
        
        // 模拟设置参与者数量（实际应用中应从数据库获取）
        binding.tvParticipants.setText(String.valueOf(totalVotes * 15)); // 假设每个投票平均有15个参与者
    }

    @Override
    protected void onResume() {
        super.onResume();
        // 当页面重新激活时刷新数据
        if (voteAdapter != null) {
            loadVotes();
            voteAdapter.notifyDataSetChanged();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
    
    @Override
    public void onEditVote(DatabaseHelper.Vote vote) {
        Toast.makeText(this, "编辑投票: " + vote.getTitle(), Toast.LENGTH_SHORT).show();
        // 这里可以跳转到编辑页面
    }
    
    @Override
    public void onViewStatistics(DatabaseHelper.Vote vote) {
        // 跳转到统计页面
        Intent intent = new Intent(this, ResultStatisticsActivity.class);
        intent.putExtra("vote_title", vote.getTitle());
        startActivity(intent);
    }
    
    @Override
    public void onDeleteVote(DatabaseHelper.Vote vote, int position) {
        new AlertDialog.Builder(this)
                .setTitle("确认删除")
                .setMessage("确定要删除投票 \"" + vote.getTitle() + "\" 吗？此操作不可撤销。")
                .setPositiveButton("删除", (dialog, which) -> {
                    // 这里应该调用数据库删除方法
                    // 由于目前数据库没有提供删除方法，暂时只从列表中移除
                    voteAdapter.removeItem(position);
                    Toast.makeText(this, "已删除: " + vote.getTitle(), Toast.LENGTH_SHORT).show();
                    
                    // 更新统计信息
                    updateStatistics(voteAdapter.getItemCount());
                })
                .setNegativeButton("取消", null)
                .show();
    }
}
