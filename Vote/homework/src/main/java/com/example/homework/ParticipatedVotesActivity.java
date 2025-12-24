// ParticipatedVotesActivity.java
package com.example.homework;

import android.os.Bundle;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import com.example.homework.databinding.ActivityParticipatedVotesBinding;
import java.util.List;

public class ParticipatedVotesActivity extends AppCompatActivity implements VoteAdapter.OnVoteOperationListener {
    private ActivityParticipatedVotesBinding binding;
    private VoteAdapter voteAdapter;
    private DatabaseHelper dbHelper;
    private int currentUserId = 1; // 默认用户ID，实际应该从登录信息中获取

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityParticipatedVotesBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // 初始化数据库助手
        dbHelper = new DatabaseHelper(this);

        // 设置RecyclerView
        binding.recyclerViewParticipatedVotes.setLayoutManager(new LinearLayoutManager(this));

        // 返回按钮点击事件
        binding.btnBack.setOnClickListener(v -> finish());

        // 加载用户参与的投票列表
        loadParticipatedVotes();
    }

    private void loadParticipatedVotes() {
        // 获取用户参与的投票列表
        List<DatabaseHelper.Vote> votes = dbHelper.getParticipatedVotes(currentUserId);
        voteAdapter = new VoteAdapter(votes);
        voteAdapter.setContext(this);
        voteAdapter.setOnVoteOperationListener(this);
        binding.recyclerViewParticipatedVotes.setAdapter(voteAdapter);
        
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
        
        // 模拟设置进行中投票数量（实际应用中应从数据库获取）
        int ongoingVotes = Math.max(0, totalVotes - 2); // 假设有2个已结束的投票
        binding.tvOngoingVotes.setText(String.valueOf(ongoingVotes));
        
        // 计算隐藏的投票数量（示例数据）
        int hiddenVotes = totalVotes - ongoingVotes;
        binding.tvHiddenVotes.setText(String.valueOf(hiddenVotes));
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
    
    @Override
    public void onEditVote(DatabaseHelper.Vote vote) {
        // 参与的投票不能编辑，跳转到详情页面
        Toast.makeText(this, "查看投票详情: " + vote.getTitle(), Toast.LENGTH_SHORT).show();
    }
    
    @Override
    public void onViewStatistics(DatabaseHelper.Vote vote) {
        // 跳转到统计页面
        Toast.makeText(this, "查看统计: " + vote.getTitle(), Toast.LENGTH_SHORT).show();
    }
    
    @Override
    public void onDeleteVote(DatabaseHelper.Vote vote, int position) {
        // 参与的投票不能删除，可以标记为不感兴趣或者隐藏
        Toast.makeText(this, "已隐藏: " + vote.getTitle(), Toast.LENGTH_SHORT).show();
        
        // 记录隐藏的投票到数据库
        dbHelper.addHiddenVote(currentUserId, vote.getId());
        
        voteAdapter.removeItem(position);
        updateStatistics(voteAdapter.getItemCount());
    }
}