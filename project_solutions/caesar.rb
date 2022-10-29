def caesar_cipher(string, shift)
    result = ""
    string.each_byte do |byte|
        # handle lower case
        if(byte.between?(97, 122))
            byte = (byte - 97 + shift)%26 + 97
        elsif(byte.between?(65, 90))
            byte = (byte - 65 + shift)%26 + 65
        end
        result += byte.chr
    end
    result
end