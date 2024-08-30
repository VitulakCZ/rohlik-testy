def is_num?(str)
  !!Integer(str, 10)
rescue ArgumentError, TypeError
  false
end

konec = false
while !konec do
  x = nil
  while x == nil do
    print "Kolik rohlíků? "
    x = gets.chomp
    if !is_num?(x)
      puts "Jsi kokot!"
      x = nil
    end
  end

  konec2 = false
  while !konec2 do
    y = nil
    while y == nil do
      print "Kolik zaplatíš? "
      y = gets.chomp
      if !is_num?(y)
        puts "Jsi kokot!"
        y = nil
      end
    end

    if y.to_i < x.to_i * 3
      while true
        print "To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: "
        z = gets.chomp.upcase

        if z == "Z"
          konec2 = true
          break
        elsif z == "C"
          break
        elsif z == "E"
          konec2 = true
          konec = true
          break
        end
        puts "Jsi kokot!"
      end
    else
      puts x
      konec = true
      break
    end
  end
end
