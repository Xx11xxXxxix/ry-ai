package com.example.homework;

import android.annotation.SuppressLint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import java.util.List;

public class VoteOptionAdapter extends RecyclerView.Adapter<VoteOptionAdapter.ViewHolder> {
    public static class OptionItem {
        private String name;
        private int votes;
        private int totalVotes;

        public OptionItem(String name, int votes, int totalVotes) {
            this.name = name;
            this.votes = votes;
            this.totalVotes = totalVotes;
        }

        public String getName() { return name; }
        public int getVotes() { return votes; }
        public int getTotalVotes() { return totalVotes; }
        public String getPercentage() {
            return String.format("%.1f%%", (votes * 100.0 / totalVotes));
        }
    }

    public interface OnOptionSelectListener {
        void onOptionSelected(int position);
    }

    private List<OptionItem> optionItems;
    private OnOptionSelectListener listener;
    private int selectedPosition = -1;

    public VoteOptionAdapter(List<OptionItem> optionItems, OnOptionSelectListener listener) {
        this.optionItems = optionItems;
        this.listener = listener;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        RadioButton radioButton;
        TextView optionText, voteCountText, votePercentageText;
        ProgressBar progressBar;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            radioButton = itemView.findViewById(R.id.voteOptionRadio);
            optionText = itemView.findViewById(R.id.optionText);
            voteCountText = itemView.findViewById(R.id.voteCountText);
            votePercentageText = itemView.findViewById(R.id.votePercentageText);
            progressBar = itemView.findViewById(R.id.voteProgressBar);
        }
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_vote_option, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, @SuppressLint("RecyclerView") int position) {
        OptionItem item = optionItems.get(position);
        holder.optionText.setText(item.getName());
        holder.voteCountText.setText(item.getVotes() + "票");
        holder.votePercentageText.setText(item.getPercentage());

        holder.radioButton.setChecked(position == selectedPosition);

        holder.radioButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectedPosition = position;
                listener.onOptionSelected(position);
                notifyDataSetChanged();
            }
        });

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                holder.radioButton.performClick();
            }
        });
    }

    @Override
    public int getItemCount() {
        return optionItems.size();
    }
}
