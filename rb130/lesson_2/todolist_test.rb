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
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_raise_add_not_todo
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hello') }
    assert_raises(TypeError) { @list.add([1]) }
  end

  def test_shovel
    new_todo = Todo.new("Cook lunch")
    @list << new_todo
    assert_equal([*@todos, new_todo], @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Cook lunch")
    @list.add(new_todo)
    assert_equal([*@todos, new_todo], @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(5) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.item_at(5) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.item_at(5) }
    @list.done!
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.item_at(5) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
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

  def test_to_s_2
    single_done = <<~SINGLE.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    SINGLE

    @list.mark_done_at(0)
    assert_equal(single_done, @list.to_s)
  end

  def test_to_s_3
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
      assert_equal(@todos[i], todo)
      i += 1
    end
  end

  def test_each_returns_self
    assert_equal(@list, @list.each(&:itself))
  end

  def test_select
    @todo2.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo2)
    select_list = @list.select(&:done?)
    assert_instance_of(TodoList, select_list)
    assert_equal(select_list.title, new_list.title)
    assert_equal(select_list.to_s, new_list.to_s)
  end

  def test_find_by_title
    assert_nil(@list.find_by_title("Cook lunch"))
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1)
    done_list = @list.all_done
    assert_equal(new_list.to_s, done_list.to_s)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo3)
    undone_list = @list.all_not_done
    assert_equal(new_list.to_s, undone_list.to_s)
  end

  def test_mark_done
    assert_nil(@list.find_by_title("Cook lunch"))
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
end
