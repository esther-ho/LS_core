arr = ["9", "8", "7", "10", "11"]
# p is binding to `arr.sort` so the block passed to `sort` is ignored
p (arr.sort do |x, y|
    y.to_i <=> x.to_i
  end)

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 
