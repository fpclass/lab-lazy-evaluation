--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Lazy evaluation                                                       --
--------------------------------------------------------------------------------

module Lab where

--------------------------------------------------------------------------------
-- Infinite data structures

-- | The infinite list of ones.
ones :: [Int]
ones = 1 : ones

ones' :: [Int]
ones' = enumFromThen 1 1

fibs :: [Integer]
fibs = 1 : xs
    where xs = 1 : ys
          ys = zipWith (+) fibs xs

-- | An infinite list modelled after the Fibonacci numbers, but where the
-- seed values are x and y. (Exponential time complexity!)
foos :: Integer -> Integer -> [Integer]
foos x y = x : y : zipWith (+) (foos x y) (tail (foos x y))

-- | An infinite list modelled after the Fibonacci numbers, but where the
-- seed values are x and y. (Linear time complexity if you do it right!)
foos' :: Integer -> Integer -> [Integer]
foos' x y = bar
    where bar = x : y : zipWith (+) bar (tail bar)

-- void* foos'(int* x, int* y) {
--      void* bar = malloc(..);
--      bar[0] = x;
--      bar[1] = y;
--      bar[..] 
--      return bar;
-- }

--------------------------------------------------------------------------------
