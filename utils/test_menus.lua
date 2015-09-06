require "Menus"

mainMenu1 = Menu:new(10, 1, 1, 100, 100, nil, {1,1,1,1})
mainMenu1:addElement("[H]ello", "H", function() end)
print(mainMenu1.nbItems, mainMenu1.items[1].name)
mainMenu2 = Menu:new(10, 1, 1, 100, 100, nil, {1,1,1,1})
print(mainMenu2.nbItems)

