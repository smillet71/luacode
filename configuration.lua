-----------------------------------------------------------------
-- Configuration de l'application
-- Modes version, copyright, localisation, vidéo, audio, clavier
-----------------------------------------------------------------
local FR = require "localisation/localisation_FR"
local EN = require "localisation/localisation_EN"

-----------------------------------------------------------------
-----------------------------------------------------------------
local M = {}
-----------------------------------------------------------------
M.copyright = "The MIT License (MIT)\nCopyright (c) 2015 smillet71"
M.version   = "version Alpha 0.1"
M.language  = "EN"
-----------------------------------------------------------------
M.localisation = {}
M.localisation.FR = FR
M.localisation.EN = EN
-----------------------------------------------------------------
M.fonts = {}
M.fonts.xl20 = love.graphics.newFont( "resources/fonts/Typewriter-Xlight.otf", 20 )
M.fonts.xl30 = love.graphics.newFont( "resources/fonts/Typewriter-Xlight.otf", 30 )
M.fonts.xl40 = love.graphics.newFont( "resources/fonts/Typewriter-Xlight.otf", 40 )
M.fonts.l20 = love.graphics.newFont( "resources/fonts/Typewriter-Light.otf", 20 )
M.fonts.b20 = love.graphics.newFont( "resources/fonts/Typewriter-Bold.otf", 20 )
M.fonts.b40 = love.graphics.newFont( "resources/fonts/Typewriter-Bold.otf", 40 )
-----------------------------------------------------------------
M.colors = {}
M.colors.Title = {61, 245, 255, 255}
M.colors.NormalText = {0,255,0,200}
M.colors.NormalHighLightedText = {0,255,0,255}
M.colors.NormalLowLightedText = {0,255,0,100}
-----------------------------------------------------------------
-----------------------------------------------------------------
function getColors() 
	return M.colors
end

-----------------------------------------------------------------
function getFonts() 
	return M.fonts
end

-----------------------------------------------------------------
function getLocalisation()
	return M[M.language]
end
