/*
 Navicat Premium Dump SQL

 Source Server         : ruoyi
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : ruoyi-vue

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 16/12/2025 14:46:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'hw_upload_batch', '作业提交批次表2.0', NULL, NULL, 'HwUploadBatch2', 'crud', 'element-ui', 'com.ruoyi.hw', 'hw', 'batch2', '作业提交批次2.0', 'wenjiee', '0', '/', '{\"parentMenuId\":2013}', 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29', NULL);
INSERT INTO `gen_table` VALUES (2, 'hw_upload_file', '作业文件明细表2.0', NULL, NULL, 'HwUploadFile2', 'crud', 'element-ui', 'com.ruoyi.hw', 'hw', 'file2', '作业文件明细2.0', 'wenjie', '0', '/', '{\"parentMenuId\":2013}', 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31', NULL);
INSERT INTO `gen_table` VALUES (3, 'biz_product', '商品信息表', NULL, NULL, 'BizProduct', 'crud', '', 'com.ruoyi.system', 'system', 'product', '商品信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-12-12 16:52:05', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'biz_license', '库存卡密表', NULL, NULL, 'BizLicense', 'crud', '', 'com.ruoyi.system', 'system', 'license', '库存卡密', 'ruoyi', '0', '/', NULL, 'admin', '2025-12-12 16:52:05', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '批次ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (2, 1, 'student_id', '学生ID', 'bigint', 'Long', 'studentId', '0', '0', '1', '0', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (3, 1, 'student_name', '学生姓名', 'varchar(50)', 'String', 'studentName', '0', '0', '1', '0', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (4, 1, 'course_id', '课程ID（可选）', 'bigint', 'Long', 'courseId', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (5, 1, 'batch_no', '批次号（时间戳+随机）', 'varchar(32)', 'String', 'batchNo', '0', '0', '1', '0', '0', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (6, 1, 'file_count', '本次提交文件数量', 'int', 'Long', 'fileCount', '0', '0', '1', '0', '0', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (7, 1, 'submit_time', '提交时间', 'datetime', 'Date', 'submitTime', '0', '0', '1', '0', '0', '1', '0', 'EQ', 'datetime', '', 7, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (8, 1, 'ai_status', 'AI评测状态', 'tinyint', 'Long', 'aiStatus', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'select', 'hw_ai_status', 8, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (9, 1, 'ai_review', 'AI完整评语', 'text', 'String', 'aiReview', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'textarea', '', 9, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (10, 1, 'total_score', 'AI总得分', 'decimal(5,2)', 'BigDecimal', 'totalScore', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '1', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (12, 1, 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', '1', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:04:29');
INSERT INTO `gen_table_column` VALUES (13, 2, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (14, 2, 'batch_id', '关联批次ID', 'bigint', 'Long', 'batchId', '0', '0', '1', '0', '0', '1', '0', 'EQ', 'input', '', 2, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (15, 2, 'file_name', '原始文件名', 'varchar(255)', 'String', 'fileName', '0', '0', '1', '0', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (16, 2, 'file_ext', '后缀如 .c .cpp .java', 'varchar(20)', 'String', 'fileExt', '0', '0', '1', '0', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (17, 2, 'file_size', '文件大小字节', 'bigint', 'Long', 'fileSize', '0', '0', '1', '0', '0', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (18, 2, 'file_path', '存储路径 /upload/homework/2025/12/03/xxx.c', 'varchar(500)', 'String', 'filePath', '0', '0', '1', '0', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (19, 2, 'code_content', '文件内容文本（供AI直接读）', 'longtext', 'String', 'codeContent', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'editor', '', 7, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (20, 2, 'judge_result', '判题结果', 'text', 'String', 'judgeResult', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (21, 2, 'ai_score', '单文件AI得分', 'decimal(5,2)', 'BigDecimal', 'aiScore', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');
INSERT INTO `gen_table_column` VALUES (22, 2, 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '1', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-12-05 10:45:51', '', '2025-12-08 14:01:31');

-- ----------------------------
-- Table structure for hw_upload_batch
-- ----------------------------
DROP TABLE IF EXISTS `hw_upload_batch`;
CREATE TABLE `hw_upload_batch`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `student_id` bigint NOT NULL COMMENT '学生ID',
  `student_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生姓名',
  `course_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程ID（可选）',
  `batch_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '批次号（时间戳+随机）',
  `file_count` int NOT NULL DEFAULT 1 COMMENT '本次提交文件数量',
  `submit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `ai_status` tinyint NULL DEFAULT 0 COMMENT 'AI评测状态 0未评 1评测中 2已完成 3失败',
  `ai_review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'AI完整评语',
  `total_score` decimal(5, 2) NULL DEFAULT NULL COMMENT 'AI总得分',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tc_review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '教师评语',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_student`(`student_id` ASC) USING BTREE,
  INDEX `idx_batch`(`batch_no` ASC) USING BTREE,
  INDEX `idx_submit_time`(`submit_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '作业提交批次表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hw_upload_batch
-- ----------------------------
INSERT INTO `hw_upload_batch` VALUES (13, 100, '李白', 'c++', '1765864917515', 1, '2025-12-16 14:01:58', 2, '【总分】：85\n\n【点评】：该学生提交的 `logback.xml` 配置文件主要定义了日志的输出格式、控制台输出以及日志级别控制，功能上基本满足了基本的日志记录需求。以下是对代码的具体分析：\n\n### 功能：\n- **日志路径和格式**：定义了日志的存放路径和输出格式，格式清晰，包含了时间、线程、日志级别、类名、方法名、行号和消息内容。\n- **控制台输出**：配置了控制台输出，并引用了日志输出格式。\n- **日志级别控制**：对特定包（如 `com.ruoyi` 和 `org.springframework`）的日志级别进行了控制。\n- **根日志配置**：设置根日志级别为 `info`，并将日志输出到控制台。\n\n### 优点：\n- **清晰的注释**：代码中有详细的注释，解释了各个配置项的作用，便于理解和维护。\n- **良好的结构**：配置项分类明确，易于阅读和扩展。\n- **灵活的日志级别控制**：针对不同模块和框架设置了不同的日志级别，有助于在开发和运维过程中更好地控制日志输出。\n\n### 缺点和潜在Bug：\n- **文件输出被注释掉了**：虽然在注释中说明了本地开发时文件输出被注释掉了，但在实际部署环境中，可能需要开启文件输出功能以记录日志。建议在配置文件中保留文件输出配置，并通过环境变量或配置中心控制是否启用。\n- **重复配置**：在注释部分和实际配置部分都包含了相同的配置项，虽然注释部分是示例配置，但可能会让阅读者产生混淆。建议将注释部分简化或移除不必要的重复内容。\n- **缺少对文件输出的配置**：虽然注释中提到了文件输出的配置，但在实际配置中未启用。如果需要在生产环境中使用文件输出，需要解注释并调整相应的配置。\n\n### 代码规范：\n- **XML格式规范**：XML结构清晰，标签闭合正确，符合XML标准。\n- **命名规范**：变量命名清晰，如 `log.path` 和 `log.pattern`，易于理解。\n\n### 总体评价：\n该配置文件在功能和结构上都表现良好，但在实际应用中需要根据具体需求调整文件输出配置。代码规范良好，注释清晰，但在注释和实际配置的重复上可以进行优化。总体评分85分，有改进空间但已经具备了良好的基础。', 85.00, '2025-12-16 14:01:58', '2025-12-16 14:04:43', '该学生提交的 `logback.xml` 配置文件主要定义了日志的输出格式、控制台输出以及日志级别控制，功能上基本满足了基本的日志记录需求。以下是对代码的具体分析： ### 功能： - **日志路径和格式**：定义了日志的存放路径和输出格式，格式清晰，包含了时间、线程、日志级别、类名、方法名、行号和消息内容。 - **控制台输出**：配置了控制台输出，并引用了日志输出格式。 - **日志级别控制**：对特定包（如 `com.ruoyi` 和 `org.springframework`）的日志级别进行了控制。 - **根日志配置**：设置根日志级别为 `info`，并将日志输出到控制台。 ### 优点： - **清晰的注释**：代码中有详细的注释，解释了各个配置项的作用，便于理解和维护。 - **良好的结构**：配置项分类明确，易于阅读和扩展。 - **灵活的日志级别控制**：针对不同模块和框架设置了不同的日志级别，有助于在开发和运维过程中更好地控制日志输出。 ### 缺点和潜在Bug： - **文件输出被注释掉了**：虽然在注释中说明了本地开发时文件输出被注释掉了，但在实际部署环境中，可能需要开启文件输出功能以记录日志。建议在配置文件中保留文件输出配置，并通过环境变量或配置中心控制是否启用。 - **重复配置**：在注释部分和实际配置部分都包含了相同的配置项，虽然注释部分是示例配置，但可能会让阅读者产生混淆。建议将注释部分简化或移除不必要的重复内容。 - **缺少对文件输出的配置**：虽然注释中提到了文件输出的配置，但在实际配置中未启用。如果需要在生产环境中使用文件输出，需要解注释并调整相应的配置。 ### 代码规范： - **XML格式规范**：XML结构清晰，标签闭合正确，符合XML标准。 - **命名规范**：变量命名清晰，如 `log.path` 和 `log.pattern`，易于理解。 ### 总体评价： 该配置文件在功能和结构上都表现良好，但在实际应用中需要根据具体需求调整文件输出配置。代码规范良好，注释清晰，但在注释和实际配置的重复上可以进行优化。总体评分85分，有改进空间但已经具备了良好的基础。');
INSERT INTO `hw_upload_batch` VALUES (14, 102, '三三', 'python', '1765865463779', 1, '2025-12-16 14:11:04', 2, '【总分】：90\n【点评】：代码整体结构清晰，功能明确，使用了dataclass和Optional类型，有助于提高代码的可读性和类型安全性。to_dict和from_dict方法的设计方便了数据的序列化和反序列化。然而，from_dict方法中未对输入数据进行任何验证，如果输入数据格式不正确，可能会引发KeyError或TypeError等异常。建议增加数据验证逻辑，确保输入数据的正确性。此外，可以考虑为GameInput类增加一些方法来处理特定的游戏输入逻辑，以增强类的功能性。', 90.00, '2025-12-16 14:11:04', '2025-12-16 14:11:25', '代码整体结构清晰，功能明确，使用了dataclass和Optional类型，有助于提高代码的可读性和类型安全性。to_dict和from_dict方法的设计方便了数据的序列化和反序列化。然而，from_dict方法中未对输入数据进行任何验证，如果输入数据格式不正确，可能会引发KeyError或TypeError等异常。建议增加数据验证逻辑，确保输入数据的正确性。此外，可以考虑为GameInput类增加一些方法来处理特定的游戏输入逻辑，以增强类的功能性。');

-- ----------------------------
-- Table structure for hw_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `hw_upload_file`;
CREATE TABLE `hw_upload_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `batch_id` bigint NOT NULL COMMENT '关联批次ID',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '原始文件名',
  `file_ext` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '后缀如 .c .cpp .java',
  `file_size` bigint NOT NULL COMMENT '文件大小字节',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储路径 /upload/homework/2025/12/03/xxx.c',
  `code_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文件内容文本（供AI直接读）',
  `judge_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '判题结果',
  `ai_score` decimal(5, 2) NULL DEFAULT NULL COMMENT '单文件AI得分',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_batch`(`batch_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '作业文件明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hw_upload_file
-- ----------------------------
INSERT INTO `hw_upload_file` VALUES (2, 8, 'RuoYiApplication.java', '.java', 1217, '/profile/upload/2025/12/05/RuoYiApplication_20251205114029A002.java', 'package com.ruoyi;\r\n\r\nimport org.springframework.boot.SpringApplication;\r\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\r\nimport org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;\r\n\r\n/**\r\n * 启动程序\r\n * \r\n * @author ruoyi\r\n */\r\n@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })\r\npublic class RuoYiApplication\r\n{\r\n    public static void main(String[] args)\r\n    {\r\n        // System.setProperty(\"spring.devtools.restart.enabled\", \"false\");\r\n        SpringApplication.run(RuoYiApplication.class, args);\r\n        System.out.println(\"(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \\n\" +\r\n                \" .-------.       ____     __        \\n\" +\r\n                \" |  _ _   \\\\      \\\\   \\\\   /  /    \\n\" +\r\n                \" | ( \' )  |       \\\\  _. /  \'       \\n\" +\r\n                \" |(_ o _) /        _( )_ .\'         \\n\" +\r\n                \" | (_,_).\' __  ___(_ o _)\'          \\n\" +\r\n                \" |  |\\\\ \\\\  |  ||   |(_,_)\'         \\n\" +\r\n                \" |  | \\\\ `\'   /|   `-\'  /           \\n\" +\r\n                \" |  |  \\\\    /  \\\\      /           \\n\" +\r\n                \" \'\'-\'   `\'-\'    `-..-\'              \");\r\n    }\r\n}\r\n', NULL, 10.00, '2025-12-05 11:40:29');
INSERT INTO `hw_upload_file` VALUES (3, 9, 'ISysDictTypeService.java', '.java', 2267, '/profile/upload/2025/12/05/ISysDictTypeService_20251205124414A003.java', '<p>package com.ruoyi.system.service; import java.util.List; import com.ruoyi.common.core.domain.entity.SysDictData; import com.ruoyi.common.core.domain.entity.SysDictType; /** * 字典 业务层 * * @author ruoyi */ public interface ISysDictTypeService { /** * 根据条件分页查询字典类型 * * @param dictType 字典类型信息 * @return 字典类型集合信息 */ public List selectDictTypeList(SysDictType dictType); /** * 根据所有字典类型 * * @return 字典类型集合信息 */ public List selectDictTypeAll(); /** * 根据字典类型查询字典数据 * * @param dictType 字典类型 * @return 字典数据集合信息 */ public List selectDictDataByType(String dictType); /** * 根据字典类型ID查询信息 * * @param dictId 字典类型ID * @return 字典类型 */ public SysDictType selectDictTypeById(Long dictId); /** * 根据字典类型查询信息 * * @param dictType 字典类型 * @return 字典类型 */ public SysDictType selectDictTypeByType(String dictType); /** * 批量删除字典信息 * * @param dictIds 需要删除的字典ID */ public void deleteDictTypeByIds(Long[] dictIds); /** * 加载字典缓存数据 */ public void loadingDictCache(); /** * 清空字典缓存数据 */ public void clearDictCache(); /** * 重置字典缓存数据 */ public void resetDictCache(); /** * 新增保存字典类型信息 * * @param dictType 字典类型信息 * @return 结果 */ public int insertDictType(SysDictType dictType); /** * 修改保存字典类型信息 * * @param dictType 字典类型信息 * @return 结果 */ public int updateDictType(SysDictType dictType); /** * 校验字典类型称是否唯一 * * @param dictType 字典类型 * @return 结果 */ public boolean checkDictTypeUnique(SysDictType dictType); } </p>', NULL, 20.00, '2025-12-05 12:44:15');
INSERT INTO `hw_upload_file` VALUES (4, 10, 'ISysDictTypeService.java', '.java', 2267, '/profile/upload/2025/12/05/ISysDictTypeService_20251205124445A001.java', 'package com.ruoyi.system.service;\r\n\r\nimport java.util.List;\r\nimport com.ruoyi.common.core.domain.entity.SysDictData;\r\nimport com.ruoyi.common.core.domain.entity.SysDictType;\r\n\r\n/**\r\n * 字典 业务层\r\n * \r\n * @author ruoyi\r\n */\r\npublic interface ISysDictTypeService\r\n{\r\n    /**\r\n     * 根据条件分页查询字典类型\r\n     * \r\n     * @param dictType 字典类型信息\r\n     * @return 字典类型集合信息\r\n     */\r\n    public List<SysDictType> selectDictTypeList(SysDictType dictType);\r\n\r\n    /**\r\n     * 根据所有字典类型\r\n     * \r\n     * @return 字典类型集合信息\r\n     */\r\n    public List<SysDictType> selectDictTypeAll();\r\n\r\n    /**\r\n     * 根据字典类型查询字典数据\r\n     * \r\n     * @param dictType 字典类型\r\n     * @return 字典数据集合信息\r\n     */\r\n    public List<SysDictData> selectDictDataByType(String dictType);\r\n\r\n    /**\r\n     * 根据字典类型ID查询信息\r\n     * \r\n     * @param dictId 字典类型ID\r\n     * @return 字典类型\r\n     */\r\n    public SysDictType selectDictTypeById(Long dictId);\r\n\r\n    /**\r\n     * 根据字典类型查询信息\r\n     * \r\n     * @param dictType 字典类型\r\n     * @return 字典类型\r\n     */\r\n    public SysDictType selectDictTypeByType(String dictType);\r\n\r\n    /**\r\n     * 批量删除字典信息\r\n     * \r\n     * @param dictIds 需要删除的字典ID\r\n     */\r\n    public void deleteDictTypeByIds(Long[] dictIds);\r\n\r\n    /**\r\n     * 加载字典缓存数据\r\n     */\r\n    public void loadingDictCache();\r\n\r\n    /**\r\n     * 清空字典缓存数据\r\n     */\r\n    public void clearDictCache();\r\n\r\n    /**\r\n     * 重置字典缓存数据\r\n     */\r\n    public void resetDictCache();\r\n\r\n    /**\r\n     * 新增保存字典类型信息\r\n     * \r\n     * @param dictType 字典类型信息\r\n     * @return 结果\r\n     */\r\n    public int insertDictType(SysDictType dictType);\r\n\r\n    /**\r\n     * 修改保存字典类型信息\r\n     * \r\n     * @param dictType 字典类型信息\r\n     * @return 结果\r\n     */\r\n    public int updateDictType(SysDictType dictType);\r\n\r\n    /**\r\n     * 校验字典类型称是否唯一\r\n     * \r\n     * @param dictType 字典类型\r\n     * @return 结果\r\n     */\r\n    public boolean checkDictTypeUnique(SysDictType dictType);\r\n}\r\n', NULL, NULL, '2025-12-05 12:44:45');
INSERT INTO `hw_upload_file` VALUES (5, 11, 'ISysDictTypeService.java', '.java', 2267, '/profile/upload/2025/12/05/ISysDictTypeService_20251205124536A001.java', 'package com.ruoyi.system.service;\r\n\r\nimport java.util.List;\r\nimport com.ruoyi.common.core.domain.entity.SysDictData;\r\nimport com.ruoyi.common.core.domain.entity.SysDictType;\r\n\r\n/**\r\n * 字典 业务层\r\n * \r\n * @author ruoyi\r\n */\r\npublic interface ISysDictTypeService\r\n{\r\n    /**\r\n     * 根据条件分页查询字典类型\r\n     * \r\n     * @param dictType 字典类型信息\r\n     * @return 字典类型集合信息\r\n     */\r\n    public List<SysDictType> selectDictTypeList(SysDictType dictType);\r\n\r\n    /**\r\n     * 根据所有字典类型\r\n     * \r\n     * @return 字典类型集合信息\r\n     */\r\n    public List<SysDictType> selectDictTypeAll();\r\n\r\n    /**\r\n     * 根据字典类型查询字典数据\r\n     * \r\n     * @param dictType 字典类型\r\n     * @return 字典数据集合信息\r\n     */\r\n    public List<SysDictData> selectDictDataByType(String dictType);\r\n\r\n    /**\r\n     * 根据字典类型ID查询信息\r\n     * \r\n     * @param dictId 字典类型ID\r\n     * @return 字典类型\r\n     */\r\n    public SysDictType selectDictTypeById(Long dictId);\r\n\r\n    /**\r\n     * 根据字典类型查询信息\r\n     * \r\n     * @param dictType 字典类型\r\n     * @return 字典类型\r\n     */\r\n    public SysDictType selectDictTypeByType(String dictType);\r\n\r\n    /**\r\n     * 批量删除字典信息\r\n     * \r\n     * @param dictIds 需要删除的字典ID\r\n     */\r\n    public void deleteDictTypeByIds(Long[] dictIds);\r\n\r\n    /**\r\n     * 加载字典缓存数据\r\n     */\r\n    public void loadingDictCache();\r\n\r\n    /**\r\n     * 清空字典缓存数据\r\n     */\r\n    public void clearDictCache();\r\n\r\n    /**\r\n     * 重置字典缓存数据\r\n     */\r\n    public void resetDictCache();\r\n\r\n    /**\r\n     * 新增保存字典类型信息\r\n     * \r\n     * @param dictType 字典类型信息\r\n     * @return 结果\r\n     */\r\n    public int insertDictType(SysDictType dictType);\r\n\r\n    /**\r\n     * 修改保存字典类型信息\r\n     * \r\n     * @param dictType 字典类型信息\r\n     * @return 结果\r\n     */\r\n    public int updateDictType(SysDictType dictType);\r\n\r\n    /**\r\n     * 校验字典类型称是否唯一\r\n     * \r\n     * @param dictType 字典类型\r\n     * @return 结果\r\n     */\r\n    public boolean checkDictTypeUnique(SysDictType dictType);\r\n}\r\n', NULL, NULL, '2025-12-05 12:45:36');
INSERT INTO `hw_upload_file` VALUES (6, 12, 'SysPostMapper.xml', '.xml', 4783, '/profile/upload/2025/12/05/SysPostMapper_20251205130559A001.xml', '<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\nPUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\r\n\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<mapper namespace=\"com.ruoyi.system.mapper.SysPostMapper\">\r\n\r\n	<resultMap type=\"SysPost\" id=\"SysPostResult\">\r\n		<id     property=\"postId\"        column=\"post_id\"       />\r\n		<result property=\"postCode\"      column=\"post_code\"     />\r\n		<result property=\"postName\"      column=\"post_name\"     />\r\n		<result property=\"postSort\"      column=\"post_sort\"     />\r\n		<result property=\"status\"        column=\"status\"        />\r\n		<result property=\"createBy\"      column=\"create_by\"     />\r\n		<result property=\"createTime\"    column=\"create_time\"   />\r\n		<result property=\"updateBy\"      column=\"update_by\"     />\r\n		<result property=\"updateTime\"    column=\"update_time\"   />\r\n		<result property=\"remark\"        column=\"remark\"        />\r\n	</resultMap>\r\n	\r\n	<sql id=\"selectPostVo\">\r\n        select post_id, post_code, post_name, post_sort, status, create_by, create_time, remark \r\n		from sys_post\r\n    </sql>\r\n	\r\n	<select id=\"selectPostList\" parameterType=\"SysPost\" resultMap=\"SysPostResult\">\r\n	    <include refid=\"selectPostVo\"/>\r\n		<where>\r\n			<if test=\"postCode != null and postCode != \'\'\">\r\n				AND post_code like concat(\'%\', #{postCode}, \'%\')\r\n			</if>\r\n			<if test=\"status != null and status != \'\'\">\r\n				AND status = #{status}\r\n			</if>\r\n			<if test=\"postName != null and postName != \'\'\">\r\n				AND post_name like concat(\'%\', #{postName}, \'%\')\r\n			</if>\r\n		</where>\r\n	</select>\r\n	\r\n	<select id=\"selectPostAll\" resultMap=\"SysPostResult\">\r\n		<include refid=\"selectPostVo\"/>\r\n	</select>\r\n	\r\n	<select id=\"selectPostById\" parameterType=\"Long\" resultMap=\"SysPostResult\">\r\n		<include refid=\"selectPostVo\"/>\r\n		where post_id = #{postId}\r\n	</select>\r\n	\r\n	<select id=\"selectPostListByUserId\" parameterType=\"Long\" resultType=\"Long\">\r\n		select p.post_id\r\n        from sys_post p\r\n	        left join sys_user_post up on up.post_id = p.post_id\r\n	        left join sys_user u on u.user_id = up.user_id\r\n	    where u.user_id = #{userId}\r\n	</select>\r\n	\r\n	<select id=\"selectPostsByUserName\" parameterType=\"String\" resultMap=\"SysPostResult\">\r\n		select p.post_id, p.post_name, p.post_code\r\n		from sys_post p\r\n			 left join sys_user_post up on up.post_id = p.post_id\r\n			 left join sys_user u on u.user_id = up.user_id\r\n		where u.user_name = #{userName}\r\n	</select>\r\n	\r\n	<select id=\"checkPostNameUnique\" parameterType=\"String\" resultMap=\"SysPostResult\">\r\n		<include refid=\"selectPostVo\"/>\r\n		 where post_name=#{postName} limit 1\r\n	</select>\r\n	\r\n	<select id=\"checkPostCodeUnique\" parameterType=\"String\" resultMap=\"SysPostResult\">\r\n		<include refid=\"selectPostVo\"/>\r\n		 where post_code=#{postCode} limit 1\r\n	</select>\r\n	\r\n	<update id=\"updatePost\" parameterType=\"SysPost\">\r\n 		update sys_post\r\n 		<set>\r\n 			<if test=\"postCode != null and postCode != \'\'\">post_code = #{postCode},</if>\r\n 			<if test=\"postName != null and postName != \'\'\">post_name = #{postName},</if>\r\n 			<if test=\"postSort != null\">post_sort = #{postSort},</if>\r\n 			<if test=\"status != null and status != \'\'\">status = #{status},</if>\r\n 			<if test=\"remark != null\">remark = #{remark},</if>\r\n 			<if test=\"updateBy != null and updateBy != \'\'\">update_by = #{updateBy},</if>\r\n 			update_time = sysdate()\r\n 		</set>\r\n 		where post_id = #{postId}\r\n	</update>\r\n 	\r\n 	<insert id=\"insertPost\" parameterType=\"SysPost\" useGeneratedKeys=\"true\" keyProperty=\"postId\">\r\n 		insert into sys_post(\r\n 			<if test=\"postId != null and postId != 0\">post_id,</if>\r\n 			<if test=\"postCode != null and postCode != \'\'\">post_code,</if>\r\n 			<if test=\"postName != null and postName != \'\'\">post_name,</if>\r\n 			<if test=\"postSort != null\">post_sort,</if>\r\n 			<if test=\"status != null and status != \'\'\">status,</if>\r\n 			<if test=\"remark != null and remark != \'\'\">remark,</if>\r\n 			<if test=\"createBy != null and createBy != \'\'\">create_by,</if>\r\n 			create_time\r\n 		)values(\r\n 			<if test=\"postId != null and postId != 0\">#{postId},</if>\r\n 			<if test=\"postCode != null and postCode != \'\'\">#{postCode},</if>\r\n 			<if test=\"postName != null and postName != \'\'\">#{postName},</if>\r\n 			<if test=\"postSort != null\">#{postSort},</if>\r\n 			<if test=\"status != null and status != \'\'\">#{status},</if>\r\n 			<if test=\"remark != null and remark != \'\'\">#{remark},</if>\r\n 			<if test=\"createBy != null and createBy != \'\'\">#{createBy},</if>\r\n 			sysdate()\r\n 		)\r\n	</insert>\r\n	\r\n	<delete id=\"deletePostById\" parameterType=\"Long\">\r\n		delete from sys_post where post_id = #{postId}\r\n	</delete>\r\n	\r\n	<delete id=\"deletePostByIds\" parameterType=\"Long\">\r\n 		delete from sys_post where post_id in\r\n 		<foreach collection=\"array\" item=\"postId\" open=\"(\" separator=\",\" close=\")\">\r\n 			#{postId}\r\n        </foreach> \r\n 	</delete>\r\n\r\n</mapper> ', NULL, NULL, '2025-12-05 13:06:00');
INSERT INTO `hw_upload_file` VALUES (7, 13, 'logback.xml', '.xml', 5640, '/profile/upload/2025/12/16/logback_20251216140157A001.xml', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<configuration>\r\n    <!-- 日志存放路径 (在本地开发时此路径无效, 因为我们注释掉了文件输出) -->\r\n    <property name=\"log.path\" value=\"./logs\" />\r\n    <!-- 日志输出格式 -->\r\n    <property name=\"log.pattern\" value=\"%d{HH:mm:ss.SSS} [%thread] %-5level %logger{20} - [%method,%line] - %msg%n\" />\r\n\r\n    <!-- 控制台输出 -->\r\n    <appender name=\"console\" class=\"ch.qos.logback.core.ConsoleAppender\">\r\n        <encoder>\r\n            <pattern>${log.pattern}</pattern>\r\n        </encoder>\r\n    </appender>\r\n\r\n    <!-- 系统模块日志级别控制  -->\r\n    <logger name=\"com.ruoyi\" level=\"info\" />\r\n    <!-- Spring日志级别控制  -->\r\n    <logger name=\"org.springframework\" level=\"warn\" />\r\n\r\n    <!--\r\n        日志输出级别\r\n        这是唯一的、合并后的 root 标签。\r\n        在本地开发时，我们只关心控制台输出，所以只引用了 console appender。\r\n    -->\r\n    <root level=\"info\">\r\n        <appender-ref ref=\"console\" />\r\n    </root>\r\n\r\n</configuration>\r\n<!--<?xml version=\"1.0\" encoding=\"UTF-8\"?>-->\r\n<!--<configuration>-->\r\n<!--    &lt;!&ndash; 日志存放路径 &ndash;&gt;-->\r\n<!--	<property name=\"log.path\" value=\"/home/ruoyi/logs\" />-->\r\n<!--    &lt;!&ndash; 日志输出格式 &ndash;&gt;-->\r\n<!--	<property name=\"log.pattern\" value=\"%d{HH:mm:ss.SSS} [%thread] %-5level %logger{20} - [%method,%line] - %msg%n\" />-->\r\n\r\n<!--	&lt;!&ndash; 控制台输出 &ndash;&gt;-->\r\n<!--	<appender name=\"console\" class=\"ch.qos.logback.core.ConsoleAppender\">-->\r\n<!--		<encoder>-->\r\n<!--			<pattern>${log.pattern}</pattern>-->\r\n<!--		</encoder>-->\r\n<!--	</appender>-->\r\n<!--	-->\r\n<!--	&lt;!&ndash; 系统日志输出 &ndash;&gt;-->\r\n<!--	<appender name=\"file_info\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">-->\r\n<!--	    <file>${log.path}/sys-info.log</file>-->\r\n<!--        &lt;!&ndash; 循环政策：基于时间创建日志文件 &ndash;&gt;-->\r\n<!--		<rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">-->\r\n<!--            &lt;!&ndash; 日志文件名格式 &ndash;&gt;-->\r\n<!--			<fileNamePattern>${log.path}/sys-info.%d{yyyy-MM-dd}.log</fileNamePattern>-->\r\n<!--			&lt;!&ndash; 日志最大的历史 60天 &ndash;&gt;-->\r\n<!--			<maxHistory>60</maxHistory>-->\r\n<!--		</rollingPolicy>-->\r\n<!--		<encoder>-->\r\n<!--			<pattern>${log.pattern}</pattern>-->\r\n<!--		</encoder>-->\r\n<!--		<filter class=\"ch.qos.logback.classic.filter.LevelFilter\">-->\r\n<!--            &lt;!&ndash; 过滤的级别 &ndash;&gt;-->\r\n<!--            <level>INFO</level>-->\r\n<!--            &lt;!&ndash; 匹配时的操作：接收（记录） &ndash;&gt;-->\r\n<!--            <onMatch>ACCEPT</onMatch>-->\r\n<!--            &lt;!&ndash; 不匹配时的操作：拒绝（不记录） &ndash;&gt;-->\r\n<!--            <onMismatch>DENY</onMismatch>-->\r\n<!--        </filter>-->\r\n<!--	</appender>-->\r\n<!--	-->\r\n<!--	<appender name=\"file_error\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">-->\r\n<!--	    <file>${log.path}/sys-error.log</file>-->\r\n<!--        &lt;!&ndash; 循环政策：基于时间创建日志文件 &ndash;&gt;-->\r\n<!--        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">-->\r\n<!--            &lt;!&ndash; 日志文件名格式 &ndash;&gt;-->\r\n<!--            <fileNamePattern>${log.path}/sys-error.%d{yyyy-MM-dd}.log</fileNamePattern>-->\r\n<!--			&lt;!&ndash; 日志最大的历史 60天 &ndash;&gt;-->\r\n<!--			<maxHistory>60</maxHistory>-->\r\n<!--        </rollingPolicy>-->\r\n<!--        <encoder>-->\r\n<!--            <pattern>${log.pattern}</pattern>-->\r\n<!--        </encoder>-->\r\n<!--        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">-->\r\n<!--            &lt;!&ndash; 过滤的级别 &ndash;&gt;-->\r\n<!--            <level>ERROR</level>-->\r\n<!--			&lt;!&ndash; 匹配时的操作：接收（记录） &ndash;&gt;-->\r\n<!--            <onMatch>ACCEPT</onMatch>-->\r\n<!--			&lt;!&ndash; 不匹配时的操作：拒绝（不记录） &ndash;&gt;-->\r\n<!--            <onMismatch>DENY</onMismatch>-->\r\n<!--        </filter>-->\r\n<!--    </appender>-->\r\n<!--	-->\r\n<!--	&lt;!&ndash; 用户访问日志输出  &ndash;&gt;-->\r\n<!--    <appender name=\"sys-user\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">-->\r\n<!--		<file>${log.path}/sys-user.log</file>-->\r\n<!--        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">-->\r\n<!--            &lt;!&ndash; 按天回滚 daily &ndash;&gt;-->\r\n<!--            <fileNamePattern>${log.path}/sys-user.%d{yyyy-MM-dd}.log</fileNamePattern>-->\r\n<!--            &lt;!&ndash; 日志最大的历史 60天 &ndash;&gt;-->\r\n<!--            <maxHistory>60</maxHistory>-->\r\n<!--        </rollingPolicy>-->\r\n<!--        <encoder>-->\r\n<!--            <pattern>${log.pattern}</pattern>-->\r\n<!--        </encoder>-->\r\n<!--    </appender>-->\r\n<!--	-->\r\n<!--	&lt;!&ndash; 系统模块日志级别控制  &ndash;&gt;-->\r\n<!--	<logger name=\"com.ruoyi\" level=\"info\" />-->\r\n<!--	&lt;!&ndash; Spring日志级别控制  &ndash;&gt;-->\r\n<!--	<logger name=\"org.springframework\" level=\"warn\" />-->\r\n\r\n<!--	<root level=\"info\">-->\r\n<!--		<appender-ref ref=\"console\" />-->\r\n<!--	</root>-->\r\n<!--	-->\r\n<!--	&lt;!&ndash;系统操作日志&ndash;&gt;-->\r\n<!--    <root level=\"info\">-->\r\n<!--        <appender-ref ref=\"file_info\" />-->\r\n<!--        <appender-ref ref=\"file_error\" />-->\r\n<!--    </root>-->\r\n<!--	-->\r\n<!--	&lt;!&ndash;系统用户操作日志&ndash;&gt;-->\r\n<!--    <logger name=\"sys-user\" level=\"info\">-->\r\n<!--        <appender-ref ref=\"sys-user\"/>-->\r\n<!--    </logger>-->\r\n<!--</configuration>-->', NULL, NULL, '2025-12-16 14:01:58');
INSERT INTO `hw_upload_file` VALUES (8, 14, 'GameInput.py', '.py', 1119, '/profile/upload/2025/12/16/GameInput_20251216141103A002.py', 'from dataclasses import dataclass\r\nfrom typing import Optional\r\n\r\n\r\n@dataclass\r\nclass GameInput:\r\n    move_direction: int = 0\r\n    is_crouching: bool = False\r\n\r\n    jump_triggered: bool = False\r\n    jump_type: Optional[str] = None\r\n\r\n    shoot_triggered: bool = False\r\n    shoot_direction: int = 0\r\n\r\n    def to_dict(self) -> dict:\r\n        return {\r\n            \"move\": self.move_direction,\r\n            \"crouch\": self.is_crouching,\r\n            \"jump\": {\r\n                \"triggered\": self.jump_triggered,\r\n                \"type\": self.jump_type\r\n            },\r\n            \"shoot\": {\r\n                \"triggered\": self.shoot_triggered,\r\n                \"direction\": self.shoot_direction\r\n            }\r\n        }\r\n\r\n    @classmethod\r\n    def from_dict(cls, data: dict) -> \'GameInput\':\r\n        return cls(\r\n            move_direction=data[\"move\"],\r\n            is_crouching=data[\"crouch\"],\r\n            jump_triggered=data[\"jump\"][\"triggered\"],\r\n            jump_type=data[\"jump\"][\"type\"],\r\n            shoot_triggered=data[\"shoot\"][\"triggered\"],\r\n            shoot_direction=data[\"shoot\"][\"direction\"]\r\n        )\r\n', NULL, NULL, '2025-12-16 14:11:04');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-12-05 10:27:53', 'admin', '2025-12-12 15:35:43', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-12-05 10:27:53', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '1', 0, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '2', 1, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '2', 2, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '2', 1, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '2', 2, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '2', 3, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '2', 4, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '2', 5, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '2', 1, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '2', 2, '3', '15888888888', '1', '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, ' 未评 ', '0', 'hw_ai_status', NULL, 'default', 'N', '0', 'admin', '2025-12-08 14:03:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '评测中', '1', 'hw_ai_status', NULL, 'default', 'N', '0', 'admin', '2025-12-08 14:03:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '已完成', '2', 'hw_ai_status', NULL, 'default', 'N', '0', 'admin', '2025-12-08 14:03:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 3, '失败', '3', 'hw_ai_status', NULL, 'default', 'N', '0', 'admin', '2025-12-08 14:04:08', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-12-05 10:27:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, 'AI评测状态', 'hw_ai_status', '0', 'admin', '2025-12-08 14:03:09', '', NULL, ' 0未评 1评测中 2已完成 3失败');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-12-05 10:27:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-12-05 10:27:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-12-05 10:27:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-12-05 10:34:22');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-05 10:34:28');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-05 12:43:40');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-08 13:34:47');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-08 22:08:01');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '1', '验证码错误', '2025-12-08 22:47:05');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-08 22:47:09');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-09 00:39:26');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-09 01:34:31');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-12 15:34:52');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-12 16:14:27');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-15 10:49:00');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-15 11:30:47');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-15 12:34:47');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Mac OS X', '0', '登录成功', '2025-12-15 14:08:41');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 12:38:55');
INSERT INTO `sys_logininfor` VALUES (116, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 12:39:00');
INSERT INTO `sys_logininfor` VALUES (117, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 12:39:59');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 12:40:06');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 12:45:41');
INSERT INTO `sys_logininfor` VALUES (120, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 12:45:49');
INSERT INTO `sys_logininfor` VALUES (121, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 12:55:34');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 12:55:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 13:29:11');
INSERT INTO `sys_logininfor` VALUES (124, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:29:16');
INSERT INTO `sys_logininfor` VALUES (125, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:06:31');
INSERT INTO `sys_logininfor` VALUES (126, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:06:38');
INSERT INTO `sys_logininfor` VALUES (127, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:08:09');
INSERT INTO `sys_logininfor` VALUES (128, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-16 14:08:11');
INSERT INTO `sys_logininfor` VALUES (129, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:08:13');
INSERT INTO `sys_logininfor` VALUES (130, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:08:27');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:08:31');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:10:17');
INSERT INTO `sys_logininfor` VALUES (133, '三三', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:10:24');
INSERT INTO `sys_logininfor` VALUES (134, '三三', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:16:14');
INSERT INTO `sys_logininfor` VALUES (135, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-16 14:16:18');
INSERT INTO `sys_logininfor` VALUES (136, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:16:20');
INSERT INTO `sys_logininfor` VALUES (137, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:16:28');
INSERT INTO `sys_logininfor` VALUES (138, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:16:32');
INSERT INTO `sys_logininfor` VALUES (139, '王老师', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:22:41');
INSERT INTO `sys_logininfor` VALUES (140, '李白', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:22:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-12-05 10:27:52', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2025-12-05 10:27:52', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2025-12-05 10:27:52', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-12-05 10:27:52', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-12-05 10:27:52', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-12-05 10:27:52', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-12-05 10:27:52', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-12-05 10:27:52', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-12-05 10:27:52', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-12-05 10:27:52', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-12-05 10:27:52', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-12-05 10:27:52', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-12-05 10:27:52', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-12-05 10:27:52', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-12-05 10:27:52', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-12-05 10:27:52', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-12-05 10:27:52', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-12-05 10:27:52', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-12-05 10:27:52', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-12-05 10:27:52', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-12-05 10:27:52', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-12-05 10:27:52', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-12-05 10:27:52', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '作业提交批次', 3, 1, 'batch', 'system/batch/index', NULL, '', 1, 0, 'C', '0', '0', 'system:batch:list', '#', 'admin', '2025-12-05 10:47:55', '', NULL, '作业提交批次菜单');
INSERT INTO `sys_menu` VALUES (2001, '作业提交批次查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:batch:query', '#', 'admin', '2025-12-05 10:47:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '作业提交批次新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:batch:add', '#', 'admin', '2025-12-05 10:47:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '作业提交批次修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:batch:edit', '#', 'admin', '2025-12-05 10:47:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '作业提交批次删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:batch:remove', '#', 'admin', '2025-12-05 10:47:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '作业提交批次导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:batch:export', '#', 'admin', '2025-12-05 10:47:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '作业文件明细', 3, 1, 'file', 'system/file/index', NULL, '', 1, 0, 'C', '0', '0', 'system:file:list', '#', 'admin', '2025-12-05 10:48:56', '', NULL, '作业文件明细菜单');
INSERT INTO `sys_menu` VALUES (2007, '作业文件明细查询', 2006, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:file:query', '#', 'admin', '2025-12-05 10:48:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '作业文件明细新增', 2006, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:file:add', '#', 'admin', '2025-12-05 10:48:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '作业文件明细修改', 2006, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:file:edit', '#', 'admin', '2025-12-05 10:48:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '作业文件明细删除', 2006, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:file:remove', '#', 'admin', '2025-12-05 10:48:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '作业文件明细导出', 2006, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:file:export', '#', 'admin', '2025-12-05 10:48:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '传作业', 2006, 1, '/homework/upload', 'homework/UploadHomework', NULL, '', 1, 1, 'C', '0', '0', 'homework:upload', '#', 'admin', '2025-12-05 11:05:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '作业管理', 0, 0, 'homework', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2025-12-08 13:49:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '作业提交', 2013, 1, 'batch2', 'hw/batch2/index', NULL, '', 1, 0, 'C', '0', '0', 'hw:batch2:list', '#', 'admin', '2025-12-08 14:07:45', '', NULL, '作业提交批次2.0菜单');
INSERT INTO `sys_menu` VALUES (2015, '作业查询', 2014, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:batch2:query', '#', 'admin', '2025-12-08 14:07:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '作业新增', 2014, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:batch2:add', '#', 'admin', '2025-12-08 14:07:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '作业修改', 2014, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:batch2:edit', '#', 'admin', '2025-12-08 14:07:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '作业删除', 2014, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:batch2:remove', '#', 'admin', '2025-12-08 14:07:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '作业导出', 2014, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:batch2:export', '#', 'admin', '2025-12-08 14:07:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '作业文件明细', 2013, 1, 'file2', 'hw/file2/index', NULL, '', 1, 0, 'C', '0', '0', 'hw:file2:list', '#', 'admin', '2025-12-08 14:07:58', '', NULL, '作业文件明细2.0菜单');
INSERT INTO `sys_menu` VALUES (2021, '作业文件明细查询', 2020, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:file2:query', '#', 'admin', '2025-12-08 14:07:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '作业文件明细新增', 2020, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:file2:add', '#', 'admin', '2025-12-08 14:07:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '作业文件明细修改', 2020, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:file2:edit', '#', 'admin', '2025-12-08 14:07:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '作业文件明细删除', 2020, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:file2:remove', '#', 'admin', '2025-12-08 14:07:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '作业文件明细导出', 2020, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hw:file2:export', '#', 'admin', '2025-12-08 14:07:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (168, '操作日志', 3, 'com.ruoyi.web.controller.monitor.SysOperlogController.remove()', 'DELETE', 1, 'admin', '2', '/monitor/operlog/167,106,105,104,103,102,101,100', '127.0.0.1', '内网IP', '[167,106,105,104,103,102,101,100] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:09:09', 8);
INSERT INTO `sys_oper_log` VALUES (169, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '2', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025],\"params\":{},\"roleKey\":\"stu\",\"roleName\":\"三三\",\"roleSort\":1,\"status\":\"0\"} ', '{\"msg\":\"新增角色\'三三\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-12-16 14:09:46', 5);
INSERT INTO `sys_oper_log` VALUES (170, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '2', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025],\"params\":{},\"roleId\":102,\"roleKey\":\"stu1\",\"roleName\":\"三三\",\"roleSort\":1,\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:09:52', 20);
INSERT INTO `sys_oper_log` VALUES (171, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '2', '/system/role/102', '127.0.0.1', '内网IP', '[102] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:10:02', 29);
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '2', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"三三\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":102,\"userName\":\"三三\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:10:11', 88);
INSERT INTO `sys_oper_log` VALUES (173, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, '三三', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:10:31', 292);
INSERT INTO `sys_oper_log` VALUES (174, '作业提交批次2.0（含文件）', 1, 'com.ruoyi.hw.controller.HwUploadBatch2Controller.addWithFiles()', 'POST', 1, '三三', NULL, '/hw/batch2/addWithFiles', '127.0.0.1', '内网IP', '{\"submitTime\":\"2025-12-16\",\"courseId\":\"python\"}', '{\"msg\":\"上传成功\",\"code\":200}', 0, NULL, '2025-12-16 14:11:03', 19);
INSERT INTO `sys_oper_log` VALUES (175, '作业提交批次2.0', 2, 'com.ruoyi.hw.controller.HwUploadBatch2Controller.edit()', 'PUT', 1, '三三', NULL, '/hw/batch2', '127.0.0.1', '内网IP', '{\"id\":14,\"params\":{},\"tcReview\":\"代码整体结构清晰，功能明确，使用了dataclass和Optional类型，有助于提高代码的可读性和类型安全性。to_dict和from_dict方法的设计方便了数据的序列化和反序列化。然而，from_dict方法中未对输入数据进行任何验证，如果输入数据格式不正确，可能会引发KeyError或TypeError等异常。建议增加数据验证逻辑，确保输入数据的正确性。此外，可以考虑为GameInput类增加一些方法来处理特定的游戏输入逻辑，以增强类的功能性。\",\"totalScore\":90,\"updateTime\":\"2025-12-16 14:11:24\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:11:24', 9);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-12-05 10:27:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-12-05 10:27:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-12-05 10:27:52', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-12-05 10:27:52', 'admin', '2025-12-16 12:27:15', '普通角色');
INSERT INTO `sys_role` VALUES (100, '学生', 'stu', 1, '1', 1, 1, '0', '0', 'admin', '2025-12-16 12:40:27', '', NULL, '学生');
INSERT INTO `sys_role` VALUES (101, '教师', 'tea', 1, '1', 1, 1, '0', '0', 'admin', '2025-12-16 12:42:20', '', NULL, '教师');
INSERT INTO `sys_role` VALUES (102, '三三', 'stu1', 1, '1', 1, 1, '0', '2', 'admin', '2025-12-16 14:09:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2018);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2025);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '1', '00', '2', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-12-16 14:08:31', '2025-12-05 10:27:52', 'admin', '2025-12-05 10:27:52', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (100, NULL, '李白', '李白', '00', '', '', '0', '', '$2a$10$82n3zRVdfJJfznN8Vurz.e8lhHVkpQJ83siTLFe3u676eCoYLr8vu', '0', '0', '127.0.0.1', '2025-12-16 14:22:46', '2025-12-07 21:30:21', 'admin', '2025-12-07 21:29:25', 'admin', '2025-12-16 12:42:29', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '王老师', '王老师', '00', '', '', '0', '', '$2a$10$QSNfJrJlo/Bmq8cyi82hnO52vYnp8TsIKjyYb3J.xulGXpGLksAL2', '0', '0', '127.0.0.1', '2025-12-16 14:16:33', '2025-12-16 14:06:44', 'admin', '2025-12-16 12:45:18', '', '2025-12-16 14:06:44', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, '三三', '三三', '00', '', '', '0', '', '$2a$10$LXPqZLnhkzpcaCBTW6iLUuN.52pcr/T8gP6brlmdWOrXlwkug67hu', '0', '0', '127.0.0.1', '2025-12-16 14:10:25', '2025-12-16 14:10:31', 'admin', '2025-12-16 14:10:11', '', '2025-12-16 14:10:31', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 100);

SET FOREIGN_KEY_CHECKS = 1;
