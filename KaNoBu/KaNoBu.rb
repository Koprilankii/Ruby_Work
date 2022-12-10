def main()
	puts "[0 - ножиці, 1 - камінь, 2 - папір]"
	computer_choise = rand(3)
	user_choise = gets.to_i

	result = user_choise - computer_choise
	print_result(result, computer_choise)

	if (result == 1) || (result == -2) 
		puts "користувач переміг: комп’ютер обрав " + convert_to_text(computer_choise)
	elsif  (result == -1) || (result == 2)  
		puts "користувач програв: комп’ютер обрав " + convert_to_text(computer_choise)
	else
		puts "нічия: комп’ютер обрав " + convert_to_text(computer_choise)
	end
end

def convert_to_text(digit_t)

	if digit_t == 0
		return "ножиці"
	elsif digit_t == 1
		return "камінь"
	elsif digit_t == 2
		return "папір"
	else
		return ""
	end
end

main()