factorial = Enumerator.new do |y|
  a = 1
  count = 0
  loop do
    y << a
    count += 1
    a *= count
  end
end

6.times { puts factorial.next }
3.times { puts factorial.next }
factorial.rewind
6.times { puts factorial.next }
