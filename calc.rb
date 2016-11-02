def make_rpn(expression)    # "  ( 2 + 3   )* ( 4 - 1)"
  str = expression.clone
  rpn_str = '' # нова строка /масив для перетвореної строки
  stack = [] # кейс для операторів під час перетворення

  arr_of_elements = str.gsub(/\s/,'').split(//)        # "(2+3)*(4-1)" -> 
                                      #  ["(", "2", "+", "3", ")", "*", "(", "4", "-", "1", ")"]
  priority = { "(" => 1, "+" => 2, "-" => 2, "*" => 3, "/" => 3}

  arr_of_elements.each |element| do
    if ("0".."9").include?(element) # крута фіча
      rpn_str << element
    elsif element == '('
      stack << element
    elsif stack.empty? || priority[stack.last] < priority[element]
      stack << element
    









end

# на виході має утворитись 23+41-*





puts make_rpn("  ( 2 + 3   )* ( 4 - 1)")



# def calculate(expression)
#   #   str = expression.clone
#   # str.gsub!(/\s/,'').split(//)
#   # aaaa = make_rpn(str)
#   yield

#   # return str.to_i
# end

# symbols = %w{ + - / * ( ) }
# arr.collect! do |c|
# priority[stack.last] < priority[$1]









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
