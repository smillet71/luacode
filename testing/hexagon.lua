
-- compute position of an hexagon corner
function hex_corner(center, size, i, horizontal_grid)
    local angle_deg = 60 * i 
    if horizontal_grid then angle_deg = angle_deg+90.0 end
    local angle_rad = math.pi / 180 * angle_deg
    return {x = center.x + size * math.cos(angle_rad),
            y = center.y + size * math.sin(angle_rad) }
end

-- compute the different point of an hexagon
function hex_path(size, horizontal_grid)
   h = {}
    for i=0,6 do
      p = hex_corner({x=0, y=0}, size, i, horizontal_grid)
      h[i*2+1] = p.x
      h[i*2+2] = p.y
    end
   return h
end

-- odd number ?
function odd(number)
   return number % 2 == 1
end

-- even number
function even(number)
   return number % 2 == 0
end

-- position of an hexagon for drawing
function hex_coord(u, v, rad, horizontal_grid)
   dx = 0
   if (odd(v)) then
      dx = rad*math.sqrt(3)/2
   end
   x = dx+u*rad*math.sqrt(3)
   y = v*rad*2*3/4.0
   if horizontal_grid then
      return {x, y}
   else
      return {y, x}
   end
end

-- some globals
hrad = 25
hexp = hex_path(hrad, false)
