-- Configuration de l'application
-- modes version, copyright, localisation, vidéo, audio, clavier

M = {}

-----------------------------------------------------------------
M.copyright = "The MIT License (MIT)\nCopyright (c) 2015 smillet71"
M.version   = "version Alpha 0.1"
M.language  = "EN"
-----------------------------------------------------------------
M.local = {}
M.local.EN = require "localisation/localisation_EN"
M.local.FR = require "localisation/localisation_FR
-----------------------------------------------------------------

-----------------------------------------------------------------

return M