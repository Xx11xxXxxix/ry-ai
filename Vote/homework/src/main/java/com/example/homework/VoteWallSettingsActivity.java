package com.example.homework;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.example.homework.databinding.ActivityVoteWallSettingsBinding;

public class VoteWallSettingsActivity extends AppCompatActivity {
    private ActivityVoteWallSettingsBinding binding;
    private SharedPreferences sharedPreferences;
    
    // SharedPreferences键名常量
    private static final String PREFS_NAME = "VoteWallSettings";
    private static final String KEY_CHART_TYPE = "chart_type";
    private static final String KEY_RESULT_ORDER = "result_order";
    
    // 图表类型常量
    public static final int CHART_TYPE_PIE = 0;
    public static final int CHART_TYPE_BAR = 1;
    
    // 排序方式常量
    public static final int ORDER_DEFAULT = 0;
    public static final int ORDER_COUNT_DESC = 1;
    public static final int ORDER_COUNT_ASC = 2;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityVoteWallSettingsBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        
        // 初始化SharedPreferences
        sharedPreferences = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);
        
        // 加载已保存的设置
        loadSettings();
        
        // 设置返回按钮点击事件
        binding.btnCancel.setOnClickListener(v -> finish());
        
        // 设置确定按钮点击事件
        binding.btnSave.setOnClickListener(v -> {
            // 获取用户选择的设置
            int chartType = getSelectedChartType();
            int resultOrder = getSelectedResultOrder();
            
            // 保存设置
            saveSettings(chartType, resultOrder);
            
            // 返回结果给调用活动
            Intent resultIntent = new Intent();
            resultIntent.putExtra(KEY_CHART_TYPE, chartType);
            resultIntent.putExtra(KEY_RESULT_ORDER, resultOrder);
            setResult(RESULT_OK, resultIntent);
            
            Toast.makeText(this, "设置已保存", Toast.LENGTH_SHORT).show();
            finish();
        });
    }
    
    private void loadSettings() {
        // 从SharedPreferences加载设置
        int chartType = sharedPreferences.getInt(KEY_CHART_TYPE, CHART_TYPE_PIE);
        int resultOrder = sharedPreferences.getInt(KEY_RESULT_ORDER, ORDER_DEFAULT);
        
        // 应用图表类型设置到UI
        switch (chartType) {
            case CHART_TYPE_PIE:
                binding.radioGroupChartType.check(R.id.rb_pie_chart);
                break;
            case CHART_TYPE_BAR:
                binding.radioGroupChartType.check(R.id.rb_bar_chart);
                break;
        }
        
        // 应用排序设置到UI
        switch (resultOrder) {
            case ORDER_DEFAULT:
                binding.radioGroupResultOrder.check(R.id.rb_order_default);
                break;
            case ORDER_COUNT_DESC:
                binding.radioGroupResultOrder.check(R.id.rb_order_count_desc);
                break;
            case ORDER_COUNT_ASC:
                binding.radioGroupResultOrder.check(R.id.rb_order_count_asc);
                break;
        }
    }
    
    private int getSelectedChartType() {
        int selectedId = binding.radioGroupChartType.getCheckedRadioButtonId();
        if (selectedId == R.id.rb_pie_chart) {
            return CHART_TYPE_PIE;
        } else if (selectedId == R.id.rb_bar_chart) {
            return CHART_TYPE_BAR;
        }
        return CHART_TYPE_PIE; // 默认值
    }
    
    private int getSelectedResultOrder() {
        int selectedId = binding.radioGroupResultOrder.getCheckedRadioButtonId();
        if (selectedId == R.id.rb_order_default) {
            return ORDER_DEFAULT;
        } else if (selectedId == R.id.rb_order_count_desc) {
            return ORDER_COUNT_DESC;
        } else if (selectedId == R.id.rb_order_count_asc) {
            return ORDER_COUNT_ASC;
        }
        return ORDER_DEFAULT; // 默认值
    }
    
    private void saveSettings(int chartType, int resultOrder) {
        // 使用SharedPreferences保存设置
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putInt(KEY_CHART_TYPE, chartType);
        editor.putInt(KEY_RESULT_ORDER, resultOrder);
        editor.apply();
    }
    
    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}