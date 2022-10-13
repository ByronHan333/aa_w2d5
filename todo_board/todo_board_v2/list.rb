require_relative 'item'

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description='')
    item = Item.new(title,deadline,description)
    return false if !item
    @items << item
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if index < 0 || index >= @items.length
    true
  end

  def swap(idx1, idx2)
    return false if !valid_index?(idx1) || !valid_index?(idx2)
    @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
    true
  end

  def [](idx)
    @items[idx]
  end

  def priority
    self[0]
    # @items[0]
  end

  def print
    puts '-'*50
    puts "#{@label}".upcase.center(50)
    puts '-'*50
    puts "Index".ljust(6) + "| " + "Item".ljust(19) + "| " + "Deadline".ljust(13) + "| " + "Done".ljust(9)
    puts '-'*50
    @items.each_with_index do |item, i|
      puts "#{i}".ljust(6) + "| " + "#{item.title}".ljust(19) + "| " + "#{item.deadline}".ljust(13) + "| " + "#{item.done}".ljust(9)
    end
    puts '-'*50
  end

  def print_full_item(idx)
    if valid_index?(idx)
      puts '-'*50
      puts "#{@items[idx].title}"
      puts "#{@items[idx].deadline}"
      puts "#{@items[idx].description}"
      puts "#{@items[idx].done}"
      puts '-'*50
    end
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(idx, amount=1)
    return false if !valid_index?(idx)
    while amount > 0 && idx - 1 >= 0
      swap(idx, idx - 1)
      amount -= 1
      idx -= 1
    end
    true
  end

  def down(idx, amount=1)
    return false if !valid_index?(idx)
    while amount > 0 && idx + 1 < @items.length
      swap(idx, idx + 1)
      amount -= 1
      idx += 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by! {|item| item.deadline}
  end

  def toggle_item(idx)
    @items[idx].toggle if valid_index?(idx)
  end

  def remove_item(idx)
    @items.delete_at(idx) if valid_index?(idx)
  end

  def purge
    @items.delete_if{|item| item.done}
  end
end


# p my_list = List.new('Groceries')
# p my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# p my_list.add_item('toothpaste', '2019-10-25')
# my_list.print


# l = List.new('Groceries')
# l.add_item('cheese', '2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.add_item('shampoo', '2019-10-24')
# l.add_item('candy', '2019-10-31')
# l.print
# p l.down(0)
# l.print
# p l.down(0, 2)
# l.print
# p l.up(3, 10)
# l.print
# p l.up(7, 3)

# l = List.new('Groceries')
# l.add_item('cheese', '2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.add_item('shampoo', '2019-10-24')
# l.add_item('candy', '2019-10-31')
# l.print
# l.sort_by_date!
# l.print
