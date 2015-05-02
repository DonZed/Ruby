def substrings string, dictionary
	frequencies = Hash.new(0)
	words = string.split(" ")
	words.each do |word|
		dictionary.each do |to_fit|
			if word =~ /#{to_fit}/
				frequencies[to_fit] += 1 
			end
		end
	end
	puts frequencies
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# substrings("below", dictionary)

substrings("Howdy partner, sit down! How's it going?", dictionary)