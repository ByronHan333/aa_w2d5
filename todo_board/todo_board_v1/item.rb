class Item
  attr_accessor :title, :deadline, :description

  def self.valid_date?(date_string)
    y,m,d = date_string.split('-').map(&:to_i)
    return false if m > 12 || m < 1
    return false if d > 31 || d < 1
    return false if y < 1000
    true
  end

  def initialize(title, deadline, description)
    @title = title
    @description = description
    raise "invalid date" if !Item.valid_date?(deadline)
    @deadline = deadline
  end

  def deadline=(date)
    raise "invalid date" if !Item.valid_date?(date)
    @deadline = date
  end
end


