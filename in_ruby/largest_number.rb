# frozen_string_literal: true

# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  # nums의 모든 요소는 양수. 가장 큰 수를 만들려면?

  res = []
  #  맨 앞자리가 가장 높은 요소가 맨 앞으로 와야 한다
  (0..9).each do |x|
    # [0] [1로 시작하는 수] [2로 시작하는 수] [3으로 시작하는 수]...
    xs = nums.select {|n| n.to_s[0] == x.to_s}

    next if xs.size == 0

    xs.reverse!
    # p xs
    xs.sort!{|x1,x2| (x1.to_s+x2.to_s).to_i <=> (x2.to_s+x1.to_s).to_i}
    # p xs

    res << xs.map(&:to_s).reverse!.join
  end
  rev_res = res.reverse!.join
  # 0만 있다면 0 하나만 반환하고, 다른 숫자 앞에 0이 나오면, 그 0은 모두 지운다
  if rev_res =~ /^0+$/
    return '0'
  else
    rev_res.sub!(/^0+/, '')
    return rev_res
  end
end
