# @param {Integer} column_number
# @return {String}

# 1, 0, 25는 AZY가 아니라 ZY가 되어야 한다
# 왜 그렇지?
def convert_to_title(column_number)
  # 26진수라고 생각하면
  # 각 자릿수를 계산한다

  # 주어진 컬럼값을 26을 기준으로 나눠서 배열에 집어넣는다
  split_numbers = split_number column_number

  # 집어넣은 각 숫자에 매칭되는 문자를 배열에 집어넣는다
  letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z).map {|ch| ch.upcase}
  column_letters = []
  split_numbers.each {|n| column_letters << letters[n - 1]}

  # 배열을 합쳐서 반환한다
  column_letters.join("")
end

def split_number cn
  if cn < 26
    return [cn]
  end
  res = []
  while cn >= 26 do
    res << cn % 26
    cn = cn / 26
  end
  res << cn
  res.reverse!
end

def x n
  if n <= 3
    return [n]
  end
  # 끝부터 넣고 마지막에 뒤집으면 어떨까?
  res = []
  while n >= 4 do
    res << n % 4
    n = n / 4
  end
  res << n
  res.reverse!
end

p x(4) == [1, 1]
p x(8) == [2, 2]
p x(9) == [3, 0]
p x(10) == [1, 0, 1]
p x(13) == [1, 1, 1]
#p x(32) == []
