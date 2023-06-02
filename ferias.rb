require 'active_support'
require 'active_support/core_ext/date/calculations'
require 'date'

def get_current_month_days
  today = Date.today
  first_day = Date.new(today.year, today.month, 1)
  last_day =first_day.next_month - 1
  (first_day.day..last_day.day).count
end

def get_days
  puts 'Digite o número de dias de venda (entre 1 e 10):'
  gets.chomp.to_i
end

def get_value_rent(salary, days)
  puts "Você selecionou #{days} dias."
  (salary / get_current_month_days) * days * 1.3
end

def valid_date?(days)
  days >= 1 && days <= 10
end

puts 'Digite seu salário: '
salary = gets.chomp.to_f

days = get_days

if valid_date?(days)
  value_rent = get_value_rent(salary, days)
  puts "Seu valor da venda das férias é de: ", value_rent
else
  puts 'Número inválido de dias de venda. Por favor, escolha um valor entre 1 e 10.'
  puts "Você deve informar uma data menor que a data vigente!" if days > get_current_month_days
  puts "Escolha um numero maior que 0" if days < 1
end