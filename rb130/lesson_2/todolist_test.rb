require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist2'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_same(@todos.first, @list.first)
  end

  def test_last
    assert_same(@todos.last, @list.last)
  end

  def test_shift
    # return first item
    assert_same(@todos.shift, @list.shift)

    # remove first item in list
    assert_equal(@todos, @list.to_a)
  end

  def test_pop
    # return last item
    assert_same(@todos.pop, @list.pop)

    # remove last item
    assert_equal(@todos, @list.to_a)
  end

  def test_done?
    @list.to_a.all? { |todo| refute(todo.done?) }
  end

  def test_raise_add_not_todo
    assert_raises(TypeError) do
      @list.add(1)
    end
  end

  def test_shovel
    new_todo = Todo.new("Cook lunch")
    assert_same(@list.size + 1, (@list << new_todo).size)
    assert_same(@list.last, new_todo)
  end

  def test_add
    new_todo = Todo.new("Cook lunch")
    assert_same(@list.size + 1, @list.add(new_todo).size)
    assert_same(@list.last, new_todo)
  end

  def test_item_at
    outbounds = @list.size
    assert_raises(IndexError) { @list.item_at(outbounds) }

    inbounds = rand(0..(@list.size - 1))
    assert_equal(@todos[inbounds], @list.item_at(inbounds))
  end

  def test_mark_done_at
    outbounds = @list.size
    assert_raises(IndexError) { @list.item_at(outbounds) }

    inbounds = rand(0..(@list.size - 1))
    @list.mark_done_at(inbounds)
    assert(@list.item_at(inbounds).done?)
  end

  def test_mark_undone_at
    outbounds = @list.size
    assert_raises(IndexError) { @list.item_at(outbounds) }

    inbounds = rand(0..(@list.size - 1))
    @list.mark_undone_at(inbounds)
    refute(@list.item_at(inbounds).done?)
  end

  def test_done!
    @list.done!
    @list.to_a.all? { |todo| assert(todo.done?) }
  end

  def test_remove_at
    outbounds = @list.size
    assert_raises(IndexError) { @list.item_at(outbounds) }

    inbounds = rand(0..(@list.size - 1))
    assert_equal(@todos.delete_at(inbounds), @list.remove_at(inbounds))
    assert_equal(@todos, @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one
    single_done = <<~SINGLE.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    SINGLE

    @list.mark_done_at(0)
    assert_equal(single_done, @list.to_s)
  end

  def test_to_s_all
    all_done = <<~ALL.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    ALL

    @list.done!
    assert_equal(all_done, @list.to_s)
  end

  def test_each
    i = 0
    @list.each do |todo|
      assert_same(@todos[i], todo)
      i += 1
    end
  end

  def test_each_return_self
    assert_same(@list, @list.each(&:itself))
  end

  def test_select
    @list.mark_done_at(1)
    new_list = @list.select(&:done?)
    assert_instance_of(TodoList, new_list) && refute_same(@list, new_list)
    assert(new_list.done?)
  end

  def test_find_by_title
    refute(@list.find_by_title("Cook lunch"))
    assert_same(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    @list.all_done.each { |todo| assert(todo.done?) }
  end

  def test_all_not_done
    @list.all_not_done.each { |todo| refute(todo.done?) }
  end

  def test_mark_done
    refute(@list.find_by_title("Cook lunch"))
    @list.mark_done("Buy milk")
    assert(@list.find_by_title("Buy milk").done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    @list.each { |todo| assert(todo.done?) }
  end

  def test_mark_all_undone
    @list.mark_all_undone
    @list.each { |todo| refute(todo.done?) }
  end
end
