-- CaesarCipher.hs
module CaesarCipher (encryptText, decryptText) where

encryptText :: Int -> String -> String
encryptText shift = map (shiftChar shift)

decryptText :: Int -> String -> String
decryptText shift = map (shiftChar (-shift))

shiftChar :: Int -> Char -> Char
shiftChar shift c
    | 'a' <= c && c <= 'z' = shiftWithinRange 'a' c shift
    | 'A' <= c && c <= 'Z' = shiftWithinRange 'A' c shift
    | otherwise = c 

shiftWithinRange :: Char -> Char -> Int -> Char
shiftWithinRange base c shift =
    toEnum $ fromEnum base + (fromEnum c - fromEnum base + shift) `mod` 26
