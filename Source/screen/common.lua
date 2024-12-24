local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

function fillTable(tableToFill, content)
    local keys = {}
    for key in pairs(content) do
        table.insert(keys, key)
    end
    table.sort(keys)
    
    for _, key in ipairs(keys) do
        table.insert(tableToFill, content[key])
    end
    print('Filled table results are: ' .. json.encodePretty(tableToFill))
end

function clearScreen(color) -- use gfx.kColorBlack or gfx.kColorWhite
    CURR_BG_IMG = img.new(400, 240, color)
	CURR_BG_SPR = gfx.sprite.new(CURR_BG_IMG)
	CURR_BG_SPR:moveTo(200, 120)
	CURR_BG_SPR:add()
end

function drawBackground(path, color)
	gfx.setBackgroundColor(color)

	CURR_BG_IMG = gfx.image.new(path)
	CURR_BG_SPR = gfx.sprite.new(CURR_BG_IMG)
	CURR_BG_SPR:moveTo(200, 120)
	CURR_BG_SPR:add()
end

function clearBackground()
	CURR_BG_IMG = nil
	CURR_BG_SPR:remove()
	CURR_BG_SPR = nil
end

function drawBgImg(folder, imgName)
    local path = '/assets/img/' .. folder .. "/" .. imgName
    print("Using bgPath: ", path)
    drawBackground(path, gfx.kColorBlack)
end

function createTransitionSprite(color)
	local filledRect = gfx.image.new(400, 240, color)
	local transitionSprite = gfx.sprite.new(filledRect)
	transitionSprite:moveTo(200, 120)
	transitionSprite:add()
	return transitionSprite
end

function wipeTransition(startValue, endValue, time, color)
	local transitionSprite = createTransitionSprite(color)
	transitionSprite:setClipRect(0, 0, startValue, 240)

	-- local transitionTime = time -- Less lengthier now for testing purposes
	local transitionTimer = pd.timer.new(time, startValue, endValue, pd.easingFunctions.inOutCubic)
	transitionTimer.updateCallback = function(timer)
		transitionSprite:setClipRect(0, 0, timer.value, 240)
	end
	return transitionTimer
end

function startScreenTransition(time, callback)
    local transitionTimer = wipeTransition(0, 400, time, gfx.kColorBlack)
    transitionTimer.timerEndedCallback = function()
        callback()
        transitionTimer = wipeTransition(400, 0, time, gfx.kColorBlack)
    end
end

function setGamemode(gamemode)
    if type(gamemode) == "number" and (gamemode == 0 or gamemode == 1) then
        GAMEMODE = gamemode
    elseif type(gamemode) == "string" then
        if gamemode == "cutscene" then
            GAMEMODE = 0
        elseif gamemode == "battle" then
            GAMEMODE = 1
        else
            error("Invalid gamemode: " .. gamemode)
        end
    else
        error("Invalid type for gamemode: " .. type(gamemode))
    end
end

-- Use toggles with "on" or "off"
function toggleDialog(state)
	if (state == "on") or (state == true) or (state == 1) then
		IS_DIALOG_OPEN = true
	end
	if (state == "off") or (state == false) or (state == 0) then
        IS_DIALOG_OPEN = false
	end
	print("Dialog is open: ".. tostring(IS_DIALOG_OPEN))
end

function toggleJump(state)
	if (state == "on") or (state == true) or (state == 1) then
		PLAYER_CAN_JUMP = true
	end
	if (state == "off") or (state == false) or (state == 0) then
        PLAYER_CAN_JUMP = false
	end
	print("Player can jump: ".. tostring(PLAYER_CAN_JUMP))
end

function toggleAttack(state)
	if (state == "on") or (state == true) or (state == 1) then
		PLAYER_CAN_ATTACK = true
	end
	if (state == "off") or (state == false) or (state == 0) then
		PLAYER_CAN_ATTACK = false
	end
	print("Player can attack: ".. tostring(PLAYER_CAN_ATTACK))
end

function toggleMove(state)
	if (state == "on") or (state == true) or (state == 1) then
		PLAYER_CAN_MOVE = true
	end
	if (state == "off") or (state == false) or (state == 0) then
        PLAYER_CAN_MOVE = false
	end
	print("Player can move: ".. tostring(PLAYER_CAN_MOVE))
end

function toggleAllPlayerActions(state)
	if (state == "on") or (state == true) or (state == 1) then
		PLAYER_CAN_JUMP = true
		PLAYER_CAN_ATTACK = true
		PLAYER_CAN_MOVE = true
	end
	if (state == "off") or (state == false) or (state == 0) then
        PLAYER_CAN_JUMP = false
		PLAYER_CAN_ATTACK = false
        PLAYER_CAN_MOVE = false
	end
	print("Jump: " .. tostring(PLAYER_CAN_JUMP))
	print("Attack: " .. tostring(PLAYER_CAN_ATTACK))
	print("Move: " .. tostring(PLAYER_CAN_MOVE))
end

function aButtonPressed()
    if pd.buttonJustPressed(pd.kButtonA) then
		if GAMEMODE == 0 then
			print("A - Nothing happens, game in cutscene mode")
		end

		if GAMEMODE == 1 then
			if PLAYER_CAN_ATTACK then
				print("Punch!")
			end
		end
	end
end

function bButtonPressed()
    if pd.buttonJustPressed(pd.kButtonB) then
		if GAMEMODE == 0 then
			print("B - Nothing happens, game in cutscene mode")
		end

		if GAMEMODE == 1 then
			if PLAYER_CAN_JUMP then
				print("Jump!")
			end
		end
    end
end

function handleMovement()
	if GAMEMODE == 1 then
		if PLAYER_CAN_MOVE then
			if pd.buttonIsPressed(pd.kButtonUp) then
				print("Up pressed")
				playerSprite:moveBy(0, -playerSpeed)
			end
			if pd.buttonIsPressed(pd.kButtonDown) then
				print("Down pressed")
				playerSprite:moveBy(0, playerSpeed)
			end
			if pd.buttonIsPressed(pd.kButtonLeft) then
				print("Left pressed")
				playerSprite:moveBy(-playerSpeed, 0)
			end
			if pd.buttonIsPressed(pd.kButtonRight) then
				print("Right pressed")
				playerSprite:moveBy(playerSpeed, 0)
			end
		end
	end
end
