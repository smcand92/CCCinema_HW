require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
