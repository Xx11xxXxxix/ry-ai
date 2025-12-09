import request from '@/utils/request'

// 查询作业提交批次2.0列表
export function listBatch2(query) {
  return request({
    url: '/hw/batch2/list', // URL 适配
    method: 'get',
    params: query
  })
}

// 查询作业提交批-次2.0详细
export function getBatch2(id) {
  return request({
    url: '/hw/batch2/' + id, // URL 适配
    method: 'get'
  })
}

// 新增作业提交批次2.0 (不带文件)
export function addBatch2(data) {
  return request({
    url: '/hw/batch2', // URL 适配
    method: 'post',
    data: data
  })
}

// 修改作业提交批次2.0
export function updateBatch2(data) {
  return request({
    url: '/hw/batch2', // URL 适配
    method: 'put',
    data: data
  })
}

// 删除作业提交批次2.0
export function delBatch2(id) {
  return request({
    url: '/hw/batch2/' + id, // URL 适配
    method: 'delete'
  })
}

// **核心移植：带文件上传的新增方法**
export function addBatchWithFile2(data) {
  return request({
    url: '/hw/batch2/addWithFiles', 
    method: 'post',
    data: data,
    headers: { 'Content-Type': 'multipart/form-data' } // 必须设置
  
  })
}