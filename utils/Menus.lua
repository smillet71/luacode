# creation of menus

Menu = {}

-- Create a Menu
function Menu:new(n, x, y, width, height, font, colorNotSel, colorSel)
    o = {}
    setmetatable(o, self)
    self.__index = self
	self.nbMax = n
	self.nbItems = 0
	self.items = {}
	self.keys = {}
	self.conf = {}
	self.conf.font = font
	self.conf.colorSel = colorSel
	self.conf.colorNotSel = colorNotSel
	self.conf.fHeight = font:getHeight()
	self.conf.x = x
	self.conf.y = y
	self.conf.width = width/2
	self.conf.height = height
	self.conf.dX = 0
	self.conf.dY = height/n
	self.selected = 1
	self.visible = false
	if (self.conf.dY<=self.conf.fHeight) then
		error("Menu: not enough place in area for configured number of items")
	end
	return o
end

-- add a Menu Item
function Menu:addElement(name, key, func)
	if (self.nbItems>=self.nbMax) then
		error("Menu: max number of items reached")
	end
	self.nbItems = self.nbItems+1
	item = {}
	item.name = name
	self.keys[string.lower(key)]  = self.nbItems 
	item.func = func
	item.selected = false
	item.x = self.conf.dX+20
	item.y = self.conf.dY/3+(self.conf.dY*(self.nbItems-1))
	self.items[self.nbItems] = item
end

-- display the Menu
function Menu:display()
	if (not self.visible) then 
		return
	end
	love.graphics.push()
	love.graphics.translate(self.conf.x,self.conf.y)
	love.graphics.setFont(self.conf.font)
	love.graphics.rectangle("line",-5, 5,self.conf.width+10, self.conf.height+10) 
   	for i=1,self.nbItems do
		if (i ==  self.selected) then
			love.graphics.setColor(	self.conf.colorSel[1], self.conf.colorSel[2],
						self.conf.colorSel[3], self.conf.colorSel[4])
		else
			love.graphics.setColor(	self.conf.colorNotSel[1], self.conf.colorNotSel[2],
						self.conf.colorNotSel[3], self.conf.colorNotSel[4])
		end
		item = self.items[i]
		love.graphics.printf( item.name, item.x, item.y, self.conf.width, "left")
	end
   	love.graphics.pop()

end

-- Menu Behaviour -- keyboard interaction
function Menu:keypressed(key)
	--
	if (not self.visible) then 
		return
	end
	-- 
	i = self.selected
	key = string.lower(key)
	-- up/down
	if (key == "up") then
		i = i-1
		if (i<1) then 
			i = self.nbItems
		end
	elseif (key == "down") then
		i = i+1
		if (i > self.nbItems) then
			i = 1
		end
	-- return
	elseif (key == "return") then
		self.items[i].func()
	-- key
	elseif (self.keys[key]) then
		print(j)
		j = self.keys[key]

		i = j
		self.items[i].func()
	end
	self.selected = i

end

