-- WorldFrequency.hs
module WordFrequency (wordFrequency) where

import Data.Char (toLower, isAlpha)
import Data.List (group, sort, sortBy)
import Data.Ord (comparing)

wordFrequency :: String -> [(String, Int)]
wordFrequency text = 
    let
        wordsList = words (map toLower (filter isAlphaOrSpace text))
        sortedWords = sort wordsList
        groupedWords = group sortedWords
    in
        sortBy (comparing (negate . snd)) [(head g, length g) | g <- groupedWords]

isAlphaOrSpace :: Char -> Bool
isAlphaOrSpace c = isAlpha c || c == ' '
