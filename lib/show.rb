class Show

def show_board(board)
	
puts board.class
hash=Hash.new

board.boardcase_array.each do |boardcase|
	hash[boardcase.id] = boardcase.value
end

	for i in ["a","b","c"]
		puts "-" * 32
			3.times do
				print "|" + " " * 9
				end
				puts "|"
			for j in ["1","2","3"]
					print "|" + " " * 4 + hash[i+j] + " " * 4
			end
			puts "|"
			3.times do
				print "|" + " " * 9
					end
			puts "|"
	end
	puts "-" * 32


end
end
