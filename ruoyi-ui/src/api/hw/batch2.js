import request from '@/utils/request'

// 查询作业提交批次2.0列表
export function listBatch2(query) {
  return request({
    url: '/hw/batch2/list',
    method: 'get',
    params: query
  })
}

// 查询作业提交批次2.0详细
export function getBatch2(id) {
  return request({
    url: '/hw/batch2/' + id,
    method: 'get'
  })
}

// 新增作业提交批次2.0
export function addBatch2(data) {
  return request({
    url: '/hw/batch2',
    method: 'post',
    data: data
  })
}

// 修改作业提交批次2.0
export function updateBatch2(data) {
  return request({
    url: '/hw/batch2',
    method: 'put',
    data: data
  })
}

// 删除作业提交批次2.0
export function delBatch2(id) {
  return request({
    url: '/hw/batch2/' + id,
    method: 'delete'
  })
}
