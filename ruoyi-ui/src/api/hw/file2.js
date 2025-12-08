import request from '@/utils/request'

// 查询作业文件明细2.0列表
export function listFile2(query) {
  return request({
    url: '/hw/file2/list',
    method: 'get',
    params: query
  })
}

// 查询作业文件明细2.0详细
export function getFile2(id) {
  return request({
    url: '/hw/file2/' + id,
    method: 'get'
  })
}

// 新增作业文件明细2.0
export function addFile2(data) {
  return request({
    url: '/hw/file2',
    method: 'post',
    data: data
  })
}

// 修改作业文件明细2.0
export function updateFile2(data) {
  return request({
    url: '/hw/file2',
    method: 'put',
    data: data
  })
}

// 删除作业文件明细2.0
export function delFile2(id) {
  return request({
    url: '/hw/file2/' + id,
    method: 'delete'
  })
}
