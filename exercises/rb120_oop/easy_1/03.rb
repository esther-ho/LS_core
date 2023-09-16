class Book
  attr_reader :author, :title
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further exploration
# - `attr_reader` and `attr_writer` are separate getter and setter methods, whereas `attr_accessor` defines both getter and setter methods
# - Since we only need to read the values stored in `@author` and `@title`, using only a getter prevents others from reassigning the instance variables
# - To prevent modification of the title and author, it would be better to have separate public methods that return a duplicate string of the values references by `@author` and `@title`

# - Defining the methods instead of using `attr_reader` does not change the behaviour of the class. However, it can clutter the class definition. Defining getter methods works if the getter needs to modify the referenced values.
