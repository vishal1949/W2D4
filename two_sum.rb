require 'byebug'
def bad_two_sum?(arr,target)
    (0...arr.size-1).each do |i| #O(n^2)
        (i+1...arr.size).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

def okay_two_sum?(arr, target)
    arr = arr.sort
    (0...arr.size-1).each do |i| #O(n^2)
        return false if arr[i] > target
        (i+1...arr.size).each do |j|
            return true if arr[i] + arr[j] == target
            #return false if arr[i] + arr[j] > target
        end
    end
    false
end

#[7,1,5,6] 8 => 1 12 - 1 13 - 1
def awesome(arr, target)
    hash = Hash.new(0)
    i = 0
    j = i + 1
    while i < arr.size
        hash[arr[i] + arr[j]] += 1 
        if j < arr.size
            j += 1
        else
            i += 1
            if j = i + 1 > arr.length
                j = i 
            else
                j = i + 1
                
            end

        end
        
    end
    return true if hash[target] >= 1
    false
end

def awesomness(arr,target)
    hash = Hash.new(0)

    arr.each do |num|
        if num <= target
        hash[num] += 1
        end
    end

    return false if hash == {}

    hash.each do |k,v|
        if k == 0 
           return true if hash.keys.any? {|key| key == target}
        end

        next if k == 0

        return true if target/k == 2 && target % k == 0

        if target/k == 1 
            return true if hash.keys.any? {|key| key == target % k}
        end
    end
    
   false
end