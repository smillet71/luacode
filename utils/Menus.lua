# creation of menus

Menu = {}

function Menu:new(n, x, y, width, height, font, color)
	o = {}
    setmetatable(o, self)
    self.__index = self
	self.nbMax = n
	self.nbItems = 0
	self.items = {}
	self.conf = {}
	self.conf.font = font
	self.conf.color = color
	self.conf.fHeight = 8 --font.getHeight()
	self.conf.x = x
	self.conf.y = y
	self.conf.width = width/2
	self.conf.height = height
	self.conf.dX = width/n
	self.conf.dY = height/n
	if (self.conf.dY<=self.conf.fHeight) then
		error("Menu: not enough place in area for configured number of items")
	end
	return o
end

function Menu:addElement(name, key, func)
	if (self.nbItems>=self.nbMax) then
		error("Menu: max number of items reached")
	end
	self.nbItems = self.nbItems+1
	item = {}
	item.name = name
	item.key  = key
	item.func = func
	item.active = true
	item.selected = false
	item.x = self.conf.dY/2+(self.conf.dY*(self.nbItems))
	item.y = self.conf.dX
	self.items[self.nbItems] = item
end

function Menu:display()
	love.graphics.push()
	love.graphics.translate(self.conf.x,self.conf.y)
	love.graphics.setFont(self.conf.font)
   	for i=1,self.nbItems do
		item = self.items[i]
		love.graphics.printf( item.name, item.x, item.y, self.conf.width, "center")
	end
   	love.graphics.pop()

end

function Menu:keypressed(key)

end

function Menu:mousereleased(x, y, button)

end

