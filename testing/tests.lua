function hex_corner(center, size, i)
    local angle_deg = 60 * i   + 90
    local angle_rad = math.pi / 180 * angle_deg
    return {x = center.x + size * math.cos(angle_rad),
            y = center.y + size * math.sin(angle_rad) }
end

function hex_path(size)
   h = {}
    for i=0,6 do
      p = hex_corner({x=0, y=0}, size, i)
      h[i*2+1] = p.x
      h[i*2+2] = p.y
    end
   return h
end

h = hex_path(20)
for i=0,12 do
	--print(h[i])
end

print(#h)

function odd(number)
	return number % 2 == 1
end

function even(number)
	return number % 2 == 0
end

assert (odd(1))
assert (odd(3))
assert(not odd(2))
assert(not even(1))
assert(even(2))
assert(even(16))

function hex_coord(u, v, rad)
	dx = 0
	if (odd(v)) then
		dx = rad
	end
	x = dx+u*rad*2
	y = v*rad*2
	return {x, y}
end


