import request from '@/utils/request'

// 查询作业文件明细列表
export function listFile(query) {
  return request({
    url: '/system/file/list',
    method: 'get',
    params: query
  })
}

// 查询作业文件明细详细
export function getFile(id) {
  return request({
    url: '/system/file/' + id,
    method: 'get'
  })
}

// 新增作业文件明细
export function addFile(data) {
  return request({
    url: '/system/file',
    method: 'post',
    data: data
  })
}

// 修改作业文件明细
export function updateFile(data) {
  return request({
    url: '/system/file',
    method: 'put',
    data: data
  })
}

// 删除作业文件明细
export function delFile(id) {
  return request({
    url: '/system/file/' + id,
    method: 'delete'
  })
}
