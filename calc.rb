def make_rpn(expression)    # "  ( 2 + 3   )* ( 4 - 1)"
  str = expression.clone
  rpn_str = '' # нова строка /масив для перетвореної строки
  stack = [] # кейс для операторів під час перетворення

  arr_of_elements = str.gsub(/\s/,'').split(//)        # "(2+3)*(4-1)" -> 
                                      #  ["(", "2", "+", "3", ")", "*", "(", "4", "-", "1", ")"]
  priority = { "(" => 1, "+" => 2, "-" => 2, "*" => 3, "/" => 3}

  arr_of_elements.each do |element| 
    if element =~ /\d+/ #("0".."9").include?(element)  #i =~ /\d+/ 
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

  return rpn_str
# end


    

      



        

  #   else
  #     case element
  #     when element == "("
  #       stack << element
  #     when stack.empty? || priority[stack.last] < priority[element]
  #       stack << element
  #     when priority[stack.last] >= priority[element]
  #       rpn_str << stack.pop until priority[stack.last] == priority[element]  #true
  #       rpn_str << element
  #     when element == ")"
  #       rpn_str << stack.pop until priority[stack.last] == 1
  #       stack.pop
  #     end
  #   end
  # end
  # if !stack.empty?
  #   rpn_str << stack.reverse
  # end
  # return rpn_str
end


      
      
      
      

# Рассматриваем поочередно каждый символ:
# 1. Если этот символ - число (или переменная), то просто помещаем его в выходную строку. +++
# 2. Если символ - знак операции (+, -, *, / ), то проверяем приоритет данной операции.  +++
#   Операции умножения и деления имеют наивысший приоритет (допустим он равен 3). 
#   Операции сложения и вычитания имеют меньший приоритет (равен 2). 
#   Наименьший приоритет (равен 1) имеет открывающая скобка.
# Получив один из этих символов, мы должны проверить стек: 
# а) Если стек все еще пуст, или находящиеся в нем символы ( а находится в нем 
# могут только знаки операций и открывающая скобка) 
# имеют меньший приоритет, чем приоритет текущего символа, то помещаем текущий символ в стек. +++
# б) Если символ, находящийся на вершине стека имеет приоритет, 
# больший или равный приоритету текущего символа, то извлекаем символы из стека 
# в выходную строку до тех пор, пока выполняется это условие; затем переходим к пункту а).
# 3. Если текущий символ - открывающая скобка, то помещаем ее в стек.
# 4. Если текущий символ - закрывающая скобка, то извлекаем символы из стека в 
# выходную строку до тех пор, пока не встретим в стеке открывающую скобку 
# (т.е. символ с приоритетом, равным 1), которую следует просто уничтожить. 
# Закрывающая скобка также уничтожается.




# на виході має утворитись 23+41-*





puts make_rpn("  ( 2 + 3   ) * ( 4 - 1)") # 23+41-*
puts make_rpn("1-2+(8-5+2*3)*4") # 1 2 - 8 5 - 2 3 * + 4 * +
# puts make_rpn("")
# puts make_rpn("")
# puts make_rpn("")



    # if ("0".."9").include?(element) # крута фіча
    #   rpn_str << element
    # elsif element == '('
    #   stack << element
    # elsif stack.empty? || priority[stack.last] < priority[element]
    #   stack << element
    



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
