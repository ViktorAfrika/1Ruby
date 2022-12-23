require_relative 'main_application.rb'
require_relative 'parser.rb'
require_relative 'cart.rb'

application = MainApplication.new(
  path_to_csv = './data/items.csv',
  path_to_json = './data/items.json',
  path_to_txt = './data/items.txt'
)

cart = Cart.new
ItemContainer.included(cart)

cart.add_item(
  Parser.parse_item('noutbuk_acer_aspire_3_a315-34_nx_he3eu_05c_/512435')
)

item = Parser.parse_item('naushniki_tws_philips_tat2206_black/495323')
cart.add_item(item)

cart.add_item(
  Parser.parse_item('stiralnaya_mashina_beko_wue6511xsw/452462')
)

cart.remove_item(item)

cart.show_all_items

cart.save_to_csv(application)
cart.save_to_json(application)
cart.save_to_txt(application)
