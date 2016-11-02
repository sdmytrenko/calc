def calculate(expression)   # "   2 * ( 2 + 2)"
  str = expression.clone
  str.gsub!(/\s/,'')        # "2*(2+2)"

  # Правило для додавання від’ємного числа в дужках
  str.gsub!(/\(\-(\d+)\)/){-$1.to_i}

    # Правило для будь-якого від’ємного числа
  str.gsub!(/(\d+)\*\-(\d+)/){-$1.to_i * $2.to_i}
  str.gsub!(/(\d+)\/\-(\d+)/){-$1.to_i / $2.to_i}
  str.gsub!(/(\d+)\+\-(\d+)/){$1.to_i - $2.to_i}
  str.gsub!(/(\d+)\-\-(\d+)/){$1.to_i + $2.to_i}

  # Правило для першого від’ємного числа
  str.gsub!(/^\-(\d+)\*(\d+)/){-$1.to_i * $2.to_i}
  str.gsub!(/^\-(\d+)\/(\d+)/){-$1.to_i / $2.to_i}
  str.gsub!(/^\-(\d+)\-(\d+)/){-$1.to_i - $2.to_i}
  str.gsub!(/^\-(\d+)\+(\d+)/){-$1.to_i + $2.to_i}

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

  return str.to_i
end




# puts calculate("   2 * ( 2 + 2)") # 8
# puts calculate(" 4 / (1 + 1) ") # 2
# puts calculate("2 * (2 + 2) - 8") # 0
# puts calculate("1 + (-2)") # -1
# puts calculate("2 * 2") # 4
# puts calculate("2 * 2 + 2") # 6
# puts calculate(" -1 - 1") # -2

# puts calculate("          5 - 10 ") # -5
# puts calculate(" 5 + 2 -10 ") # -3
# puts calculate(" -1 - 1 + 4 ") # 2
# puts calculate(" (-4) * 3 + 4 ") # -8
# puts calculate("  3 *   (-4) + 4 ") # -8
# puts calculate(" - 1 * 2 + 4 - 3") # -1
# puts calculate("-5 * 2 /5")  # -2
