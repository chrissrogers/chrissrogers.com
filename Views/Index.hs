{-# LANGUAGE OverloadedStrings #-}

module Views.Index where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

render = docTypeHtml $ do
  html $ do
    H.head $ do
      H.title "chrissrogers.com"
    body $ do
      img ! src "/header.png" ! A.title "christopher rogers"
      h1 "christopher rogers"
