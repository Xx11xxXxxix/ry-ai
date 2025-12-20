<template>
  <div class="app-container home">
    <!-- 顶部标题与简介区域 -->
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          欢迎使用面向过程性评价的计算机通识课程AI测评平台
        </blockquote>
        <hr />
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <!-- 左侧：项目核心介绍 -->
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>面向过程性评价的计算机通识课程AI测评平台</h2>
        <p>
          本项目致力于构建一套适用于高校计算机通识课程教学场景的智能作业评审系统。
          通过引入人工智能技术，解决传统教学中人工批改效率低、反馈滞后等痛点，
          辅助教师高效完成教学评价，助力学生编程思维培养。
        </p>
        <p>
          <b>当前版本：</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="handleStartHw"
            >开始测评</el-button
          >
          <el-button
            icon="el-icon-s-data"
            size="mini"
            plain
            @click="handleViewReport"
            >查看学情报告</el-button
          >
        </p>
      </el-col>

      <!-- 右侧：技术架构图或关键指标（这里用文字列表模拟） -->
      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术核心</h2>
            <ul class="list-group-striped">
              <li><i class="el-icon-cpu"></i> 核心架构：AI模型 + 规则引擎</li>
              <li><i class="el-icon-monitor"></i> 支持语言：Python, C, C++</li>
              <li><i class="el-icon-aim"></i> 评价维度：结果 + 过程</li>
              <li><i class="el-icon-connection"></i> 部署方式：本地化/云端混合</li>
            </ul>
          </el-col>
          <el-col :span="12">
             <h2>系统状态</h2>
             <ul class="list-group-striped">
              <li><i class="el-icon-user"></i> AI判题服务：<span style="color: green">运行中</span></li>
              <li><i class="el-icon-setting"></i> 规则引擎库：已加载</li>
              <li><i class="el-icon-s-platform"></i> 数据库连接：正常</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>

    <el-divider />

    <!-- 底部：三大核心功能卡片 -->
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="8" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-s-check"></i> 智能作业评审</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-success" style="color: #67C23A"></i> <b>代码规范检测：</b> 自动识别变量命名、缩进风格等规范问题。
            </p>
            <p>
              <i class="el-icon-warning" style="color: #E6A23C"></i> <b>逻辑漏洞识别：</b> 深度分析代码逻辑，指出潜在Bug。
            </p>
            <p>
              <i class="el-icon-video-play" style="color: #409EFF"></i> <b>运行验证：</b> 自动化测试用例运行，确保功能正确性。
            </p>
          </div>
        </el-card>
      </el-col>

      <el-col :xs="24" :sm="24" :md="8" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-data-line"></i> 过程性评价体系</span>
          </div>
          <div class="body">
            <p>
              突破传统工具仅关注结果的局限，系统自动记录并分析学生的<b>调试过程</b>与<b>代码迭代轨迹</b>。
            </p>
            <p style="margin-top: 10px">
              通过分析编程习惯与修改路径，精准定位学生思维误区，实现“过程与结果融合”的综合评价，助力计算思维培养。
            </p>
          </div>
        </el-card>
      </el-col>

      <el-col :xs="24" :sm="24" :md="8" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-s-opportunity"></i> 教学辅助支持</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-chat-dot-square"></i> <b>集成错误分析：</b> 自动生成错误归因报告，反馈指导学生。
            </p>
            <p>
              <i class="el-icon-data-analysis"></i> <b>学情分析：</b> 辅助教师掌握班级整体掌握情况，调整教学进度。
            </p>
            <p>
              <i class="el-icon-collection-tag"></i> <b>学习追踪：</b> 记录学生成长档案，提供个性化学习建议。
            </p>
          </div>
        </el-card>
      </el-col>
    </el-row>
    
    <el-row :gutter="20" style="margin-top: 20px; margin-bottom: 20px;">
      <el-col :xs="24" :sm="24" :md="8" :lg="8">
        <el-card class="update-log" style="height: 260px;"> 
          <div slot="header" class="clearfix">
            <span>
              <i class="el-icon-pie-chart" style="color: #409EFF; margin-right: 5px;"></i> 
              学情诊断报告 (AI生成)
            </span>
          </div>
          
          <div class="body" style="padding: 0; height: 100%; display: flex; align-items: center; justify-content: center;">
            <!-- 图片区域 -->
            <img 
              src="https://echarts.apache.org/examples/data/thumb/mix-line-bar.webp" 
              style="width: 100%; height: 160px; object-fit: contain;" 
              alt="学情报告" 
            />
          </div>
        </el-card>
      </el-col>
      
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      version: "1.0.0"
    };
  },
  methods: {
    handleStartHw() {
      this.$router.push({ 
        path: '/homework/batch2', 
        // query: { action: 'add' } 
      });
    },
    handleViewReport() {
      this.$router.push('/homework/file2');
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;
    line-height: 1.8; // 增加行高，提升阅读体验

    b {
      font-weight: 700;
    }
  }

  .list-group-striped > li {
    border-bottom: 1px solid #e7eaec;
    border-top: 1px solid #e7eaec;
    margin-bottom: -1px;
    padding: 11px 0;
    font-size: 14px;
  }

  .update-log {
    height: 260px; // 固定卡片高度，使排版更整齐
    .body {
      padding: 10px;
      font-size: 14px;
      color: #666;
    }
    i {
        margin-right: 5px;
    }
  }
}
</style>
