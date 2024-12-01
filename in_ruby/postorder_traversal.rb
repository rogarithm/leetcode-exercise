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
def postorder_traversal(root)
  # 규칙이 뭐지? preorder traversal의 반대인가?
  # testcase output을 거꾸로 읽어봤을 때,
  #  오른쪽을 먼저 내려가고
  #  그건 깊이가 깊어져도 마찬가지다
  # preorder를 거꾸로 하면 되나?
  res = []
  if root.nil?
    return []
  end

  res << root.val << postorder_traversal(root.right) << postorder_traversal(root.left)
  res.reverse!.flatten!
end