BATTLE_SCREEN = "BattleScreen"

class(BATTLE_SCREEN).extends(Screen)

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

function openDialog()
    isDialogOpen = true
end

function endDialog()
    isDialogOpen = false
end

-- Screen lifecycle
-- Takes param from data/screens/battle_screens_data (screen1, screen2, etc)
function BattleScreen:init(params)
	BattleScreen.super.init(self)

    local currentScreenData = screensData[params]

    drawBackground(currentScreenData.bgImg, gfx.kColorBlack)

    -- Load father's dialogue here
    -- Change timer to 2000 and 1000 respectively later
    pd.timer.new(100, function ()
        Message.show(--[[globalCutsceneDialogs.fatherDialogStart]] {"TEST MESSAGE"}, "Father", function ()
            pd.timer.new(100, function ()
                -- Starts and instantiates battle mode, sprites, movement and everything

                -- All of this initializes a 'ready' screen with text
                local readyScreenSprite = spr.new()
                local readyScreenImg = img.new(200, 120)
                local readyScreenText = "Stage 1 - 'THE FATHER'"
                local startText = "START!"

                gfx.pushContext(readyScreenImg)
                clearScreen(gfx.kColorBlack)
                gfx.drawTextAligned(readyScreenText, 100, 40, kTextAlignment.center)
                gfx.drawTextAligned(startText, 100, 80, kTextAlignment.center)
                gfx.popContext()

                readyScreenSprite:setImage(readyScreenImg:scaledImage(2))
                readyScreenSprite:moveTo(200, 120)
                readyScreenSprite:add()
            end)
        end)
    end)
end

function BattleScreen:onAppear()
end

function BattleScreen:onDisappear()
end

function BattleScreen:update()
    Message.update()

    aButtonPressed()
    bButtonPressed()
end


function aButtonPressed()
    if pd.buttonJustPressed(pd.kButtonA) then
    end
end

function bButtonPressed()
    if pd.buttonJustPressed(pd.kButtonB) then
    end
end
