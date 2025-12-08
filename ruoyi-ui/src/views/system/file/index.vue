<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="作业编号" prop="batchId">
        <el-input
          v-model="queryParams.batchId"
          placeholder="请输入作业编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件名" prop="fileName">
        <el-input
          v-model="queryParams.fileName"
          placeholder="请输入文件名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>


      </el-form-item>
      <el-form-item label="文件大小" prop="fileSize">
        <el-input
          v-model="queryParams.fileSize"
          placeholder="请输入文件大小"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="AI得分" prop="aiScore">
        <el-input
          v-model="queryParams.aiScore"
          placeholder="请输入AI得分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:file:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:file:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:file:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:file:export']"
        >导出</el-button>
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

    <el-popover
      v-else
      trigger="click"
      placement="right"
      width="800"
    >

      <div style="max-height: 600px; overflow: auto; background-color: #282c34; color: #abb2bf; padding: 15px; border-radius: 4px;">
        <pre style="margin: 0; font-family: Consolas, 'Courier New', monospace; white-space: pre-wrap;">{{ scope.row.codeContent }}</pre>
      </div>


      <el-button slot="reference" type="text" icon="el-icon-document">
        查看代码
      </el-button>
    </el-popover>
  </template>
</el-table-column>
      <el-table-column label="判题结果" align="center" prop="judgeResult" />
      <el-table-column label="AI得分" align="center" prop="aiScore" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:file:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:file:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改作业文件明细对话框 -->
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
        <el-form-item label="AI得分" prop="aiScore">
          <el-input v-model="form.aiScore" placeholder="请输入AI得分" />
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
import { listFile, getFile, delFile, addFile, updateFile } from "@/api/system/file"

export default {
  name: "File",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 作业文件明细表格数据
      fileList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
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
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        batchId: [
          { required: true, message: "作业编号不能为空", trigger: "blur" }
        ],
        fileName: [
          { required: true, message: "文件名不能为空", trigger: "blur" }
        ],

        fileSize: [
          { required: true, message: "文件大小不能为空", trigger: "blur" }
        ],

        createTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询作业文件明细列表 */
    getList() {
      this.loading = true
      listFile(this.queryParams).then(response => {
        this.fileList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        batchId: null,
        fileName: null,
        fileExt: null,
        fileSize: null,
        filePath: null,
        codeContent: null,
        judgeResult: null,
        aiScore: null,
        createTime: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加作业文件明细"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getFile(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改作业文件明细"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFile(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addFile(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除作业文件明细编号为"' + ids + '"的数据项？').then(function() {
        return delFile(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/file/export', {
        ...this.queryParams
      }, `file_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
