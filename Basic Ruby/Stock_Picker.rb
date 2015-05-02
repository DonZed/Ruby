def stock_picker prices
	best_days = []
	best_profit = []
	prices.each_index do |buy|
		prices.each_index do |sell|
			if sell > buy
				best_days.push(prices[sell] - prices[buy])
				if best_days[-1] == best_days.max 
					best_profit = []
					best_profit.push(buy, sell)
				end
			end
		end
	end
	print best_profit
end

stock_picker([17,3,6,9,15,8,6,1,10])