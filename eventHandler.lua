-- gestionnaires d'évènements
handlers = {}

-- add a handler mode
function addHandlerMode(mode)
	handlers[mode] = {}
	handlers[mode].keyboard = {}
	handlers.mouse = {}
end

-- add a key event to an handler
function addKeyEventForArea(mode, name, prio, key, area, func)
	--
	keyEvent = {}
	keyEvent.name = name
	keyEvent.prio = prio
	keyEvent.key  = key
	keyEvent.area = area
	keyEvent.func = func
	--
	if (handlers[mode].keyboard[prio] == nil) then
		handlers[mode].keyboard[prio] = { keyEvent }
	else 
		table.insert(handlers[mode].keyboard[prio], keyEvent)
	end
end

-- manage keyboard events for mode
function manageKeyboardEvent(mode, key)


end