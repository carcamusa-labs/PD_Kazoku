TITLE_SCREEN = 'TitleScreen'

-- This should extend from pd.gfx.sprite I think
class(TITLE_SCREEN).extends(Screen)


local pd = playdate
local gfx = pd.graphics

function TitleScreen:init()
    TitleScreen.super.init(self)
end

function TitleScreen:onAppear()
    -- drawBgImg('characters', 'the_father')
    -- gfx.fillRect(100, 100, 100, 20)

    playdate.graphics.drawText("Hello World Again", 200, 120)
end

function TitleScreen:onDisappear()
end

function TitleScreen:update()
    if playdate.buttonJustReleased('a') or playdate.buttonJustReleased('b') then
        global.onChangeScreen(EXPLORE_SCREEN, 1)
    end
end
