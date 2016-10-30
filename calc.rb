def calculate(str)   # "   2 * ( 2 + 2)"
  str.gsub!(/\s/,'') #Без пробілів "2*(2+2)"

  # Обробляємо дужки
  str.gsub!(/\((\d+)\*(\d+)\)/){$1.to_i * $2.to_i}
  str.gsub!(/\((\d+)\/(\d+)\)/){$1.to_i / $2.to_i}
  str.gsub!(/\((\d+)\+(\d+)\)/){$1.to_i + $2.to_i}
  str.gsub!(/\((\d+)\-(\d+)\)/){$1.to_i - $2.to_i}

  # Дії без дужок
  str.gsub!(/(\d+)\*(\d+)/){$1.to_i * $2.to_i}
  str.gsub!(/(\d+)\/(\d+)/){$1.to_i / $2.to_i}
  str.gsub!(/(\d+)\+(\d+)/){$1.to_i + $2.to_i}
  str.gsub!(/(\d+)\-(\d+)/){$1.to_i - $2.to_i}



  return str





end


#  "2*3+(4+2) + (1+1)".gsub(/\((\d+)\+(\d+)\)/){$1.to_i + $2.to_i}

puts calculate("   2 * ( 2 + 2)") # 8
puts calculate(" 4 / (1 + 1) ") # 2
puts calculate("2 * (2 + 2) - 8") # 0
puts calculate("1 + (-2)") #-1
puts calculate("2 * 2") # 4
puts calculate("2 * 2 + 2") # 6
