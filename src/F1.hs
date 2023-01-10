module F1 where

import Data.Char (isAlpha)

-- fibonacci start
{- fib :: Integer -> Integer
fib n -- Defintionen av fibonacci som ges i kattis: (Väldigt långsam...)
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fib (n -1) + fib (n -2) -}

-- This is flippin' fast! :) But the fibcounter is not optimal... :(
fib :: Integer -> Integer
fib n = last $ fibCounter [0, 1] 0 n

fibCounter :: [Integer] -> Integer -> Integer -> [Integer]
fibCounter list count limit
  | count < limit -1 = fibCounter (list ++ [list !! (length list -1) + list !! (length list -2)]) (count + 1) limit
  | limit == 0 = [0]
  | otherwise = list

-- fibonacci end

-- vowels definition to be used in rovarsprak and karpsravor:
vowels :: [Char]
vowels = "aoueiy"

-- rovarsprak start
rovarsprak :: [Char] -> [Char]
rovarsprak [] = []
rovarsprak (c : cs)
  | c `elem` vowels = c : rovarsprak cs
  | otherwise = c : 'o' : c : rovarsprak cs

-- rovarsprak end

-- karpsravor start
karpsravor :: [Char] -> [Char]
karpsravor [] = []
karpsravor (a : b : c : s)
  | a == c && [b] == "o" && a `notElem` vowels = a : karpsravor s
  | otherwise = a : karpsravor ([b] ++ [c] ++ s)
karpsravor catch = catch -- Catching exception if string is to short. Then sends back string

-- karpsravor end

-- medellangd start
replaceEverythingNotAlpha :: [Char] -> [Char]
replaceEverythingNotAlpha = map (\c -> if isAlpha c then c else ' ') -- \c means that we're creating an anonymous function with the argument c. c will be sent to the function by the map function that will send every character of our passed string.

totalLengthOfWords :: Num a => [Char] -> a
totalLengthOfWords phrase = sum $ map (\c -> if isAlpha c then 1 else 0) phrase -- Counts number of characters by replacing them with 1 and then sum all the 1 togheter.

medellangd :: Fractional a => [Char] -> a
medellangd string = totalLengthOfWords string / totalWords string
  where
    totalWords = fromIntegral . length . words . replaceEverythingNotAlpha -- replaceEverythingNotAlpha removes all characters that's not Alphabetic, then words splits the string into one element per adjacent characters. Finally length counts the number of words and fromIntegral converts the Int into any Numeric value. The (.) tells haskell that the chain of functions should be read from right to left (instead of using parentheses)

-- medellangd end

-- skyffla start
skyffla :: [a] -> [a]
skyffla [] = []
skyffla list = evenElems ++ skyffla oddElems
  where
    tuples = zip [x | x <- [0 .. length list -1]] list
    evenElems = map snd $ filter (even . fst) tuples
    oddElems = map snd $ filter (odd . fst) tuples

-- skyffla end

{- test [] = []
test list = evenElems ++ skyffla oddElems
  where
    tuples = zip [x | x <- [0 .. length list -1]] list
    evenElems = map snd $ filter (even . fst) tuples
    oddElems = [x | x <- list, x `notElem` evenElems]
 -}