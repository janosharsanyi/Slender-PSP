collectgarbage()
os.cpu(333)
splash.old("assets/titleFull.png")

pages = {image.load("./assets/pages/page1.png")
,image.load("./assets/pages/page2.png")
,image.load("./assets/pages/page3.png")
,image.load("./assets/pages/page4.png")
,image.load("./assets/pages/page5.png")
,image.load("./assets/pages/page6.png")
,image.load("./assets/pages/page7.png")
,image.load("./assets/pages/page8.png")
}

pant = sound.load("assets/sounds/breath.mp3")
pant:loop()

staticImage = image.load("assets/tex/tv_static_by_tbh_1138_d3jmbjq-sharedassets0.assets-69.png")
staticImage:center()
staticImage:scale(300)

titlePage = image.load("./assets/title.png")

for i=1,8 do
	pages[i]:center()
	pages[i]:scale(200)
end

bgTimer = timer.new()
bgTimer:start()

meme = false

if not meme then
	static = sound.load("assets/sounds/static2.mp3")
	deathSound = sound.load("assets/sounds/static3.mp3")
else
	static = sound.load("assets/sounds/meme.mp3")
	deathSound = sound.load("assets/sounds/meme.mp3")
end
deathSound:loop()


stage1 = sound.load("assets/sounds/stage1.mp3")
stage1:loop()
stage2 = sound.load("assets/sounds/stage2.mp3")
stage2:loop()
stage3 = sound.load("assets/sounds/stage3.mp3")
stage3:loop()
stage4 = sound.load("assets/sounds/stage4.mp3")
stage4:loop()

math.randomseed(os.time())

timeToNextImg = math.random(2000, 4000)
vX = math.random(-2, 2)
vY = math.random(-1, 1)

x = math.random(120, 360)
y = math.random(80, 200)

pageNum = math.random(1, 8)

alphaCurve = 0
selection = 0

titlePage:scale(200)

white = color.new(255,255,255,255)
gray = color.new(127,127,127,255)
red = color.new(255, 0, 0, 255)
redShad = color.new(127, 0, 0, 255)

menu = sound.load("assets/sounds/menu.mp3")
menu:loop()
menu:play()


while true do
	buttons.read()
	screen.clear(color.new(0, 0, 0, 255))
	
	-- Start ends game (lol)
	if buttons.released.start then break end
	
	if buttons.released.up then 
		selection = selection - 1  
		--button:play()
	end
	
	if buttons.released.down then 
		selection = selection + 1 
		--button:play()
	end
	
	if selection < 0 then selection = 0 end
	if selection > 2 then selection = 2 end
	
	if buttons.released.cross then
		--button:play()
		if selection == 0 then
			menu:stop()
			
			dofile("INTRO.LUA")
			dofile("GAME.LUA")
			
			menu:play()
		elseif selection == 1 then
			menu:stop()
			
			dofile("CREDITS.LUA")
			
			menu:play()
		else
			os.exit()
		end
	end

	if buttons.released.triangle then
		meme = true
	end
	
	-- Background effect
	if bgTimer:time() < (0.2 * timeToNextImg) then
		alphaCurve = bgTimer:time() / (0.2 * timeToNextImg) * 96
	elseif bgTimer:time() >= (0.2 * timeToNextImg) and bgTimer:time() < (0.8 * timeToNextImg) then
		alphaCurve = 96
	elseif bgTimer:time() >= (0.8 * timeToNextImg) then
		alphaCurve = 96 - ( (bgTimer:time() - 0.8 * timeToNextImg) / (0.2 * timeToNextImg) * 96)
	end
	
	pages[pageNum]:blit(x, y, alphaCurve)
	
	x = x + vX / 2
	y = y + vY / 2
	
	if bgTimer:time() >= timeToNextImg then
		bgTimer:reset(0)
		bgTimer:start()
		
		timeToNextImg = math.random(2000, 4000)
		vX = math.random(-2, 2)
		vY = math.random(-1, 1)

		x = math.random(120, 360)
		y = math.random(80, 200)

		newPageNum = math.random(1, 8)
		
		if pageNum == newPageNum then
			pageNum = math.random(1, 8)
		else
			pageNum = newPageNum
		end
	end
	
	titlePage:blit(-240, -34)
	
	if selection == 0 then
	screen.print(240, 140, "Start", 1, red, redShad, __ACENTER)
	screen.print(240, 180, "Credits", 1, white, gray, __ACENTER)
	screen.print(240, 220, "Exit", 1, white, gray, __ACENTER)
	elseif selection == 1 then
	screen.print(240, 140, "Start", 1, white, gray, __ACENTER)
	screen.print(240, 180, "Credits", 1, red, redShad, __ACENTER)
	screen.print(240, 220, "Exit", 1, white, gray, __ACENTER)
	else
	screen.print(240, 140, "Start", 1, white, gray, __ACENTER)
	screen.print(240, 180, "Credits", 1, white, gray, __ACENTER)
	screen.print(240, 220, "Exit", 1, red, redShad, __ACENTER)
	end
	
	screen.flip()
end