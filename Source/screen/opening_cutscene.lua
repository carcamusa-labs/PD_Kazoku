OPENING_CUTSCENE_SCREEN = 'OpeningCutsceneScreen'

class(OPENING_CUTSCENE_SCREEN).extends(Screen)

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

-- function openDialog()
--     isDialogOpen = true
-- end

-- function endDialog()
--     isDialogOpen = false
-- end

-- Screen lifecycle
function OpeningCutsceneScreen:init()
	OpeningCutsceneScreen.super.init(self)

    drawBackground("assets/img/cutscene_images/house", gfx.kColorBlack)

    -- Attempts to add some time prior to the dialog box, and prior to changing to the next screen
    -- Change timer to 2000 later
    pd.timer.new(100, function ()
        Message.show(--[[globalCutsceneDialogs.openingCutscene]] {"TEST MESSAGE"}, "Message", function ()
            pd.timer.new(1000, function ()
                -- Change to battle screen 1, father
                global.onChangeScreen(BATTLE_SCREEN, 'screen1')
            end)
        end)
    end)
end

function OpeningCutsceneScreen:onAppear()
end

function OpeningCutsceneScreen:onDisappear()
end

function OpeningCutsceneScreen:update()
    Message.update()

    -- aButtonPressed()
    -- bButtonPressed()
end


-- function aButtonPressed()
--     if pd.buttonJustPressed(pd.kButtonA) then
--     end
-- end

-- function bButtonPressed()
--     if pd.buttonJustPressed(pd.kButtonB) then
--     end
-- end
