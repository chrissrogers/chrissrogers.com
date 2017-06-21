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
      H.title "Christopher Rogers"
      css "style.css"
      js "//cdnjs.cloudflare.com/ajax/libs/three.js/r66/three.min.js"
    body $ do
      section $ do
        header $ do
          img ! src "/icon.png" ! A.title "Christopher Rogers"
        ul $ do
          listLink "github" "https://github.com/chrissrogers"
          listLink "instagram" "https://instagram.com/sircrogers"
          listLink "pgp" "https://pgp.mit.edu/pks/lookup?op=vindex&search=0xE0016F76A360F4E2"
    js "script.js"

js :: AttributeValue -> Html
js loc = H.script ! src loc $ ""

css :: AttributeValue -> Html
css loc = link ! rel "stylesheet" ! A.type_ "text/css" ! A.href loc

listLink :: Markup -> AttributeValue -> Html
listLink txt loc = li $ a ! href loc $ txt
