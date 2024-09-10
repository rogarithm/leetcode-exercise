# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  # 이 조건문이 있어야 p.val != q.val 조건을 처리할 수 있다
  if p.nil? and q.nil?
    return true
  end

  # p, q 둘 중 하나만 nil이면 둘은 같지 않다
  if p.nil? or q.nil?
    return false
  end

  if p.val != q.val
    return false
  end

  if is_same_tree(p.left, q.left) and is_same_tree(p.right, q.right)
    true
  else
    false
  end
end