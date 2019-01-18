def first_anagram?(str1, str2)
    result = [str1[0]]
    i = 1
    while i < str1.size
        temp = []
        result.each do |word|   
            (0...word.size).each do |j|
                temp << word[0...j] + str1[i] + word[j..-1]
                temp << word + str1[i]
            end
        end
        result = temp 
        i += 1
    end
    result.include?(str2)
end 

def second_anagram?(str1,str2)
    str1.chars.each_with_index do |char,i| # n
        if str2.include?(char) # n
           idx = str2.chars.find_index(char)
           str2 = str2.chars
           str2.delete_at(idx)
           str2 = str2.join
        end 
    end
    str2.empty?
end

def third_anagram?(str1,str2)
    str1 = str1.chars.sort 
    str2 = str2.chars.sort 
    return true if str1 == str2 
    false 
end

def fourth_anagram?(str1,str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    
    str2.chars.each do |char|
        hash1[char] += 1
    end

    str1.chars.each do |char|
        hash1[char] += 1
    end
    
    return false if hash1.keys.sort != hash2.keys.sort
    hash1.each do |k,v|
        return false if hash2[k] != hash1[k]
    end
    
    true 
end