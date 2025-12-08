<!-- src/views/homework/UploadHomework.vue -->
<template>
  <div class="app-container">
    <el-card class="box-card">
      <template #header>
        <span style="font-size: 18px; font-weight: bold;">作业提交系统</span>
      </template>

      <!-- 拖拽上传区域 -->
      <el-upload
        drag
        multiple
        :action="uploadUrl"
        :headers="headers"
        :data="uploadData"
        :on-progress="handleProgress"
        :on-success="handleSuccess"
        :on-error="handleError"
        :before-upload="beforeUpload"
        :file-list="fileList"
        style="text-align: center;"
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将 .c / .cpp / .java 文件拖到此处，或<em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          一次可上传多个文件，自动识别文件名与代码内容，上传后 AI 自动批改
        </div>
      </el-upload>

      <!-- 上传进度与结果 -->
      <div v-if="uploading" style="margin-top: 20px; text-align: center;">
        <el-progress :percentage="progress" :stroke-width="20" style="width: 60%; margin: 0 auto;" />
        <p>正在上传并等待 AI 批改，请勿关闭页面...</p>
      </div>

      <!-- 成功后显示批次信息 -->
      <el-alert
        v-if="batchId"
        title="上传成功！AI 批改完成"
        type="success"
        style="margin-top: 20px;"
        :description="`批次号：${batchNo}，共 ${fileCount} 个文件，AI 总得分：${totalScore} 分`"
        show-icon
        :closable="false">
        <template #title>
          <span style="font-size: 16px;">上传成功！</span>
        </template>
        <el-button type="primary" size="small" @click="goToDetail">查看详细评语</el-button>
      </el-alert>
    </el-card>
  </div>
</template>

<script>
import { getToken } from '@/utils/auth'

export default {
  data() {
    return {
      uploadUrl: process.env.VUE_APP_BASE_API + '/homework/upload',  // 你的上传接口
      headers: { Authorization: 'Bearer ' + getToken() },
      uploadData: {
        studentId: this.$store.getters.userId,      // 自动获取登录学生ID
        studentName: this.$store.getters.name
      },
      fileList: [],
      uploading: false,
      progress: 0,
      batchId: null,
      batchNo: '',
      fileCount: 0,
      totalScore: null
    }
  },
  methods: {
    beforeUpload(file) {
      const isCode = /\.(c|cpp|java|py)$/.test(file.name.toLowerCase())
      if (!isCode) {
        this.$message.error('只能上传源码文件！')
        return false
      }
      if (file.size > 10 * 1024 * 1024) {
        this.$message.error('文件不能超过 10MB！')
        return false
      }
      return true
    },
    handleProgress(event, file, fileList) {
      this.uploading = true
      this.progress = Math.round((event.loaded * 100) / event.total)
    },
    handleSuccess(response) {
      if (response.code === 200) {
        this.batchId = response.data.batchId
        this.batchNo = response.data.batchNo
        this.fileCount = response.data.fileCount
        this.totalScore = response.data.totalScore
        this.$message.success('上传成功，AI 批改完成！')
      } else {
        this.$message.error(response.msg || '上传失败')
      }
      this.uploading = false
      this.progress = 100
    },
    handleError() {
      this.$message.error('上传失败，请重试')
      this.uploading = false
    },
    goToDetail() {
      this.$router.push(`/system/batch`)  // 跳转到你生成的批次列表页查看详情
    }
  }
}
</script>

<style scoped>
.el-icon-upload { font-size: 67px; color: #409EFF; margin: 40px 0 16px; }
</style>
