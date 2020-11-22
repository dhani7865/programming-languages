import Data.Char (isLetter,toLower)
import Data.List (sort)

-- This portfollio displays some word statistics
--  It also displays the total number of words in the text.
-- Displays the total number of the top 20 most commonly used English words that appear in the text according to the Oxford English Corpus (OEC) rank.
--- Also displays a histogram of the top 20 most frequent words in the text excluding common words. 


-- Creating type counter and frequency and setting it to int
type Counter = Int
type Frequency = Int

-- Creatint to word list and setting it to string
-- Dropping the empty words
toWordList :: String -> [String]
                  -- drop empty words
toWordList text = filter (\word -> word /= "") [ 
                                                 word | word <- words [
                                                                        if (c=='-') then '\0'              -- drop '-'
                                                                        else if (not(isLetter c)) then ' ' -- if not letter replace by space
                                                                        else (toLower c) | c <- text       -- if it's letter make it in lower case
                                                                      ]
                                               ]
-- Creating common word list and setting it a string                                               
commonWordsList :: [String]
-- Setting the word list
commonWordsList =  ["the","be","to","of","and","a","in","that","have","i","it","for","not","on","with","he","as","you","do","at"]

-- Creating count common word for the length of the common word list
countCommonWords :: [String] -> Frequency
 -- drop non-common words.
 -- Count the common word list
countCommonWords list = length (filter  (\word -> elem word commonWordsList) list)

-- Creating drop common words to drop the non-common words
dropCommonWords :: [String] -> [String]
dropCommonWords list = reverse ( sort (filter (\word -> not (elem word commonWordsList) ) list ) )

-- count the words
countWords :: [String] -> [(String,Frequency)]
countWords [] = []

--drop that word from the list
countWords (word:list) = (word,wordFrequency) : countWords (filter (/=word) list)
                           where
                             -- one for the current word + count of that word in the list
                            wordFrequency = 1 + length (filter (== word) list)

-- Sort the words in the list
sortWords :: [(String,Frequency)] -> [(String,Frequency)]
sortWords [] = []
-- Sort words in the list and the maximumFrequencyWords
sortWords list =  maximumFrequencyWords ++ sortWords (filter (\word -> maximumFrequency /= snd word) list)
                   where
                    maximumFrequencyWords = (zip ([fst word | word <- list , maximumFrequency == snd word]) [maximumFrequency,maximumFrequency..])
                    maximumFrequency = maximum (map snd list)

-- Creating make histogram for the lists
makeHistogram :: [(String,Frequency)] -> String
makeHistogram list = histogramWithCounter list 0 
                       where
                        histogramWithCounter :: [(String,Frequency)] -> Counter -> String
                        histogramWithCounter [] _ = ""
                        histogramWithCounter _ 20 = ""
                        histogramWithCounter ((word,frequency ):list) count = line ++ (histogramWithCounter list (count+1))
                                                                where
                                                                  line = (replicate frequency '*') ++ " -> " ++ word ++ "\n"  

-- initilising the text.
-- Setting the text
text = "It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way--in short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only.\nThere were a king with a large jaw and a queen with a plain face, on the throne of England; there were a king with a large jaw and a queen with a fair face, on the throne of France. In both countries it was clearer than crystal to the lords of the State preserves of loaves and fishes, that things in general were settled for ever." 
 
 -- Creating main to show the list of the words
main = do
    let wordlist = toWordList text
    -- Creating put string for the report and show the length of the word list
    putStrLn "Report"
    putStrLn ("\t" ++ (show $ length wordlist) ++ " words")
    putStrLn ("\t" ++ (show $ countCommonWords wordlist) ++ " common words")
    putStrLn "\nHistogram of the most frequent words (excluding common words):\n"
    putStr $ makeHistogram $ sortWords $ countWords $ dropCommonWords $ wordlist
