-- create a 3D track
function create3DTrack(dat, id, sources, typ, pos, route, speed, err)
	track = {}
	track.creation_date = dat
	track.last_update_date = dat
	track.count = 1
	track.sources = sources
	track.type = typ
	track.3d = true
	track.id = id
	track.pos = pos
	track.route = route
	track.speed = speed
	track.error = err
	return track
end

-- create a 2D track
function create2DTrack(dat, id, sources, typ, azm, dist, derr )
	track = {}
	track.creation_date = dat
	track.last_update_date = dat
	track.count = 1
	track.sources = sources
	track.type = typ
	track.3d = false
	track.id = id
	track.azm = azm
	track.dist = dist
	track.dist_err = derr
	return track
end

-- update 3D track
function update3DTrack(track, dat, sources, typ, pos, route, speed, err)
	track.last_update_date = dat
	track.3d = true
	track.count = track.count + 1
	track.sources = sources
	track.type = typ
	track.pos = pos
	track.route = route
	track.speed = speed
	track.error = err
	return track
end

-- update 2D track
function update2DTrack(track, dat, sources, typ, azm, dist, derr )
	track.last_update_date = dat
	track.count = track.count+1
	track.sources = sources
	track.type = typ
	track.3d = false
	track.azm = azm
	track.dist = dist
	track.dist_err = derr
	return track
end