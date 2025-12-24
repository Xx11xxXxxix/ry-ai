package com.example.homework;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;
import java.util.List;
import java.util.Random;

public class VoteAdapter extends RecyclerView.Adapter<VoteAdapter.VoteViewHolder> {
    private Context context;
    private List<DatabaseHelper.Vote> votes;
    private OnVoteOperationListener listener;

    public VoteAdapter(List<DatabaseHelper.Vote> votes) {
        this.votes = votes;
    }

    public void setContext(Context context) {
        this.context = context;
    }

    public void setOnVoteOperationListener(OnVoteOperationListener listener) {
        this.listener = listener;
    }

    @NonNull
    @Override
    public VoteViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_vote, parent, false);
        return new VoteViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull VoteViewHolder holder, int position) {
        DatabaseHelper.Vote vote = votes.get(position);
        holder.titleTextView.setText(vote.getTitle());
        holder.descriptionTextView.setText(vote.getDescription());
        holder.dateTextView.setText(vote.getCreatedAt());
        
        // 设置参与人数和选项数（模拟数据）
        Random random = new Random();
        int participants = 10 + random.nextInt(90); // 10-100之间的随机数
        int options = 2 + random.nextInt(6); // 2-7之间的随机数
        
        holder.participantsTextView.setText("参与人数: " + participants);
        holder.optionsTextView.setText("选项数: " + options);
        
        // 设置按钮点击事件
        holder.viewButton.setOnClickListener(v -> {
            // 跳转到投票详情页面
            if (context != null) {
                Intent intent = new Intent(context, VoteDetailActivity.class);
                intent.putExtra("VOTE_TITLE", vote.getTitle());
                context.startActivity(intent);
            }
        });
        
        holder.statisticsButton.setOnClickListener(v -> {
            if (listener != null) {
                listener.onViewStatistics(vote);
            }
        });
        
        holder.hideButton.setOnClickListener(v -> {
            if (listener != null) {
                // 显示确认对话框
                showHideConfirmationDialog(vote, position);
            }
        });
    }

    @Override
    public int getItemCount() {
        return votes.size();
    }

    // 更新数据的方法
    public void updateData(List<DatabaseHelper.Vote> newVotes) {
        this.votes = newVotes;
        notifyDataSetChanged();
    }

    // 删除指定位置的数据
    public void removeItem(int position) {
        votes.remove(position);
        notifyItemRemoved(position);
    }

    // 显示隐藏投票确认对话框
    private void showHideConfirmationDialog(DatabaseHelper.Vote vote, int position) {
        if (context != null && context instanceof AppCompatActivity) {
            new AlertDialog.Builder(context)
                    .setTitle("隐藏投票")
                    .setMessage("确定要隐藏这个投票吗？您可以在设置中重新显示它。")
                    .setPositiveButton("确定", (dialog, which) -> {
                        if (listener != null) {
                            listener.onDeleteVote(vote, position);
                        }
                    })
                    .setNegativeButton("取消", null)
                    .show();
        }
    }

    static class VoteViewHolder extends RecyclerView.ViewHolder {
        TextView titleTextView;
        TextView descriptionTextView;
        TextView dateTextView;
        TextView participantsTextView;
        TextView optionsTextView;
        Button viewButton;
        Button statisticsButton;
        Button hideButton;

        VoteViewHolder(@NonNull View itemView) {
            super(itemView);
            titleTextView = itemView.findViewById(R.id.vote_title);
            descriptionTextView = itemView.findViewById(R.id.vote_description);
            dateTextView = itemView.findViewById(R.id.vote_date);
            participantsTextView = itemView.findViewById(R.id.vote_participants);
            optionsTextView = itemView.findViewById(R.id.vote_options);
            viewButton = itemView.findViewById(R.id.btn_view);
            statisticsButton = itemView.findViewById(R.id.btn_statistics);
            hideButton = itemView.findViewById(R.id.btn_hide);
        }
    }

    // 定义回调接口
    public interface OnVoteOperationListener {
        void onEditVote(DatabaseHelper.Vote vote);
        void onViewStatistics(DatabaseHelper.Vote vote);
        void onDeleteVote(DatabaseHelper.Vote vote, int position);
    }
}