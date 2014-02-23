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
      css "style.css"
      js "https://cdnjs.cloudflare.com/ajax/libs/three.js/r61/three.min.js"
      js "script.js"
    body $ do
      section $ do
        header $ do
          img ! src "/icon.png" ! A.title "christopher rogers"
        ul $ do
          listLink "https://github.com/chrissrogers" "github"
          listLink "https://twitter.com/sircrog" "twitter"

js :: AttributeValue -> Html
js loc = H.script ! src loc $ ""

css :: AttributeValue -> Html
css loc = link ! rel "stylesheet" ! A.type_ "text/css" ! A.href loc

listLink :: AttributeValue -> Markup -> Html
listLink loc txt = li $ a ! href loc $ txt
