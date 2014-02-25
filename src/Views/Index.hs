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
      js "https://rawgithub.com/mrdoob/three.js/master/build/three.js"
    body $ do
      section $ do
        header $ do
          img ! src "/icon.png" ! A.title "christopher rogers"
        ul $ do
          listLink "github" "https://github.com/chrissrogers"
          listLink "twitter" "https://twitter.com/sircrog"
    js "script.js"

js :: AttributeValue -> Html
js loc = H.script ! src loc $ ""

css :: AttributeValue -> Html
css loc = link ! rel "stylesheet" ! A.type_ "text/css" ! A.href loc

listLink :: Markup -> AttributeValue -> Html
listLink txt loc = li $ a ! href loc $ txt
