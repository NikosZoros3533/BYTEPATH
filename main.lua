Object = require("libraries/classic/classic")
Input = require("libraries/inputs/Input")
Timer = require("libraries.hump.enhancedTimer")
fn = require("libraries.Moses.moses")

function love.load()
	local object_files = {}
	recursiveEnumerate("objects", object_files)
	requireFiles(object_files)
	local rooms_files = {}
	recursiveEnumerate("rooms", object_files)
	requireFiles(rooms_files)
	input = Input()
	timer = Timer()
	current_room = nil
	input:bind("f1", function()
		goToRoom("CircleRoom")
	end)
	input:bind("f2", function()
		goToRoom("RectangleRoom")
	end)
	input:bind("f3", function()
		goToRoom("PolygonRoom")
	end)
end

function love.update(dt)
	timer:update(dt)
	if current_room then
		current_room:update(dt)
	end
end

function love.draw()
	if current_room then
		current_room:draw()
	end
end

function goToRoom(room_type, ...)
	current_room = _G[room_type](...)
end

function recursiveEnumerate(folder, file_list)
	local items = love.filesystem.getDirectoryItems(folder)
	for _, item in ipairs(items) do
		local file = folder .. "/" .. item
		if love.filesystem.getInfo(file) then
			table.insert(file_list, file)
		elseif love.filesystem.isDirectory(file) then
			recursiveEnumerate(file, file_list)
		end
	end
end

function requireFiles(files)
	for _, file in ipairs(files) do
		local file = file:sub(1, -5)
		require(file)
	end
end
