 
nx = 10
ny = 10
nc = nx*ny

nw  = math.ceil(nc*0.15)
world = {}

for i=1,nx do
	world[i] = {}
	for j=1,ny do 
		world[i][j] = 0
	end
end



math.randomseed(1)

k=0
for i=1,nx do
	world[i] = {}
	for j=1,ny do 
		r = math.random()
		if r < nw/nc then
			k=k+1
			world[i][j] = 1
			print("new world ",  i, j, k)
		end
	end
end
