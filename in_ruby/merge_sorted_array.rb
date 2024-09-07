# frozen_string_literal: true

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  if nums1.size > m
    nums1.slice!(m, nums1.size)
  end
  if nums2.size > n
    nums2.slice!(n, nums2.size)
  end
  nums1.concat nums2

  nums1.sort!
end

#merge [1,2,3,0,0,0], 3, [2,5,6], 3

#`
#nums1의 상태를 바꿀 수 있어야 한다
#뒤에 오는 숫자는 앞의 숫자와 같거나 그보다 커야 한다
#요소가 하나인 경우를 포함해, 0만 계속되는 요소는 자신이 속한 배열의 길이에 포함되지 않는다
#
#두 배열 모두 같은 방식으로 정렬된 상태다
#각 배열이 같은 숫자로만 이뤄져 있다면, 답은 AB 또는 BA
#각 배열이 두 가지 숫자로 이뤄져 있다면,
# 두 배열 모두 상승
# 가장 작은 원소를 찾고 맨 앞에 오게 한다
# 그 다음으로 작은 원소를 찾고 그 뒤에 오게 한다
# 반복
#
#0만 있거나 한 가지 숫자로 이뤄진 경우라면 간단히 처리
#그게 아니라면 가장 작은 원소를 찾는 것부터 시작
# non-decreasing이므로 두 배열의 첫 요소를 비교하는 것만으로 충분
#그 다음은?
# [12...] [34...]라고 할 때 두 배열의 첫 요소 중 큰 쪽은 두 번째로 올 수 없다
# [13...] [24...]라고 할 때 두 배열의 첫 요소 중 큰 쪽은 두 번째로 온다
# [12...] [14...]라고 할 때 두 배열의 첫 요소 중 어떤 게 첫 번째로 와도 상관없다
#
#nums1을 처음부터 흝으면서, nums2의 요소와 비교해가며, 더 작은 요소가 있다면 nums1으로 옮기고,
#더 큰 요소가 있다면 nums2로 옮기는 건 어떨까?
#[3 3 4 5] [1 4 5 6]
#[1 3 4 5] [3 4 5 6] <- 두 배열의 첫 번째 요소를 바꿔치기. nums1의 첫 번째 요소는 이제 고정
#[1 3 4 5] [3 4 5 6] <- 그대로. nums1의 두 번째 요소는 이제 고정
#[1 3 3 5] [4 4 5 6] <- 두 배열의 셋째/첫째 요소를 바꿔치기. nums1의 세 번째 요소는 이제 고정
#...
#nums1의 모든 요소를 다 바꿔치기했다면, nums2의 모든 요소를 nums1의 뒤에 붙여넣으면 끝.
#`
