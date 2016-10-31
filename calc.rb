def calculate(str)   # "   2 * ( 2 + 2)"
  str.gsub!(/\s/,'') #Без пробілів "2*(2+2)"

  # Обробляємо дужки
  str.gsub!(/\((\d+)\*(\d+)\)/){$1.to_i * $2.to_i}
  str.gsub!(/\((\d+)\/(\d+)\)/){$1.to_i / $2.to_i}
  str.gsub!(/\((\d+)\+(\d+)\)/){$1.to_i + $2.to_i}
  str.gsub!(/\((\d+)\-(\d+)\)/){$1.to_i - $2.to_i}

  # Можна переробити всі від’ємні операції на додатні із числом із знаком -

  # Дії без дужок
  str.gsub!(/(\d+)\*(\d+)/){$1.to_i * $2.to_i}
  str.gsub!(/(\d+)\/(\d+)/){$1.to_i / $2.to_i}
  str.gsub!(/(\d+)\+(\d+)/){$1.to_i + $2.to_i}
  str.gsub!(/(\d+)\-(\d+)/){$1.to_i - $2.to_i}



  return str # dont forget to_i !!!!!!!!!!!!!!!!!!!!!!!!!!
end

#   2*3+(-4+2) + 1".gsub(/\D+/,'').split(//)
#   ["2", "3", "4", "2", "1"]

#   "2*10+(-4+2) + 1".scan(/\d+/)
#   ["2", "10", "4", "2", "1"]

#   "-1".to_i - "1".to_i


#  "2*3+(4+2) + (1+1)".gsub(/\((\d+)\+(\d+)\)/){$1.to_i + $2.to_i}

puts calculate("   2 * ( 2 + 2)") # 8
puts calculate(" 4 / (1 + 1) ") # 2
puts calculate(" 5 + 2 -10 ") # -3
puts calculate("2 * (2 + 2) - 8") # 0
puts calculate("1 + (-2)") #-1
puts calculate("2 * 2") # 4
puts calculate("2 * 2 + 2") # 6
# puts calculate(" ") # 
puts calculate(" -1 - 1") #-2