<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="学生ID" prop="studentId"><el-input v-model="queryParams.studentId" placeholder="请输入学生ID" clearable @keyup.enter.native="handleQuery"/></el-form-item>
      <el-form-item label="学生姓名" prop="studentName"><el-input v-model="queryParams.studentName" placeholder="请输入学生姓名" clearable @keyup.enter.native="handleQuery"/></el-form-item>
      <el-form-item label="课程号" prop="courseId"><el-input v-model="queryParams.courseId" placeholder="请输入课程号" clearable @keyup.enter.native="handleQuery"/></el-form-item>
      <el-form-item label="批次号" prop="batchNo"><el-input v-model="queryParams.batchNo" placeholder="请输入批次号" clearable @keyup.enter.native="handleQuery"/></el-form-item>
      <el-form-item label="文件数量" prop="fileCount"><el-input v-model="queryParams.fileCount" placeholder="请输入本次提交文件数量" clearable @keyup.enter.native="handleQuery"/></el-form-item>
      <el-form-item label="提交时间" prop="submitTime"><el-date-picker clearable v-model="queryParams.submitTime" type="date" value-format="yyyy-MM-dd" placeholder="请选择提交时间"></el-date-picker></el-form-item>
      <el-form-item label="得分" prop="totalScore"><el-input v-model="queryParams.totalScore" placeholder="请输入得分" clearable @keyup.enter.native="handleQuery"/></el-form-item>
      <el-form-item><el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button><el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button></el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5"><el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['hw:batch2:add']">新增</el-button></el-col>
      <el-col :span="1.5"><el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['hw:batch2:edit']">修改</el-button></el-col>
      <el-col :span="1.5"><el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['hw:batch2:remove']">删除</el-button></el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="batchList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="作业号" align="center" prop="id" />
      <el-table-column label="学生号" align="center" prop="studentId" />
      <el-table-column label="学生姓名" align="center" prop="studentName" />
      <el-table-column label="课程" align="center" prop="courseId" />
      <el-table-column label="提交文件数量" align="center" prop="fileCount" />
      <el-table-column label="提交时间" align="center" prop="submitTime" width="180"><template slot-scope="scope"><span>{{ parseTime(scope.row.submitTime, '{y}-{m}-{d}') }}</span></template></el-table-column>
      <el-table-column label="AI完整评语" align="center" width="150"><template slot-scope="scope"><span v-if="!scope.row.aiReview">-</span><el-popover v-else trigger="click" placement="left" width="500"><div style="max-height: 400px; overflow-y: auto; white-space: pre-wrap;">{{ scope.row.aiReview }}</div><el-button slot="reference" type="text" icon="el-icon-view">查看评语</el-button></el-popover></template></el-table-column>
      <el-table-column label="教师评语" align="center" width="150"><template slot-scope="scope"><span v-if="!scope.row.tcReview">-</span><el-popover v-else trigger="click" placement="left" width="400"><div style="white-space: pre-wrap;">{{ scope.row.tcReview }}</div><el-button slot="reference" type="text" icon="el-icon-edit-outline">查看评语</el-button></el-popover></template></el-table-column>
      <el-table-column label="总评" align="center" prop="totalScore" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-chat-dot-square" @click="handleReview(scope.row)" v-hasPermi="['hw:batch2:edit']">点评</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['hw:batch2:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['hw:batch2:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="课程号" prop="courseId"><el-input v-model="form.courseId" placeholder="请输入课程号" /></el-form-item>
        <el-form-item label="作业文件" prop="files">
          <el-upload ref="upload" class="upload-demo" drag action="#" multiple :auto-upload="false" :on-change="handleFileChange" :on-remove="handleFileRemove" :file-list="fileList">
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <div class="el-upload__tip" slot="tip">自动识别文件名，提交时自动计算数量</div>
          </el-upload>
        </el-form-item>
        <el-form-item label="文件数量"><span>{{ fileList.length }} 个</span></el-form-item>
        <el-form-item label="AI总得分" prop="totalScore" v-if="form.id"><el-input v-model="form.totalScore" placeholder="系统评分" /></el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer"><el-button type="primary" @click="submitForm">确 定</el-button><el-button @click="cancel">取 消</el-button></div>
    </el-dialog>

    <el-dialog title="教师作业点评" :visible.sync="openReview" width="600px" append-to-body>
      <el-form ref="reviewForm" :model="form" label-width="100px">
        <el-row>
          <el-col :span="12"><el-form-item label="学生姓名："><span>{{ form.studentName }}</span></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="提交时间："><span>{{ form.submitTime }}</span></el-form-item></el-col>
        </el-row>
        <el-form-item label="AI 建议得分："><el-tag type="info">{{ form.totalScore || 0 }} 分</el-tag></el-form-item>
        <el-form-item label="AI 评语："><div style="background: #f4f4f5; padding: 10px; border-radius: 4px; max-height: 150px; overflow-y: auto;">{{ form.aiReview || '暂无AI评语' }}</div></el-form-item>
        <el-divider content-position="center">教师评分区</el-divider>
        <el-form-item label="最终得分" prop="totalScore"><el-input-number v-model="form.totalScore" :min="0" :max="100" label="分数"></el-input-number></el-form-item>
        <el-form-item label="教师评语" prop="tcReview"><el-input v-model="form.tcReview" type="textarea" :rows="6" placeholder="请输入您的点评意见..."/></el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer"><el-button type="primary" @click="submitReview">提 交 点 评</el-button><el-button @click="openReview = false">取 消</el-button></div>
    </el-dialog>
  </div>
</template>

<script>
import { listBatch2, getBatch2, delBatch2, updateBatch2, addBatchWithFile2 } from "@/api/hw/batch2";

export default {
  name: "Batch2",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      fileList: [],
      showSearch: true,
      total: 0,
      batchList: [],
      title: "",
      open: false,
      openReview: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        studentId: null,
        studentName: null,
        courseId: null,
        batchNo: null,
        fileCount: null,
        submitTime: null,
        aiStatus: null,
        aiReview: null,
        totalScore: null,
      },
      form: {},
      rules: {
        submitTime: [{ required: true, message: "提交时间不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "$comment不能为空", trigger: "blur" }],
        updateTime: [{ required: true, message: "$comment不能为空", trigger: "blur" }]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      listBatch2(this.queryParams).then(response => {
        this.batchList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    handleReview(row) {
      this.reset();
      const id = row.id || this.ids;
      getBatch2(id).then(response => {
        this.form = response.data;
        this.openReview = true;
      });
    },
    submitReview() {
      const reviewData = {
        id: this.form.id,
        tcReview: this.form.tcReview,
        totalScore: this.form.totalScore
      };
      updateBatch2(reviewData).then(response => {
        this.$modal.msgSuccess("点评成功");
        this.openReview = false;
        this.getList();
      });
    },
    reset() {
      this.form = {
        id: null, studentId: null, studentName: null, courseId: null, batchNo: null, fileCount: 0, submitTime: null,
        aiStatus: null, aiReview: null, totalScore: null, createTime: null, updateTime: null
      };
      this.resetForm("form");
      this.fileList = [];
    },
    handleFileChange(file, fileList) {
      this.fileList = fileList;
      this.form.fileCount = fileList.length;
    },
    handleFileRemove(file, fileList) {
      this.fileList = fileList;
      this.form.fileCount = fileList.length;
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "作业提交";
    },
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getBatch2(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改作业";
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBatch2(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            if (this.fileList.length === 0) {
              this.$modal.msgError("请至少上传一个文件");
              return;
            }
            const formData = new FormData();
            formData.append("courseId", this.form.courseId || "");
            if(this.form.batchNo) formData.append("batchNo", this.form.batchNo);
            formData.append("submitTime", this.form.submitTime || new Date().toISOString().slice(0, 10));
            this.fileList.forEach(item => { formData.append("files", item.raw); });
            addBatchWithFile2(formData).then(response => {
              this.$modal.msgSuccess("新增成功，已自动识别 " + this.fileList.length + " 个文件");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除作业提交批次编号为"' + ids + '"的数据项？').then(function() {
        return delBatch2(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
  }
};
</script>
