=begin
--- P
Input: two arguments
- data e.g. numbers 1 - 10
- "next" field point to next element in the list
Class needs:
- Two classes - Element and SimpleLinkedList
- Element#initialize takes up to 2 arguments
  - Number
  - Another element
- Element#datum returns data contained in self
- Element#next returns `Element` object contained in self
- Element#tail? returns `true` if self#next is `nil`
- SimpleLinkedList#size returns length of linked list
- SimpleLinkedList#push takes one argument and ADDS `Element` object to linked list
- SimpleLinkedList#pop removes last added element in linked list and returns the data
- SimpleLinkedList#empty? returns true if linked list is empty
- SimpleLinkedList#peek returns DATUM of last added element in linked list
- SimpleLinkedList#head returns last added element in linked list
- SimpleLinkedList::from_a takes one argument and converts it to a linked list
  - Argument is either nil or an array object
- SimpleLinkedList#to_a converts linked list to an array of data
- SimpleLinkedList#reverse reverses the order of the linked list
  - self#next points to the previous element rather than the next element
--- E
Structure:
1 element -> both head and tail
2nd element (head) --next--> 1st element (tail)

Element.new(1).datum => 1
Element.new(1).tail? => true
Element.new(1).next => nil
SimpleLinkedList.push(1).size => 1
SimpleLinkedList.push(1).peek => 1
SimpleLinkedList.push(1).pop => 1
SimpleLinkedList.from_a([1, 2]).to_a => [1, 2]
from_a: [1, 2] -> 1 (head) --next--> 2 (tail)
--- D
Input: integer
Output: linked list object
- Elements as collaborators
- Each element has a data field, and a "next" field
--- A
- Element has data and "next" field
  - Assign "next" to nil as default
- SimpleLinkedList#size returns length of linked list
  - Check @list field
- SimpleLinkedList#push takes one argument and ADDS `Element` object to linked list
  - Instantiate `Element` object
  - Modify "next" field in new element to last element in list
  - Add new element to list
- SimpleLinkedList#pop removes last added element in linked list and returns the data
  - Modify "next" field of second-last element to nil
  - Remove last element
  - Return datum of popped element
- SimpleLinkedList#empty? returns true if linked list is empty
- SimpleLinkedList#peek returns DATUM of last added element in linked list
- SimpleLinkedList#head returns last added element in linked list
- SimpleLinkedList::from_a takes one argument and converts it to a linked list
  - Argument is either nil or an array object
  - Instantiate `SimpleLinkedList` object
  - Reverse array, iterate through array elements and invoke #push on each iteration, passing in each array element as an argument
- SimpleLinkedList#to_a converts linked list to an array of data
  - Iterate through the linked list, invoke #data on each element, and return new array in REVERSE
- SimpleLinkedList#reverse reverses the order of the linked list
  - Instantiate new linked list object
  - self#next points to the previous element rather than the next element
  - Reverse array of elements
  - Iterate through array and assign the "next" field of the current element to that of the next element
  - Return new linked list
=end

class Element
  attr_reader :datum, :next

  def initialize(datum, _next = nil)
    @datum = datum
    @next = _next
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def self.from_a(array)
    return new unless array
    array.reverse.each_with_object(new) { |datum, list| list.push(datum) }
  end
  
  def size
    list.size
  end

  def empty?
    list.empty?
  end
  
  def peek
    empty? ? nil : list.last.datum
  end

  def head
    list.last
  end

  def push(datum)
    list << Element.new(datum, list[-1])
    self
  end

  def pop
    list.pop.datum
  end

  def to_a
    list.map(&:datum).reverse
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  private

  attr_reader :list
end
