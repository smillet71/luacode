-----------------------------------------------------------------------------
require "configuration"
require "utils.Menus"
-----------------------------------------------------------------------------
M = {}
M.name = "mainMenuState"
-----------------------------------------------------------------------------
local mainMenu = {}
local loc = getLocalisation()
-----------------------------------------------------------------------------
-- Enter this state
function M:enter()
	n = 5
	x = 100
	y = 100
	width = 800
	height = 350
	font = love.graphics.newFont(15)
	colorNotSel = getColors().NormalLowLightedText
	colorSel = getColors().NormalHighLightedText
	font = getFonts().xl30
	mainMenu = Menu:new(n, x, y, width, height, font, colorNotSel, colorSel)
	mainMenu:addElement(loc.mainMenu.contGame, function() print("Continue last game") end)	
	mainMenu:addElement(loc.mainMenu.newGame, function() print("Create and launch new game") end)	
	mainMenu:addElement(loc.mainMenu.loadGame, function() print("Load old game") end)
	mainMenu:addElement(loc.mainMenu.options, function() print("Configure game") end)
	mainMenu:addElement(loc.mainMenu.quit, function() love.event.quit() end)
	mainMenu.visible = true
end

-- Leave this state
function M:leave()
	print()
end

-----------------------------------------------------------------------------

--The error handler, used to display error messages.   
function M:errhand(msg)
	print(msg)
end


-----------------------------------------------------------------------------

-- Callback function triggered when window receives or loses focus. Added since 0.7.0  
function M:focus(f)

end

-- Callback function triggered when window is shown or hidden. Added since 0.9.0  
function M:visible(v)

end

-----------------------------------------------------------------------------

-- Callback function triggered when a key is pressed.   
function M:keypressed(key)
   if key == "escape" then
   	love.event.quit()
   else 
	mainMenu:keypressed(key)
   end
end

--Callback function triggered when a key is released.  
function M:keyreleased (key)
end

-----------------------------------------------------------------------------

-- Callback function triggered when window receives or loses mouse focus. Added since 0.9.0   
function M:mousefocus(f)

end

-- Callback function triggered when the mouse is moved. Added since 0.9.2   
function M:mousemoved(x, y, dx, dy)
end

-- Callback function triggered when a mouse button is pressed.   
function M:mousepressed(x, y, button)
end

-- Callback function triggered when a mouse button is released.  
function M:mousereleased(x, y, button)

end

-----------------------------------------------------------------------------

-- Callback function used to update the state of the game every frame.   
function M:update(dt)
	return nil
end

-----------------------------------------------------------------------------

-- Callback function used to draw on the screen every frame.   
function M:draw()
   color = getColors().Title
   font = getFonts().b40
   love.graphics.setFont(font)
   love.graphics.setColor(color[1], color[2], color[3], color[4])
   love.graphics.printf(self.name,50,10,100,"left")
   mainMenu:display()
end

-----------------------------------------------------------------------------
return M
