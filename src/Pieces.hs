module Pieces where


type PShape = [String]
data Piece = Piece { pCost :: Int
                   , pTime :: Int
                   , pReward :: Int
                   , pShape :: PShape }
  deriving (Show)

pCoverage :: Piece -> Int
pCoverage = sum . map (length . filter (== 'X')) . pShape

rotateR, rotateL :: PShape -> PShape
rotateR s = s
rotateL s = s

pWidth, pHeight :: Piece -> Int
pWidth p = length $ head $ pShape p
pHeight p = length $ pShape p

p c t r s | let row1:rows = map length s
            in length s > 0 &&
               all (== row1) rows &&
               all (`elem` " X") (concat s) = Piece c t r (toShape s)
          | otherwise = error "Piece shape not OK"
  where toShape s = s

data TrackElem = TrackCell Int | Salary | BonusPiece
  deriving (Show)

track = [t 4, Salary, t 6, Salary, t 6, Salary, t 3, BonusPiece, t 3, Salary, t 3, BonusPiece
        ,t 3, Salary, t 3, BonusPiece,  t 3, Salary, t 6, Salary, t 3, BonusPiece, t 3, Salary
        ,t 3, BonusPiece, t 3, Salary]
  where t = TrackCell

pieces = [
  p 5 4 2
    [" X "
    ,"XXX"
    ," X "]
  ,p 2 3 0
    ["X X"
    ,"XXX"
    ,"X X"]
  ,p 7 1 1
    ["XXXXX"]
  ,p 3 2 1
    [" XX"
    ,"XX "]
  ,p 1 5 1
    ["X  X"
    ,"XXXX"]
  ,p 3 1 0
    [" X"
    ,"XX"]
  ,p 3 3 1
    ["XXXX"]
  ,p 1 2 0
    ["X X"
    ,"XXX"]
  ,p 3 4 1
    [" X  "
    ,"XXXX"]
  ,p 2 1 0
    [" X  "
    ,"XXXX"
    ,"  X "]
  ,p 4 2 0
    [" XXX"
    ,"XXX "]
  ,p 2 1 0
    ["XX"]
  ,p 5 5 2
    [" X "
    ," X "
    ,"XXX"]
  ,p 2 2 0
    ["XXX"]
  ,p 0 3 1
    [" X  "
    ,"XXXX"
    ," X  "]
  ,p 10 3 2
    ["X   "
    ,"XXXX"]
  ,p 6 5 2
    ["XX"
    ,"XX"]
  ,p 1 2 0
    ["   X"
    ,"XXXX"
    ,"X   "]
  ,p 2 2 0
    ["X "
    ,"XX"
    ,"XX"]
  ,p 2 3 1
    [" XXX"
    ,"XX  "]
  ,p 1 4 1
    ["  X  "
    ,"XXXXX"
    ,"  X  "]
  ,p 7 6 3
    [" XX"
    ,"XX "]
  ,p 10 4 3
    ["  X"
    ," XX"
    ,"XX "]
  ,p 3 6 2
    [" XX"
    ,"XX "
    ," XX"]
  ,p 5 3 1
    [" XX "
    ,"XXXX"
    ," XX "]
  ,p 7 4 2
    [" XX "
    ,"XXXX"]
  ,p 10 5 3
    [" X"
    ," X"
    ,"XX"
    ,"XX"]
  ,p 8 6 3
    ["XX "
    ,"XX "
    ," XX"]
  ,p 7 2 2
    [" X "
    ," X "
    ," X "
    ,"XXX"]
  ,p 2 2 0
    [" X "
    ,"XXX"]
  ,p 4 2 1
    ["  X"
    ,"XXX"]
  ,p 1 3 0
    [" X"
    ,"XX"]
  ,p 4 6 2
    [" X"
    ," X"
    ,"XX"]
  ]
