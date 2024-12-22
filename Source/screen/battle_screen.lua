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

    drawBackground("assets/img/characters/father", gfx.kColorBlack)

    -- Load father's dialogue here
    -- Change timer to 2000 later
    pd.timer.new(100, function ()
        Message.show(--[[globalCutsceneDialogs.fatherDialogStart]] {"TEST MESSAGE"}, "Father", function ()
            pd.timer.new(1000, function ()
                -- Starts and instantiates battle mode, sprites, movement and everything
                print(screensData[params].testPrintDialog)
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
