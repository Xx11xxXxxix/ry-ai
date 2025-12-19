<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="作业编号" prop="batchId">
        <el-input v-model="queryParams.batchId" placeholder="请输入作业编号" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="文件名" prop="fileName">
        <el-input v-model="queryParams.fileName" placeholder="请输入文件名" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="文件大小" prop="fileSize">
        <el-input v-model="queryParams.fileSize" placeholder="请输入文件大小" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="得分" prop="aiScore">
        <el-input v-model="queryParams.aiScore" placeholder="请输入得分" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['hw:file2:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['hw:file2:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['hw:file2:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="fileList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="作业编号" align="center" prop="batchId" />
      <el-table-column label="文件名" align="center" prop="fileName" />
      <el-table-column label="文件大小(kb)" align="center" prop="fileSize" />

      <el-table-column label="文件内容" align="center" width="120">
        <template slot-scope="scope">
          <span v-if="!scope.row.codeContent">-</span>
          <el-popover v-else trigger="click" placement="right" width="800">
            <div style="max-height: 600px; overflow: auto; background-color: #282c34; color: #abb2bf; padding: 15px; border-radius: 4px;">
              <pre style="margin: 0; font-family: Consolas, 'Courier New', monospace; white-space: pre-wrap;">{{ scope.row.codeContent }}</pre>
            </div>
            <el-button slot="reference" type="text" icon="el-icon-document">查看代码</el-button>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="判题结果" align="center" prop="judgeResult" />
      <el-table-column label="得分" align="center" prop="aiScore" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['hw:file2:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['hw:file2:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改作业文件明细2.0对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="作业编号" prop="batchId">
          <el-input v-model="form.batchId" placeholder="请输入作业编号" />
        </el-form-item>
        <el-form-item label="文件名" prop="fileName">
          <el-input v-model="form.fileName" placeholder="请输入文件名" />
        </el-form-item>
        <el-form-item label="文件大小" prop="fileSize">
          <el-input v-model="form.fileSize" placeholder="请输入文件大小" />
        </el-form-item>
        <el-form-item label="文件内容文本">
          <editor v-model="form.codeContent" :min-height="192"/>
        </el-form-item>
        <el-form-item label="判题结果" prop="judgeResult">
          <el-input v-model="form.judgeResult" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="得分" prop="aiScore">
          <el-input v-model="form.aiScore" placeholder="请输入得分" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFile2, getFile2, delFile2, addFile2, updateFile2 } from "@/api/hw/file2"

export default {
  name: "File2",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      fileList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        batchId: null,
        fileName: null,
        fileExt: null,
        fileSize: null,
        filePath: null,
        codeContent: null,
        judgeResult: null,
        aiScore: null,
      },
      form: {},
      rules: {
        batchId: [{ required: true, message: "作业编号不能为空", trigger: "blur" }],
        fileName: [{ required: true, message: "文件名不能为空", trigger: "blur" }],
        fileSize: [{ required: true, message: "文件大小不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "$comment不能为空", trigger: "blur" }]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.loading = true
      listFile2(this.queryParams).then(response => { // 调用新 API
        this.fileList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        id: null, batchId: null, fileName: null, fileExt: null, fileSize: null, filePath: null,
        codeContent: null, judgeResult: null, aiScore: null, createTime: null
      }
      this.resetForm("form")
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加作业文件明细"
    },
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getFile2(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改作业文件明细"
      })
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFile2(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addFile2(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除作业文件明细编号为"' + ids + '"的数据项？').then(function() {
        return delFile2(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
  }
}
</script>
