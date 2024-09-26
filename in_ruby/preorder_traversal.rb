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
# @return {Integer[]}
def preorder_traversal(root)
  res = []
  if root.nil?
    return []
  end

  res << root.val << preorder_traversal(root.left) << preorder_traversal(root.right)
  res.flatten
end