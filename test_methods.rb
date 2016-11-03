 def evaluate(rpn)
    a = rpn.split(' ')
    array = a.inject([]) do |array, i|    
      if i =~ /\d+/ 
        array << i.to_i
      else
        array << array.pop(2).reduce(op(i))
      end
    end
  end

puts evaluate("  ( 2 + 3   )* ( 4 - 1)")