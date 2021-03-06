> module Slides.Expansion05 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Pruning06       (prune)
> import Slides.Expansion02     (expand1)
> import Slides.Expansion03
> import Slides.Examples

                         Single-Cell Expansion, Cont...


And now we can replace `solve` by a third version:

> solve :: Grid -> [ Grid ]
> solve = search . choices

> search :: [Row Choices] -> [ Grid ]
> search m | not (safe m) = []
>          | complete m'  = [ map (map head) m' ]
>          | otherwise    = concat (map search (expand1 m'))
>   where
>   m' = prune m

This is our final simple Sudoku solver.

> main :: IO ()
> main = do putStrLn "Easy Puzzles"
>           print_solutions (map solve example_puzzles)
>           putStrLn ""
>           putStrLn "Hard Puzzles"
>           print_solutions (map solve example_puzzles_hard)
