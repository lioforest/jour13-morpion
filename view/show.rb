class Show

  def show_board(a1, a2, a3, b1, b2, b3, c1, c2, c3)

    puts "        A         B          C"
    puts "   ________________________________"
    puts "  |          |          |          |"
    puts "  |          |          |          |"
    puts "1 |    #{a1.content}    |    #{b1.content}    |    #{c1.content}    |"
    puts "  |          |          |          |"
    puts "  |__________|__________|__________|"
    puts "  |          |          |          |"
    puts "  |          |          |          |"
    puts "2 |    #{a2.content}    |    #{b2.content}    |    #{c2.content}    |"
    puts "  |          |          |          |"
    puts "  |__________|__________|__________|"
    puts "  |          |          |          |"
    puts "  |          |          |          |"
    puts "3 |    #{a3.content}    |    #{b3.content}    |    #{c3.content}    |"
    puts "  |          |          |          |"
    puts "  |__________|__________|__________|"


  end

end
