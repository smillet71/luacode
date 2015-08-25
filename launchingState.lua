M = {}
M.name = "launchingState"
-----------------------------------------------------------------------------
-- Enter this state
function M:enter()
	print()
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
local T=0
-- Callback function used to update the state of the game every frame.   
function M:update(dt)
	T = T+dt
	if (T>10) then
		return "mainMenuState"
	else
		return nil
	end
end

-----------------------------------------------------------------------------

-- Callback function used to draw on the screen every frame.   
function M:draw()
   love.graphics.setColor(255,0,0)
   love.graphics.printf(self.name,50,10,100,"center")
end

-----------------------------------------------------------------------------
return M