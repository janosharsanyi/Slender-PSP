stage1:play()


bgTimer:reset(0)
bgTimer:start()


while true do 
	buttons.read()
	screen.clear(color.new(0, 0, 0, 255))
	
	if bgTimer:time() < 5000 then
		screen.print(240, 120, "Game Design & Programming", 1, white, gray, __ACENTER)
		screen.print(240, 152, "Mark J. Hadley", 1, white, gray, __ACENTER)
	elseif bgTimer:time() >= 5000 and bgTimer:time() < 10000 then
		screen.print(240, 88, "Music & Sound", 1, white, gray, __ACENTER)
		screen.print(240, 120, "Mark J. Hadley", 1, white, gray, __ACENTER)
		screen.print(240, 152, "Freedoom", 1, white, gray, __ACENTER)
		screen.print(240, 184, "Croteam", 1, white, gray, __ACENTER)
	elseif bgTimer:time() >= 10000 and bgTimer:time() < 15000 then
		screen.print(240, 120, "PSP Port", 1, white, gray, __ACENTER)
		screen.print(240, 152, "Nathan Bourgeois (Iridescence)", 1, white, gray, __ACENTER)
	elseif bgTimer:time() >= 15000 and bgTimer:time() < 18000 then
		screen.print(240, 56, "Models", 1, white, gray, __ACENTER)
		screen.print(240, 88, "Pau Cano", 1, white, gray, __ACENTER)
		screen.print(240, 120, "Universal Image", 1, white, gray, __ACENTER)
		screen.print(240, 152, "VIS Games", 1, white, gray, __ACENTER)
		screen.print(240, 184, "Profi Developers", 1, white, gray, __ACENTER)
		screen.print(240, 216, "Unity Technology", 1, white, gray, __ACENTER)
	elseif bgTimer:time() >= 18000 and bgTimer:time() < 21000 then
		screen.print(240, 120, "Images & Sprites", 1, white, gray, __ACENTER)
		screen.print(240, 152, "Doom64, KDiZD, Captain Toenail", 1, white, gray, __ACENTER)
		screen.print(240, 184, "@Xous54", 1, white, gray, __ACENTER)
	elseif bgTimer:time() >= 21000 and bgTimer:time() < 35000 then
		screen.print(240, 136, "Thank you for playing!", 1, white, gray, __ACENTER)
	else break end
	
	if buttons.released.cross then break end
	
	
	screen.flip()
end

stage1:stop()