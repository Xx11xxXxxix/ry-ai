import request from '@/utils/request'

// 查询App会员列表
export function listMember(query) {
  return request({
    url: '/vote/member/list',
    method: 'get',
    params: query
  })
}

// 查询App会员详细
export function getMember(memberId) {
  return request({
    url: '/vote/member/' + memberId,
    method: 'get'
  })
}

// 新增App会员
export function addMember(data) {
  return request({
    url: '/vote/member',
    method: 'post',
    data: data
  })
}

// 修改App会员
export function updateMember(data) {
  return request({
    url: '/vote/member',
    method: 'put',
    data: data
  })
}

// 删除App会员
export function delMember(memberId) {
  return request({
    url: '/vote/member/' + memberId,
    method: 'delete'
  })
}
