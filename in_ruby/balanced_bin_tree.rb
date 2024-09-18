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
# @param {TreeNode} root
# @return {Boolean}

# 언제 subtree를 생각해야 할까? 언제 subtree를 생각할 필요 없을까?
# subtree의 depth 차이를 계산할 수 있어야 한다
def is_balanced(root)
  l, r = depth(root.left), depth(root.right)
  r, l = l, r if l > r

  # 한 node의 두 subtree 간 depth 차이가 1보다 크지 않아야 한다
  if l - r <= 1
    return (is_balanced(root.left) and is_balanced(root.right))
  end
  false
end

def depth(tree)
  return 0 if tree.nil?
  return 1 if tree.left.nil? and tree.right.nil?
  1 + [depth(tree.left), depth(tree.right)].max
end