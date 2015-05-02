module Enumerable
	def my_each
		i = 0
		if block_given?
			while i < self.length
				yield(self[i])
				i += 1
			end
			self
		else
			to_enum(:my_each)
		end
    end

    def my_each_with_index
    	i = 0
    	if block_given?
    		while i < self.length
    			yield(self[i], i)
    			i += 1
    		end
    		self
    	else
    		to_enum(:my_each_with_index)
    	end
    end

    def my_select
    	array = []
    	if block_given?
    		self.my_each { |item| array.push(item) if yield(item) }
    		array
    	else
    		to_enum(:my_select)
    	end
    end

    def my_all?
    	if block_given?
    		self.my_each { |item| return false unless yield(item) }
    		true
    	else
    		self.my_each { |item| return false unless item }
   			true
    	end
    end

    def my_any?
    	if block_given?
    		self.my_each { |item| return true if yield(item) }
    		false
    	else
    		self.my_each { |item| return true if item }
    		false
    	end
    end

    def my_none?
    	if block_given?
    		self.my_each { |item| return false if yield(item) }
    		true
    	else
    		self.my_each { |item| return false if item}
    		true
    	end
    end

    def my_count *num
    	counter = 0
    	self.my_each do |item|
    		if block_given?
    			counter += 1 if yield(item)
    		elsif num 
    			counter += 1 if num[0] == item 
    		else
    			counter += 1
    		end
    	end
    	counter
    end

    def my_map(&block)
    	if block_given?
    		array = []
    		self.each { |item| array.push(block.call(item)) }
    		array
    	else
    		to_enum(:my_map)
    	end
    end

    def my_inject(initial = nil)
    	memo = initial ? initial : self.shift
    	self.my_each do |item|
    		memo = yield(memo, item)
    	end
    	memo
    end
end


test = [4, 3, 1, 3, 10, 2]
# p test.my_each { |item| print "#{item}! " }
# p test.my_each_with_index { |item, index| puts "#{index}: #{item}"}
# p test.my_select { |item| item > 5}
# p test.my_all? { |item| item < 15 }
# p test.my_any? { |item| item == 3 }
# p test.my_none? { |item| item == 10} 
# p test.my_count { |item| item%2 == 0 }
# p test.my_count(3)
# p test.my_map { |item| item * 10 }
# my_proc = Proc.new { |item| item * 15 }
# p test.my_map(&my_proc)
# p test.my_map
# p test.my_inject { |memo, item| memo * item }
# def multiply_els(array)
# 	array.inject { |result, item| result * item}
# end
# p multiply_els([2, 3, 4])