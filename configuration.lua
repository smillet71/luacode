-- Configuration de l'application
-- Modes version, copyright, localisation, vidéo, audio, clavier

local MM = {}

-----------------------------------------------------------------
MM.copyright = "The MIT License (MIT)\nCopyright (c) 2015 smillet71"
MM.version   = "version Alpha 0.1"
MM.language  = "EN"
-----------------------------------------------------------------
local FR = require "localisation/localisation_FR"
local EN = require "localisation/localisation_EN"
MM.localisation = {}
MM.localisation.FR = FR
MM.localisation.EN = EN
-----------------------------------------------------------------
MM.fonts = {}
MM.fonts.xl20 = love.graphics.newFont( "resources/fonts/Typewriter-Xlight.otf", 20 )
MM.fonts.l20 = love.graphics.newFont( "resources/fonts/Typewriter-Light.otf", 20 )
MM.fonts.b20 = love.graphics.newFont( "resources/fonts/Typewriter-Bold.otf", 20 )
-----------------------------------------------------------------

-----------------------------------------------------------------
function getFonts() 
	return MM.fonts
end

-----------------------------------------------------------------
function getLocalisation()
	return MM[MM.language]
end
