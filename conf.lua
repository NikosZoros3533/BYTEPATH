gw = 480
gh = 270
sx = 1
sy = 1
function love.conf(t)
	t.identity = nil
	-- t.version = "0.10.2"
	t.console = false --Attach a console(boolean,Widnows only)

	t.window.title = "BYTEPATH"
	t.window.icon = nil
	t.window.width = gw
	t.window.height = gh
	t.window.borderless = false
	t.window.resizable = true
	t.window.minwidth = 1
	t.window.minheight = 1
	t.window.fullscreen = false
	t.window.fullscreentype = "exclusive"
	t.window.vsync = true
	t.window.fsaa = 0
	t.window.display = 1
	t.window.highdpi = false
	t.window.srgb = false
	t.window.x = nil
	t.window.y = nil

	t.modules.audio = true
	t.modules.event = true
	t.modules.graphics = true
	t.modules.image = true
	t.modules.joystick = true
	t.modules.keyboard = true
	t.modules.math = true
	t.modules.mouse = true
	t.modules.physics = true
	t.modules.sound = true
	t.modules.system = true
	t.modules.timer = true
	t.modules.window = true
	t.modules.thread = true
end
