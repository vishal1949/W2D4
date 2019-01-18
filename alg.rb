require 'byebug'
def slowest_sort(arr) # time complexity: (n^2)
    index = 0       #space : O(1)
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if arr[j] < arr[i] && arr[j] < arr[index]
                index = j 
            end
        end
    end 
    arr[index]
end

def good_sort(arr) #time complexity of O(n)
    result = arr[0] #space complexity of 1
    (1...arr.length).each do |i|
        if arr[i] < result
            result = arr[i]
        end
    end
    result
end

def l_cont_sum(arr)
  
    result = []
    (0...arr.length).each do |i|
        com = [arr[i]]
        (i...arr.length).each do |j|
            break if arr[j] == nil
            result << com unless result.include?(com)
            com += [arr[j]] unless i == j
            result << com unless result.include?(com)
        end
    end
    result.map{|sub| sub.inject(:+)}.sort[-1]
end

def awesome_2(arr)
    debugger
    sum = arr.first 
    results = []
    i = 1
    while i < arr.length
        if sum > arr[i] + sum
            results << sum
            sum = arr[i]
        else
            sum += arr[i+1]
        end
        i += 1
    end
    results.sort.pop
end

def awesome(arr)
    greatest_sum = arr[0]
    i = 1
    sum = arr[0]
    while i < arr.size 
        if sum < 0 
            sum = 0 
        end
        sum += arr[i]
        if sum > greatest_sum
            greatest_sum = sum 
        end 
      i += 1
    end 

    greatest_sum
end

