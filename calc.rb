def make_rpn(expression)    # "  ( 2 + 3   )* ( 4 - 1)"
  str = expression.clone
  rpn_str = [] # новий масив для перетвореної строки
  stack = [] # кейс для операторів під час перетворення

  arr_of_elements = str.gsub(/\s/,'').scan(/\d+|\W/)        # "(2+3)*(4-1)" -> 
                                      #  ["(", "2", "+", "3", ")", "*", "(", "4", "-", "1", ")"]
  priority = { "(" => 1, "+" => 2, "-" => 2, "*" => 3, "/" => 3}

  arr_of_elements.each do |element| 
    if element =~ /\d+/
      rpn_str << element
    elsif element == "("
      stack << element
    elsif element == ")"
      rpn_str << stack.pop until priority[stack.last] == 1
      stack.pop
    elsif stack.empty? || (priority[stack.last] < priority[element])
      stack << element
    elsif (priority[stack.last] > priority[element]) || (priority[stack.last] = priority[element])
      rpn_str << stack.pop
      stack << element

    end
  end

  while !stack.empty? do
     rpn_str << stack.pop
  end

  return rpn_str  # 23+41-*
end

# на виході має утворитись 23+41-*

puts make_rpn("  ( 2 + 3   ) * ( 4 - 1)") # 23+41-*
puts make_rpn("  ( 2 + 3   ) * ( 1 - 4)") # 23+14-*
# puts make_rpn("1-2+(8-5+2*3)*4") # 1 2 - 8 5 - 2 3 * + 4 * +
# puts make_rpn("1 + (-2)") # 1 2 - +
# puts make_rpn("")
# puts make_rpn("")



def calculate(expression)
  rpn_expression = make_rpn(expression)
  stack = [] # Стек для чисел
  rpn_expression.each do |element|
    if element =~ /\d+/
      stack << element
    else
      operands = stack.pop(2) # Вирізаємо 2 останні числа зі стеку
      case
      when element == "*"
        stack << (operands[0].to_i * operands[1].to_i)
      when element == "/"
        stack << (operands[0].to_i / operands[1].to_i)
      when element == "+"
        stack << (operands[0].to_i + operands[1].to_i)
      when element == "-"
        stack << (operands[0].to_i - operands[1].to_i)
      end
    end
  end

  stack.last
end

# print calculate("23+41-*") # -15
# puts
# print calculate("23+14-*") # 15
# puts
# print calculate("12-85-23*+4*+") # 35
# puts
# print calculate("12-+") # 0
# puts

puts calculate("  ( 2 + 3   ) * ( 4 - 1)") # 23+41-*
puts calculate("  ( 2 + 3   ) * ( 1 - 4)")
puts make_rpn ("40+2")
puts make_rpn ("40+3")
puts make_rpn ("50-10")
puts make_rpn ("-1-1")

puts calculate("40+2")
puts calculate("40+3")
puts calculate("50-10")
puts calculate("-1-1")

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
