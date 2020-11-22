##  The user would be able to initialise “text” when an object type “LetterHistogram” has been created. If initial value is not supplied by the user, then it should be assigned “Hello, World!” as the default value. 


# Creating class for the letterHistogram portfollio
class LetterHistogram
    # Declaring attribute accessor for the text
    # Accessors are methods which are designed to read and write instance variables (attributes) 
    # Creating setter and getter shortcut into one line using the attribute accessor 
    attr_accessor :text
    
    # Definning method to initialize the text "Helo, World"
    # Setting the “text” value
    def initialize(text_ = "Hello, World!")
        self.text = text_
    end
    
    # This method would display for each letter from A - Z (including letters not in text) a row of asterisks representing how many times the character appeared.
    def display
        frequencies = calculateFrequencies
        frequencies.each do |letter, frequency|
            puts "#{letter}:#{'*'*frequency}"
        end
    end
    
    # Creating a private method called calculateFrequencies which computes the frequency of each letter appearing in text and returns the output as a Hash. 
    # This method would also count lower and uppercase letters as the same letter. Punctuation characters have been ignored. 
    private
    def calculateFrequencies
        text_ = text.upcase
        frequencies = ("A".."Z").to_a.map do |letter|
            [letter, text_.count(letter)]
        end.to_h
    end
end




## Test methods:
## Test 1:
# irb
#  load 'LetterHistogram.rb' 
# => true - sentence = "Far out in the uncharted backwaters of the unfashionable end of the Western Spiral arm of the Galaxy lies a small unregarded yellow sun."
# => "Far out in the uncharted backwaters of the unfashionable end of the Western Spiral arm of the Galaxy lies a small unregarded yellow sun."
# h = LetterHistogram.new sentence
# => #<LetterHistogram:0x00000000030e23a8 @text="Far out in the uncharted backwaters of the unfashionable end of the Western Spiral arm of the Galaxy lies a small unregarded yellow sun."
# h.display
# A:*************
# B:**
# C:**
# D:****
# E:**************
# F:*****
# G:**
# H:******
# I:****
# J:
# K:*
# L:********
# M:**
# N:********
# O:******
# P:*
# Q:
# R:********
# S:*******
# T:********
# U:*****
# V:
# W:***
# X:*
# Y:**
# Z:
# => {"A"=>13, "B"=>2, "C"=>2, "D"=>4, "E"=>14, "F"=>5, "G"=>2, "H"=>6, "I"=>4, "J"=>0, "K"=>1, "L"=>8, "M"=>2, "N"=>8, # "O"=>6, "P"=>1, "Q"=>0, "R"=>8, "S"=>7, "T"=>8, "U"=>5, "V"=>0, "W"=>3, "X"=>1, "Y"=>2, "Z"=>0}

