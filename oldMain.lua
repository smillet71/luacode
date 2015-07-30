
-- draw an Image
function drawImage(img, x, y)
	love.graphics.push()
	love.graphics.translate(x,y)
   	love.graphics.scale(0.3, 0.3)
   	local width, height = img:getDimensions()
   	love.graphics.draw(img, -width/2, -height/2)
   	love.graphics.pop()
end

--The error handler, used to display error messages.   
function love.errhand(msg)
	print(msg)
end

-- Callback function triggered when a key is pressed.   
function love.keypressed(key)
   if key == "escape" then
   	love.event.quit()
   elseif key == "up" then
   	goUp = true
   elseif key == "down" then
   	goDown = true
   elseif key == "left" then
   	goLeft = true
   elseif key == "right" then
   	goRight = true
   elseif key == "q" then
   	tirLeft = true
   elseif key == "d" then
   	tirRight = true
   end
end

--Callback function triggered when a key is released.  
function love.keyreleased (key)
   if key == "escape" then
   	love.event.quit()
   elseif key == "up" then
   	goUp = false
   elseif key == "down" then
   	goDown = false
   elseif key == "left" then
   	goLeft = false
   elseif key == "right" then
   	goRight = false
   end
end

-- This function is called exactly once at the beginning of the game.   
function love.load(arg)
   windowWidth = love.window.getWidth( )
   windowHeight = love.window.getHeight( )
	print("window: ", windowWidth, "  ", windowHeight)
	goUp = false
	goDown = false
	goLeft = false
	goRight = false
end

-- Callback function used to draw on the screen every frame.   
function love.draw()

	-- definition d'une pièce
	room = { X=10, Y=10, W=20, H=10, doors = {{"H",10,10, false}, {"H", 3, 0, true}, {"V", 0,2, true}, {"V", 20,2, false}} }
	-- facteur d'echelle
	scale = 10
	-- viewport
	vp = {X=50, Y=50, W=350, H=350}

	-- translate
	love.graphics.push()
	love.graphics.translate(vp.X,vp.Y)
   	love.graphics.scale(scale, scale)

   	-- room
   	love.graphics.setColor( 255, 255, 255, 30 )
   	love.graphics.rectangle("line", room.X, room.Y, room.W, room.H)
   	love.graphics.setLineWidth( 1 )

   	-- tracé des portes
   	for i=1,#room.doors do
   		--
   		d = room.doors[i]
   		love.graphics.setColor( 255, 255, 255, 30 )
   		-- 
   		if (d[1] == "V") then 
   			love.graphics.rectangle("fill", room.X+d[2]-0.5, room.Y+d[3], 1, 2)
   			love.graphics.print(i, room.X+d[2], room.Y+d[3])
     		if (d[4]) then
 				love.graphics.setColor( 0, 255, 0, 30 )
   				love.graphics.rectangle("fill", room.X+d[2]-0.5, room.Y+d[3], 1, 2)
   			end
  		else
  			love.graphics.rectangle("fill", room.X+d[2], room.Y+d[3]-0.5, 2, 1)
    		love.graphics.print(i, room.X+d[2], room.Y+d[3])
      		if (d[4]) then
 				love.graphics.setColor( 0, 255, 0, 30 )
   				love.graphics.rectangle("fill", room.X+d[2], room.Y+d[3]-0.5, 2, 1)
   			end
 		end
    end
   	--
	love.graphics.pop()

end

-- Callback function triggered when window receives or loses focus. Added since 0.7.0  
function love.focus(f)

end

-- Callback function triggered when window receives or loses mouse focus. Added since 0.9.0   
function love.mousefocus(f)

end

-- Callback function triggered when the mouse is moved. Added since 0.9.2   
function love.mousemoved(x, y, dx, dy)

end

-- Callback function triggered when a mouse button is pressed.   
function love.mousepressed(x, y, button)

end

-- Callback function triggered when a mouse button is released.  
function love.mousereleased(x, y, button)

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

-- Callback function used to update the state of the game every frame.   
function love.update(dt)

end

-- Callback function triggered when window is shown or hidden. Added since 0.9.0  
function love.visible(v)

end

-- The main function, containing the main loop. A sensible default is used when left out.   
-- function love.run()
-- end

