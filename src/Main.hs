{-# LANGUAGE OverloadedStrings #-}

import System.Environment
import Control.Monad
import Web.Scotty
import Network.Wai
import Network.Wai.Middleware.RequestLogger
import Network.Wai.Middleware.Static
import Text.Blaze.Html.Renderer.Text
import Text.Blaze.Html hiding (text)
import qualified Views.Index as Index

main :: IO ()
main = do
  port <- liftM read $ getEnv "PORT"
  scotty port $ do
    middleware logStdoutDev
    middleware public

    get "/" $ blaze Index.render
    notFound $ text "not found"

blaze :: Html -> ActionM ()
blaze = html . renderHtml

public :: Middleware
public = staticPolicy $ noDots >-> addBase "public"
