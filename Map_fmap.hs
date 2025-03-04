

myMap :: (a -> b) -> [a] -> [b]
myMap _ []     = []                    
myMap f (x:xs) = f x : myMap f xs        

class MyFunctor f where
  myFmap :: (a -> b) -> f a -> f b

instance MyFunctor [] where
  myFmap = myMap

instance MyFunctor Maybe where
  myFmap _ Nothing  = Nothing
  myFmap f (Just x) = Just (f x)


exampleList :: [Int]
exampleList = myMap (+1) [1, 2, 3]

exampleMaybe :: Maybe String
exampleMaybe = myFmap (++ "!") (Just "Hello")

exampleListFmap :: [Int]
exampleListFmap = myFmap (*2) [1, 2, 3]  

main :: IO ()
main = do
  putStrLn $ "myMap (+1) [1,2,3] = " ++ show exampleList
  putStrLn $ "myFmap (++ \"!\") (Just \"Hello\") = " ++ show exampleMaybe
  putStrLn $ "myFmap (*2) [1,2,3] = " ++ show exampleListFmap