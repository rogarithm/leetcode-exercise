class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

def is_subtree(root, sub_root)
  # val 하나를 확인한 다음엔 나머지 요소가 일치하는지 어떻게 확인하지?
  # 현재 요소가 leaf라면 더 이상 검색하지 않아도 된다

  # root.val이 sub_root.val과 일치한다면 root가 sub_root의 subtree인지 확인한다
  if is_leaf? sub_root and is_leaf? root
    return root.val == sub_root.val
  end

  r = root
  result = false
  # val이 일치하지만 leaf가 아닌 경우
  if r.val == sub_root.val
    result = match(r, sub_root)
    return true if result
  end
  if r.left
    result = is_subtree(r.left, sub_root)
    return true if result
  end
  if r.right
    result = is_subtree(r.right, sub_root)
    return true if result
  end

  result
end

def match(r1, r2)
  # 아래로 더 이상 요소가 없으면 같은 subtree다
  if is_leaf? r1 and is_leaf? r2
    return true
  end

  if not r2.left and r1.left
    return false
  end
  if not r2.right and r1.right
    return false
  end

  if r2.left
    return false if not r1.left
    return false if r1.left.val != r2.left.val
    return false if not match(r1.left, r2.left)
  end
  if r2.right
    return false if not r1.right
    return false if r1.right.val != r2.right.val
    return false if not match(r1.right, r2.right)
  end

  true
end

def is_leaf? node
  not node.left and not node.right
end

# puts is_subtree(TreeNode.new(3,TreeNode.new(4,1,2),5), TreeNode.new(4,1,2))
#
# puts is_subtree(
#   TreeNode.new(3, TreeNode.new(4,1,TreeNode.new(2,0)), 5),
#   TreeNode.new(4,1,2)
# )
#
