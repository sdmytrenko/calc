def make_rpn(expression)    # "  ( 2 + 3   )* ( 4 - 1)"
  rpn_str = [] # новий масив для перетвореної строки
  stack = [] # кейс для операторів під час перетворення
  arr_of_elements = expression.gsub(/\s/,'').scan(/\d+|\W/) # Без пробілів і засуваємо посимвольно в масив
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
    elsif (priority[stack.last] >= priority[element])
      rpn_str << stack.pop
      stack << element
    end
  end

  while !stack.empty? do
     rpn_str << stack.pop
  end

  return rpn_str  # на виході ['2','3','+','4','1','-','*']
end


def calculate(expression)
  rpn_expression = make_rpn(expression)
  stack = [] # Стек для чисел

  rpn_expression.each do |element|
    if element =~ /\d+/
      stack << element
    else
      oper1, oper2 = stack.pop(2) # (2.send("+" 3)) Вирізаємо 2 останні числа зі стеку 
      oper1, oper2 = oper2 ? [oper1, oper2] : [0, oper1]
      case
      when element == "*" then stack << (oper1.to_i * oper2.to_i)
      when element == "/" then stack << (oper1.to_i / oper2.to_i)
      when element == "+" then stack << (oper1.to_i + oper2.to_i)
      when element == "-" then stack << (oper1.to_i - oper2.to_i)
      end
    end
  end

  stack.last
end

