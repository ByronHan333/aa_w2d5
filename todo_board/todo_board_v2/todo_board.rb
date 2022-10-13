require_relative 'list'

class TodoBoard
  def initialize()
    @lists = {}
  end

  def mklist(name)
    @lists[name] = List.new(name)
  end

  def ls
    puts @lists.keys
  end

  def showall
    @lists.each{|k,v| v.print}
  end

  def get_command
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')
    list_label = nil
    parameters = nil

    if !args.empty? && args.length == 1 && cmd != 'mklist'
      list_label = args[0]
      chosen_list = @lists[list_label]
      # puts "#{chosen_list}"
    end

    if !args.empty? && args.length > 1
      list_label = args[0]
      chosen_list = @lists[list_label]
      parameters = args[1..-1]
      # puts "#{chosen_list}, #{parameters}"
    end

    case cmd
    when 'mklist'
      mklist(*args)
    when 'ls'
      self.ls
    when 'showall'
      self.showall
    when 'mktodo'
      chosen_list.add_item(*parameters)
    when 'up'
      chosen_list.up(*parameters.map(&:to_i))
    when 'down'
      chosen_list.down(*parameters.map(&:to_i))
    when 'swap'
      chosen_list.swap(*parameters.map(&:to_i))
    when 'sort'
      chosen_list.sort_by_date!
    when 'priority'
      chosen_list.print_priority
    when 'print'
      # puts "parameters: #{parameters}"
      if !parameters.empty?
        chosen_list.print_full_item(*parameters.map(&:to_i))
      else
        chosen_list.print
      end
    when 'toggle'
      chosen_list.toggle_item(*parameters.map(&:to_i))
    when 'rm'
      chosen_list.remove_item(*parameters.map(&:to_i))
    when 'purge'
      chosen_list.purge
    when 'quit'
      return false
    else
      print "Sorry, that command is not recognized."
    end
    true
end

  def run
    res = true
    while res
      res = get_command
    end
  end

end

m = TodoBoard.new()
m.run
