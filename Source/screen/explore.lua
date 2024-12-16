EXPLORE_SCREEN = 'ExploreScreen'

class(EXPLORE_SCREEN).extends(Screen)

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
function ExploreScreen:init()
	ExploreScreen.super.init(self)

    drawBackground("assets/img/characters/father", gfx.kColorBlack)
end

function ExploreScreen:onAppear()
end

function ExploreScreen:onDisappear()
end

function ExploreScreen:update()
    Message.update()

    aButtonPressed()
    bButtonPressed()
end


function aButtonPressed()
    if pd.buttonJustPressed(pd.kButtonA) then
        sfx.playConfirm()
        clearScreen(gfx.kColorWhite)
    end
end

function bButtonPressed()
    if pd.buttonJustPressed(pd.kButtonB) then
        sfx.playCancel()
        clearScreen(gfx.kColorBlack)
    end
end
