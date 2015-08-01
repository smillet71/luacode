require('lovedebug')
require "hexagon"

-- quelques variables globales...
xm = 0
ym = 0
click = false
hexSel = nil

-- distance entre 2 points x, y
function dist2d(x0, y0, x1, y1)
	return math.sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0))
end

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
	-- gestion mode graphique
	local modes = love.window.getFullscreenModes()
	table.sort(modes, function(a, b) return a.width*a.height < b.width*b.height end)
	for i=1,#modes do
      print("mode ",i,": ", modes[i].width, modes[i].height)
	end
	display_mode = modes[#modes]
	love.window.setMode(display_mode.width, display_mode.height, {resizable=false, fullscreen=true})
	love.resize(love.window.getWidth(), love.window.getHeight())
	love.graphics.setFont(love.graphics.newFont(9))
	-- constantes affichage
	nh = math.floor(math.floor((display_mode.height/(hrad*math.sqrt(3))-3))/2)
	-- hexmap graphics limits
	hexmap_x = display_mode.width/2-hrad*math.sqrt(3)*(nh-0.75)
	hexmap_y = display_mode.height/2-hrad*math.sqrt(3)*(nh+0.5)
	hexmap_width = hrad*math.sqrt(3)*(nh-0.75)*2
	hexmap_height = hrad*math.sqrt(3)*(nh+0.75)*2
	-- constantes gestion évènements
	goUp = false
	goDown = false
	goLeft = false
	goRight = false
end


function draw_hex(x, y, color, i, j)
	if (dist2d(x,y,xm,ym)<=hrad*math.sqrt(2/3)) then
		color = {255,0,0}
		inHex = true
	else
		inHex = false
	end
   love.graphics.push()
   love.graphics.translate(x, y)
   love.graphics.scale(1, 1)
   love.graphics.setColor(color[1], color[2], color[3] )
   love.graphics.polygon('line', hexp)
   text = ""..i..","..j
   love.graphics.printf(text, -hrad, -4, hrad*2,"center")
   --love.graphics.circle("line", 0, 0, hrad*math.sqrt(2/3), 30)
   love.graphics.pop()
   --
   return inHex
end


-- Callback function used to draw on the screen every frame.   
function love.draw()
   -- 
   --
   for i=-nh, nh do
      for j=-nh, nh do
         p = hex_coord(i, j, hrad, false)
         inHex = draw_hex(windowWidth/2+p[1],windowHeight/2+p[2], {125+i*10, 125+j*10, 255}, i, j)
		 --
		 if (click and inHex) then
			print("hexSel ", i, j)
			hexSel = {i, j}
			inHex = false
			click = false
		 end
      end
   end
	-- 
	if (hexSel ~= nil) then
         p = hex_coord(hexSel[1], hexSel[2], hrad, false)
         inHex = draw_hex(windowWidth/2+p[1],windowHeight/2+p[2], {0, 255, 0}, hexSel[1], hexSel[2])
	end
   --
   love.graphics.rectangle("line", hexmap_x,hexmap_y, hexmap_width, hexmap_height)
end

-- Callback function triggered when window receives or loses focus. Added since 0.7.0  
function love.focus(f)

end

-- Callback function triggered when window receives or loses mouse focus. Added since 0.9.0   
function love.mousefocus(f)

end

-- Callback function triggered when the mouse is moved. Added since 0.9.2   
function love.mousemoved(x, y, dx, dy)
	xm = x
	ym = y
end

-- Callback function triggered when a mouse button is pressed.   
function love.mousepressed(x, y, button)
	click = true
end

-- Callback function triggered when a mouse button is released.  
function love.mousereleased(x, y, button)

end

-- Callback function triggered when the game is closed. Added since 0.7.0   
function love.quit()

end

-- Called when the window is resized. Added since 0.9.0   
function love.resize(w, h) 
   print("resize ", w, ",",h)
   windowWidth = w
   windowHeight = h
   print("window: ", windowWidth, "  ", windowHeight)
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

