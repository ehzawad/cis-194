-- CIS 194, Spring 2015
--
-- Test cases for HW 02

module HW02Tests where

import HW02
import Testing
import Data.List (sort)

-- Exercise 1 -----------------------------------------

ex1Tests :: [Test]
ex1Tests = [ testF2 "exactMatches test" exactMatches
             [ ([], [], 0)
             , ([Red], [Blue], 0)
             , ([Red, Green], [Blue, Green], 1)
             , ([Red, Blue, Green, Yellow], [Blue, Green, Yellow, Red], 0)
             , ([Red, Blue, Green, Yellow], [Red, Purple, Green, Orange], 2)
             ]
           ]

-- Exercise 2 -----------------------------------------

ex2Tests :: [Test]
ex2Tests = [ testF1 "countColors test" countColors
             [ ([Red, Blue, Yellow, Purple], [1, 0, 1, 1, 0, 1])
             , ([Green, Blue, Green, Orange], [0, 2, 1, 0, 1, 0])
             ]
           , testF2 "matches test" matches
             [ ([Red, Blue, Yellow, Orange], [Red, Orange, Orange, Blue], 3)
             , ([], [], 0)
             , ([Red, Blue, Yellow, Orange], [], 0)
             , ([Red], [Green], 0)
             , ([Red], [Red], 1)
             , ([Red, Blue], [Green, Green], 0)
             , ([Red, Blue], [Blue, Green], 1)
             , ([Red, Red], [Red, Blue], 1)
             , ([Red, Red], [Red, Red], 2)
             , ([Red, Red, Red], [Red, Red], 2)
             , ([Red, Green, Blue], [Green, Blue, Red], 3)
             ]
           ]

-- Exercise 3 -----------------------------------------

ex3Tests :: [Test]
ex3Tests = [ testF2 "getMove test" getMove
             [ ( [], [], Move [] 0 0 )
             , ( [Red], [Blue], Move [Blue] 0 0 )
             , ( [Red, Blue], [Blue, Red], Move [Blue, Red] 0 2 )
             , ( [Red, Blue], [Blue], Move [Blue] 0 1 )
             , ( [Red, Blue], [Red], Move [Red] 1 0 )
             , ( [Red, Blue, Red, Blue]
               , [Blue, Red, Blue, Red]
               , Move [Blue, Red, Blue, Red] 0 4
               )
             , ( [Red, Blue, Yellow, Orange]
               , [Red, Orange, Orange, Blue]
               , Move [Red, Orange, Orange, Blue] 1 2
               )
             , ( [Blue, Green, Orange, Red]
               , [Blue, Red, Green, Orange]
               , Move [Blue, Red, Green, Orange] 1 3
               )
             ]
           ]

-- Exercise 4 -----------------------------------------

ex4Tests :: [Test]
ex4Tests = [ testF2 "isConsistent test" isConsistent
             [ (Move [Red, Red, Blue, Green] 1 1, [Red, Blue, Yellow, Purple],
               True)
             , (Move [Red, Red, Blue, Green] 1 1, [Red, Blue, Red, Purple],
               False)
             ]
           ]

-- Exercise 5 -----------------------------------------

ex5Tests :: [Test]
ex5Tests = [ testF2 "filterCodes test" filterCodes
             [ ( Move [Red, Red, Blue, Green] 1 1
               , [[Red, Blue, Red, Purple], [Red, Blue, Yellow, Purple]]
               , [[Red, Blue, Yellow, Purple]])
             ]
           ]

-- Exercise 6 -----------------------------------------

ex6Tests :: [Test]
ex6Tests = [ testF1 "allCodes test" allCodes
             [ (0, [])
             , (1, [[Red],[Green],[Blue],[Yellow],[Orange],[Purple]])
             , (2, [[Red,   Red],[Red,   Green],[Red,   Blue],[Red,   Yellow],[Red,   Orange],[Red,   Purple]
                   ,[Green, Red],[Green, Green],[Green, Blue],[Green, Yellow],[Green, Orange],[Green, Purple]
                   ,[Blue,  Red],[Blue,  Green],[Blue,  Blue],[Blue,  Yellow],[Blue,  Orange],[Blue,  Purple]
                   ,[Yellow,Red],[Yellow,Green],[Yellow,Blue],[Yellow,Yellow],[Yellow,Orange],[Yellow,Purple]
                   ,[Orange,Red],[Orange,Green],[Orange,Blue],[Orange,Yellow],[Orange,Orange],[Orange,Purple]
                   ,[Purple,Red],[Purple,Green],[Purple,Blue],[Purple,Yellow],[Purple,Orange],[Purple,Purple]
                   ]
               )
             , (3, sort . concatMap (\c -> map (++[c]) (allCodes 2)) $ colors)
             ]
           , testF1 "length . allCodes test" (length . allCodes)
             [(0,0),(1,6),(2,36),(3,216),(4,1296),(5,7776),(6,46656),(7,279936)]
           ]

-- Exercise 7 -----------------------------------------

ex7Tests :: [Test]
ex7Tests =  [ testF1 "solve test" solve
              [ ([], [])
              , ([Red], [Move [Red] 1 0])
              , ([Yellow], [Move [Red] 0 0,Move [Green] 0 0,Move [Blue] 0 0,Move [Yellow] 1 0])
              , ([Red, Blue], [Move [Red,Red] 1 0,Move [Red,Green] 1 0,Move [Red,Blue] 2 0])
              , ([Green, Green], [Move [Red,Red] 0 0,Move [Green,Green] 2 0])
              , ([Red, Green, Blue], [Move [Red,Red,Red] 1 0,Move [Red,Green,Green] 2 0,Move [Red,Green,Blue] 3 0])
              ]
            ]

-- Bonus ----------------------------------------------

bonusTests :: [Test]
bonusTests = []

-- All Tests ------------------------------------------

allTests :: [Test]
allTests = concat [ ex1Tests
                  , ex2Tests
                  , ex3Tests
                  , ex4Tests
                  , ex5Tests
                  , ex6Tests
                  , ex7Tests
                  --, bonusTests
                  ]
