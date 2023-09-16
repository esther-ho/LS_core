class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration
# - A potential problem of instantiatizing Book objects that are not initialized is that if we invoke a getter method on the object, the return value would be nil.
# - Also, using public setter methods can potentially lead to unintended changes to the objects referenced by the instance variables
