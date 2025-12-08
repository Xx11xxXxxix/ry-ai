import request from '@/utils/request'

// 查询作业提交批次列表
export function listBatch(query) {
  return request({
    url: '/system/batch/list',
    method: 'get',
    params: query
  })
}

// 查询作业提交批次详细
export function getBatch(id) {
  return request({
    url: '/system/batch/' + id,
    method: 'get'
  })
}

// 新增作业提交批次
export function addBatch(data) {
  return request({
    url: '/system/batch',
    method: 'post',
    data: data
  })
}

// 修改作业提交批次
export function updateBatch(data) {
  return request({
    url: '/system/batch',
    method: 'put',
    data: data
  })
}

// 删除作业提交批次
export function delBatch(id) {
  return request({
    url: '/system/batch/' + id,
    method: 'delete'
  })
}
// 新增：带文件上传的新增方法
export function addBatchWithFile(data) {
  return request({
    url: '/system/batch/addWithFile',
    method: 'post',
    data: data,
    headers: { 'Content-Type': 'multipart/form-data' } // 必须设置
  })
}
