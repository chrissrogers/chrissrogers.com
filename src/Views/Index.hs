{-# LANGUAGE OverloadedStrings #-}

module Views.Index where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

render :: Html
render = docTypeHtml $ do
  html $ do
    H.head $ do
      H.title "chrissrogers.com"
      link ! rel "stylesheet" ! A.type_ "text/css" ! href "style.css"
    body $ do
      section $ do
        header $ do
          img ! src "/icon.png" ! A.title "christopher rogers"
        ul $ do
          li $ do a ! href "https://github.com/chrissrogers" $ do "github"
          li $ do a ! href "https://twitter.com/sircrog" $ do "twitter"
