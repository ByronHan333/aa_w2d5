require_relative 'list'
require_relative 'item'
require_relative 'todo_board'

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# my_item = Item.new('Fix login page', '2019-10-42', 'It loads slow.')
# p my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
# p  my_item.title
# my_item.description = 'It loads waaaaaay too slow!'
# p my_item
# my_item.deadline = "10-23-2019"
# my_item.deadline
# my_item.deadline = "2019-10-23"
# my_item.deadline
# my_item

# my_list = List.new('Groceries')
# p my_list.size
# p my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# p my_list.add_item('toothpaste', '2019-10-25')
# p my_list.add_item('toothpaste2', '2019-10-25', 'a', 'b')

# my_board = TodoBoard.new('cool-tech-to-learn')
# p my_board
