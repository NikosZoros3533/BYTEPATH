Object = require("libraries/classic/classic")

function love.load()
	local object_files = {}
	recursiveEnumerate("objects", object_files)
	requireFiles(object_files)
	circle = Circle(400, 300, 50)
	hyperCircle = HyperCircle(400, 300, 50, 10, 120)
end

function love.update(dt)
	circle:update(dt)
	hyperCircle:update(dt)
end

function love.draw()
	circle:draw()
	hyperCircle:draw()
end

function love.keypressed(key)
	print(key)
end

function love.keyreleased(key)
	print(key)
end

function love.mousepressed(x, y, button)
	print(x, y, button)
end

function love.mousereleased(x, y, button)
	print(x, y, button)
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
