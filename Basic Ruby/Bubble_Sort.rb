def bubble_sort to_sort
	swap = 1
	swap_area = to_sort.length - 1
	while swap > 0
		swap = 0
		swap_area.times do |x|
			if to_sort[x] > to_sort[x+1]
				to_sort[x], to_sort[x+1] = to_sort[x+1], to_sort[x]
				swap += 1
			end
		end
		swap_area -= 1
	end
	p to_sort
end

bubble_sort([4,3,78,2,0,2,])

def bubble_sort_by to_sort
	swap = 1
	swap_area = to_sort.length - 1
	while swap > 0
		swap = 0
		swap_area.times do |x|
			if yield(to_sort[x], to_sort[x+1]) > 0
				to_sort[x], to_sort[x+1] = to_sort[x+1], to_sort[x]
				swap += 1
			end
		end
		swap_area -= 1
	end
	p to_sort
end



bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
 end
 