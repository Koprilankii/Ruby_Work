def main()
    words = ["стіл", "тумба", "ліжко", "крісло", "табуретка", "колона", "кіт", "бронизавр", "пес", "очки"]
    level = [9, 7, 5]                                   
    target_word = words[rand(words.length)]        
    must_guess = target_word.length                
    have_attemps = level[rand(level.length)]      

    mistakes_ch = ""
    correct_ch = ""
    guesed_word = Array.new(target_word.length, "_")

    puts "\n------------------------------------------------------------------------------------------"
    puts "Вас приговорили до страти, але милосердный Король дав вам шанс врятувати своє життя!"
    puts "вгадайте слово за #{have_attemps} спроб и будете помилувані"
    puts "\n------------------------------------------------------------------------------------------"

    while have_attemps != 0 && must_guess != 0 do
        puts "\nСлово: #{guesed_word.join(".")}"
        puts "Залишилось спроб: #{have_attemps}"
        puts "помилки: #{mistakes_ch}"
        
        print "Буква: "
        guess = gets.chomp
    
        if !(guess =~ /[а-яА-Я]/) || guess.length > 1 
            puts "<< !Ви ввели більше ніж одну букву чи інший символ!"
            next
        elsif correct_ch.include?(guess)
            puts "<< !Ви вже відгадали цю букву!"
            next
        end

        number_matche = target_word.count(guess.downcase)
        if number_matche == 0
            puts "<< Ой, Ви помилилсь "
            have_attemps -= 1
            if !mistakes_ch.include?(guess) 
                mistakes_ch << guess << " "
            end
        else
            puts "<< Ви вгадали, щасливчик"
            must_guess -= number_matche
            guesed_word = change_displayed_string(guesed_word, target_word, guess, number_matche)
            correct_ch << guess
        end
    end

    puts "\n----------------------------------------------------------------------------------"
    if  must_guess == 0 
        puts "Ви зберегли своє життя!\n\n--(^_^) YOU WIN (^_^)--"
    else
        puts "Вам не вдалось переграти короля\n\n(~_~) YOU LOSE (~_~)" 
    end
    puts "Загадане слово: #{target_word}"
    puts "-----------------------------------------------------------------------------------"

end

def change_displayed_string(guesed_word, target_word, guess, number_matche)
    d = 0
    replace = 0
    while replace < number_matche do
        if target_word[d] == guess
            guesed_word[d] = guess
            replace += 1
        end
        d += 1
    end

    return guesed_word
end

main()