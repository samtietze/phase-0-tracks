class TodoList
  # Takes in array of strings, based on the spec file
  def initialize(list)
    @list = list
  end

  def get_items
    @list
  end

  def add_item(task)
    @list << task
  end

  def delete_item(task)
    @list.delete(task)
  end

end