BATTLE_SCREEN = "BattleScreen"

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

class(BATTLE_SCREEN).extends(Screen)


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
                local readyScreenImg = img.new(200, 120)
                local readyScreenSprite = spr.new()
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
                -------------------------------------------------------

                pd.timer.new(2000, function ()
                    clearScreen(gfx.kColorBlack)
                    readyScreenSprite:remove()
                    Player(PLAYER_INIT_X, PLAYER_INIT_Y)
                end)
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

    handleMovement()
    aButtonPressed()
    bButtonPressed()
end