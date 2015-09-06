require('externals/lovedebug')
require("configuration")

-- different application states
local launchingState = require "launchingState"
local mainMenuState = require "mainMenuState"
local loadingGameState = require "loadingGameState"
local runningGameState = require "runningGameState"
local gamePausedState = require "gamePausedState"

-- current application state
local currentState = nil

--The error handler, used to display error messages.   
function love.errhand(msg)
	print(msg)
end

-- Callback function triggered when a key is pressed.   
function love.keypressed(key)
	currentState:keypressed(key)
end

--Callback function triggered when a key is released.  
function love.keyreleased (key)
	currentState:keyreleased(key)
end

-- This function is called exactly once at the beginning of the game.   
function love.load(arg)
	-- gestion mode graphique
	local modes = love.window.getFullscreenModes()
	table.sort(modes, function(a, b) return a.width*a.height < b.width*b.height end)
	for i=1,#modes do
      print("mode ",i,": ", modes[i].width, modes[i].height)
	end
	display_mode = modes[#modes]
	love.window.setMode(display_mode.width, display_mode.height, {resizable=false, fullscreen=true})
	love.resize(love.window.getWidth(), love.window.getHeight())
	love.graphics.setFont(love.graphics.newFont(11))
	-- 
	launchingState:enter()
	currentState = launchingState
end


-- Callback function used to draw on the screen every frame.   
function love.draw()
	currentState:draw()
end

-- Callback function triggered when window receives or loses focus. Added since 0.7.0  
function love.focus(f)
	currentState:focus(f)
end

-- Callback function triggered when window receives or loses mouse focus. Added since 0.9.0   
function love.mousefocus(f)
	currentState:mousefocus(f)
end

-- Callback function triggered when the mouse is moved. Added since 0.9.2   
function love.mousemoved(x, y, dx, dy)
	currentState:mousemoved(x, y, dx, dy)
end

-- Callback function triggered when a mouse button is pressed.   
function love.mousepressed(x, y, button)
	currentState:mousepressed(x, y, button)
end

-- Callback function triggered when a mouse button is released.  
function love.mousereleased(x, y, button)
	currentState:mousereleased(x, y, button)
end

-- Callback function triggered when the game is closed. Added since 0.7.0   
function love.quit()

end

-- Called when the window is resized. Added since 0.9.0   
function love.resize(w, h) 
end

-- Called when text has been entered by the user. Added since 0.9.0   	
function love.textinput(text)
	print(text)
end

-- Callback function triggered when a Thread encounters an error. Added since 0.9.0   
function love.threaderror(thread, errorstr)
	print(thread, errorstr)
end

-- 
function change2state(newState)
	newState:enter()
	oldState = currentState
	currentState = newState
	oldState:leave()
end

-- Callback function used to update the state of the game every frame.   
function love.update(dt)
	--
	local newStateName = currentState:update(dt)
	--
	if (newStateName == "mainMenuState") then
		change2state(mainMenuState)		
	elseif (newStateName == "loadingGameState") then
		change2state(loadingGameState)		
	elseif (newStateName == "runningGameState") then
		change2state(runningGameState)		
	elseif (newStateName == "gamePausedState") then
		change2state(gamePausedState)		
	end
end

-- Callback function triggered when window is shown or hidden. Added since 0.9.0  
function love.visible(v)

end

