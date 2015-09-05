
-- create Radar Sensor
function createRadarSensor(platform, wl, domain, range, pra, search)
	radar = {}
	radar.platform = platform
	radar.activated = false
	radar.wl = wl
	radar.domain = domain
	radar.range = range
	radar.pra = pra
	radar.search = search
	radar.tracks = {}
	return radar
end

function activateRadar(radar, activated)
	radar.activated = activated
	if not radar.activated then
		radar.tracks = false
	end
	return radar
end

function updateRadar(dat, radar, environment)
	if radar.activated then
		-- go through environment detectable entities
		-- publish emissions
		environment.emissions.em[radar.platform.id]={}
	end

end
