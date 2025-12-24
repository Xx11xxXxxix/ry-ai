package com.example.homework;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class VoteListAdapter extends RecyclerView.Adapter<VoteListAdapter.VoteViewHolder> {
    // 上下文（用于启动Activity）
    private Context mContext;
    private List<VoteItem> voteItemList;
    private OnVoteItemClickListener listener;

    // 问卷项实体类
    public static class VoteItem {
        private String title;
        private String timeRange;
        private int voteCount;
        private boolean isExpired;

        public VoteItem(String title, String timeRange, int voteCount, boolean isExpired) {
            this.title = title;
            this.timeRange = timeRange;
            this.voteCount = voteCount;
            this.isExpired = isExpired;
        }

        // Getter方法
        public String getTitle() {
            return title;
        }

        public String getTimeRange() {
            return timeRange;
        }

        public int getVoteCount() {
            return voteCount;
        }

        public boolean isExpired() {
            return isExpired;
        }
    }

    // 点击事件接口
    public interface OnVoteItemClickListener {
        void onItemClick(VoteItem item);
        void onShareClick(VoteItem item);
        void onResultsClick(VoteItem item);
        void onParticipateClick(VoteItem item);
    }

    // 构造方法（增加Context参数，解决颜色获取问题）
    public VoteListAdapter(Context context, List<VoteItem> voteItemList, OnVoteItemClickListener listener) {
        this.mContext = context;
        this.voteItemList = voteItemList;
        this.listener = listener;
    }

    @NonNull
    @Override
    public VoteViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        // 使用新的布局文件
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_vote_card, parent, false);
        return new VoteViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull VoteViewHolder holder, int position) {
        // 空数据判断（避免NullPointerException）
        if (voteItemList == null || voteItemList.isEmpty()) {
            return;
        }

        VoteItem item = voteItemList.get(position);

        // 绑定数据到控件
        holder.tvTitle.setText(item.getTitle());
        holder.tvTimeRange.setText(item.getTimeRange() + " | 参与人数：" + item.getVoteCount());

        // 过期状态
        if (item.isExpired()) {
            holder.tvStatus.setText("已结束");
            holder.tvStatus.setTextColor(mContext.getResources().getColor(R.color.error));
        } else {
            holder.tvStatus.setText("进行中");
            holder.tvStatus.setTextColor(mContext.getResources().getColor(R.color.success));
        }

        // 条目点击事件
        holder.itemView.setOnClickListener(v -> {
            if (listener != null) {
                listener.onItemClick(item);
            }
        });
        
        // 分享点击事件
        holder.tvShare.setOnClickListener(v -> {
            if (listener != null) {
                listener.onShareClick(item);
            }
            
            // 实现分享功能
            Intent shareIntent = new Intent(Intent.ACTION_SEND);
            shareIntent.setType("text/plain");
            shareIntent.putExtra(Intent.EXTRA_TEXT, "快来参与投票：" + item.getTitle() + " 时间：" + item.getTimeRange());
            mContext.startActivity(Intent.createChooser(shareIntent, "分享投票"));
        });
        
        // 查看结果点击事件
        holder.tvResults.setOnClickListener(v -> {
            if (listener != null) {
                listener.onResultsClick(item);
            }
            
            // 跳转到结果统计页面
            Intent intent = new Intent(mContext, ResultStatisticsActivity.class);
            intent.putExtra("vote_title", item.getTitle());
            mContext.startActivity(intent);
        });
        
        // 参与投票点击事件
        holder.tvParticipate.setOnClickListener(v -> {
            if (listener != null) {
                listener.onParticipateClick(item);
            }
            
            // 跳转到投票详情页面
            Intent intent = new Intent(mContext, VoteDetailActivity.class);
            intent.putExtra("VOTE_TITLE", item.getTitle());
            mContext.startActivity(intent);
        });
    }

    // 获取列表数量（空数据时返回0）
    @Override
    public int getItemCount() {
        return voteItemList == null ? 0 : voteItemList.size();
    }

    // 视图持有者（确保控件ID与item_vote_card.xml完全一致）
    public static class VoteViewHolder extends RecyclerView.ViewHolder {
        TextView tvTitle, tvTimeRange, tvStatus, tvShare, tvResults, tvParticipate;

        public VoteViewHolder(@NonNull View itemView) {
            super(itemView);
            // 绑定item_vote_card.xml中的控件ID（必须完全匹配）
            tvTitle = itemView.findViewById(R.id.tv_vote_title);
            tvTimeRange = itemView.findViewById(R.id.tv_time_range);
            tvStatus = itemView.findViewById(R.id.tv_status);
            tvShare = itemView.findViewById(R.id.tv_share);
            tvResults = itemView.findViewById(R.id.tv_results);
            tvParticipate = itemView.findViewById(R.id.tv_participate);
        }
    }

    // 可选：添加更新列表数据的方法
    public void updateData(List<VoteItem> newData) {
        this.voteItemList = newData;
        notifyDataSetChanged();
    }
}