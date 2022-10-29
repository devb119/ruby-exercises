def stock_picker(stock_prices)
    max_diff = stock_prices[1] - stock_prices[0]
    min_element = stock_prices[0]
    # Assume that best day to buy-sell is 0-1
    result = [0, 1]
    n = stock_prices.size
    for i in 1..n-1 do
        if ((stock_prices[i] - min_element) > max_diff)
            max_diff = stock_prices[i] - min_element 
            result[0] = stock_prices.index(min_element)
            result[1] = i
        end
        if stock_prices[i] < min_element
            min_element = stock_prices[i] 
        end
    end
    result
end

# Solution 2: Using ruby's methods
def stock_picker_2(stock_prices)
    stock_prices.each_with_index.to_a.combination(2).max_by{|buy, sell| sell[0] - buy[0]}.map{|price, day| day}
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker_2([17,3,6,9,15,8,6,1,10])
