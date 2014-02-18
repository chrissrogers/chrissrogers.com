{-# LANGUAGE OverloadedStrings #-}

import System.Environment
import Control.Monad
import Web.Scotty
import Network.Wai.Middleware.RequestLogger
import Network.Wai.Middleware.Static
import Text.Blaze.Html.Renderer.Text
import qualified Views.Index as Index

main = do
  port <- liftM read $ getEnv "PORT"
  scotty port $ do
    middleware logStdoutDev
    middleware $ staticPolicy (noDots >-> addBase "public")

    get "/" $ do
      blaze Index.render

    notFound $ do
      text "not found"

blaze = html . renderHtml
