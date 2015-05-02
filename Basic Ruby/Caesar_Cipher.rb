def caesar_cipher text, shift_factor = 0
	cipher = ""
	text.each_byte do |char|
		ascii = char + shift_factor
		if char == 32 			#skip if char is a space 
			cipher << char.chr 
		elsif char <= 90		#for |A-Z|
			if ascii > 90
				ascii-= 26
				cipher << ascii.chr
			else
				cipher << ascii.chr
			end	
		else					#for |a-z|
			if ascii > 122
				ascii-= 26
				cipher << ascii.chr
			else
				cipher << ascii.chr
			end
		end
		
	end
	puts cipher
end
puts "Enter text to encrypt:"
text = gets.chomp

puts "Enter shift factor:"
shift_factor = gets.chomp.to_i

caesar_cipher(text, shift_factor)
