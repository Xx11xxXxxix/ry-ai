<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="24" style="margin-bottom: 20px;">
        <el-card>
          <div slot="header">
            <span style="font-weight: bold; font-size: 16px"><i class="el-icon-s-data"></i> 班级整体学情看板</span>
          </div>
          <div style="display: flex; justify-content: space-around; text-align: center;">
             <div>
               <h3 style="color: #409EFF">45</h3>
               <span style="font-size: 12px; color: #909399">总提交人数</span>
             </div>
             <div>
               <h3 style="color: #67C23A">88.5</h3>
               <span style="font-size: 12px; color: #909399">平均分 (AI评分)</span>
             </div>
             <div>
               <h3 style="color: #E6A23C">12</h3>
               <span style="font-size: 12px; color: #909399">待人工复核</span>
             </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :lg="12">
        <el-card>
          <div slot="header">
            <span><i class="el-icon-s-marketing"></i> 知识点掌握度统计</span>
          </div>
          <div class="chart-wrapper">
            <div ref="barChart" style="height: 350px; width: 100%;"></div>
          </div>
        </el-card>
      </el-col>

      <el-col :xs="24" :sm="24" :lg="12">
        <el-card>
          <div slot="header">
            <span><i class="el-icon-pie-chart"></i> 成绩区间分布</span>
          </div>
          <div class="chart-wrapper">
            <div ref="pieChart" style="height: 350px; width: 100%;"></div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  name: "Analysis",
  data() {
    return {
      barChart: null,
      pieChart: null
    };
  },
  mounted() {
    this.$nextTick(() => {
      this.initBarChart();
      this.initPieChart();
      window.addEventListener("resize", this.resizeCharts);
    });
  },
  beforeDestroy() {
    window.removeEventListener("resize", this.resizeCharts);
    if (this.barChart) this.barChart.dispose();
    if (this.pieChart) this.pieChart.dispose();
  },
  methods: {
    resizeCharts() {
      this.barChart && this.barChart.resize();
      this.pieChart && this.pieChart.resize();
    },
    initBarChart() {
      this.barChart = echarts.init(this.$refs.barChart);
      this.barChart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { type: 'shadow' }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: ['变量与类型', '循环结构', '数组', '函数', '指针', '结构体'],
          axisTick: { alignWithLabel: true }
        },
        yAxis: {
          type: 'value',
          name: '平均得分率(%)'
        },
        series: [
          {
            name: '掌握度',
            type: 'bar',
            barWidth: '50%',
            data: [95, 88, 70, 82, 55, 60], 
            itemStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: '#83bff6' },
                { offset: 0.5, color: '#188df0' },
                { offset: 1, color: '#188df0' }
              ])
            }
          }
        ]
      });
    },
    initPieChart() {
      this.pieChart = echarts.init(this.$refs.pieChart);
      this.pieChart.setOption({
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '5%',
          left: 'center'
        },
        series: [
          {
            name: '成绩分布',
            type: 'pie',
            radius: ['40%', '70%'], 
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '20',
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              { value: 15, name: '优秀 (90-100)', itemStyle: { color: '#67C23A' } },
              { value: 20, name: '良好 (80-89)', itemStyle: { color: '#409EFF' } },
              { value: 8, name: '及格 (60-79)', itemStyle: { color: '#E6A23C' } },
              { value: 2, name: '不及格 (<60)', itemStyle: { color: '#F56C6C' } }
            ]
          }
        ]
      });
    }
  }
};
</script>

<style scoped>
.chart-wrapper {
  padding: 10px;
  background: #fff;
}
</style>