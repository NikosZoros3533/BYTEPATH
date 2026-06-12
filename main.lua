Object = require("libraries/classic/classic")
Input = require("libraries/inputs/Input")
Timer = require("libraries.hump.enhancedTimer")
fn = require("libraries.Moses.moses")

a = { 1, 2, "3", 4, "5", 6, 7, true, 9, 10, 11, a = 1, b = 2, c = 3, { 1, 2, 3 } }
b = { 1, 1, 3, 4, 5, 6, 7, false }
c = { "1", "2", "3", 4, 5, 6 }
d = { 1, 4, 3, 4, 5, 6 }
function love.load()
	local object_files = {}
	recursiveEnumerate("objects", object_files)
	requireFiles(object_files)
	input = Input()
	timer = Timer()
	print(fn.map(d, function(v)
		return v + 1
	end))
end

function love.update(dt)
	timer:update(dt)
end

function love.draw() end

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
