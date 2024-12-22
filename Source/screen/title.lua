TITLE_SCREEN = 'TitleScreen'

-- This should extend from pd.gfx.sprite I think
class(TITLE_SCREEN).extends(Screen)

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

local titleScreenSprite = spr.new()
local titleScreenImage = img.new(200, 120)
local titleScreenText = spr.spriteWithText("Press Ⓐ to start", 400, 240)

gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))

-- Draws text on the image (empty so far)
gfx.pushContext(titleScreenImage)
clearScreen(gfx.kColorWhite)
gfx.drawTextAligned("KAZOKU", 100, 60, kTextAlignment.center)
gfx.popContext()

titleScreenSprite:setImage(titleScreenImage:scaledImage(4))
titleScreenSprite:moveTo(200, 80)
titleScreenText:moveTo(200, 170)

local function showIntermitentTitleText()
    -- Prints intermittent title text
    local localTime = pd.getTime()
    if localTime.millisecond < 500 then
        titleScreenText:add()
    else
        titleScreenText:remove()
    end
end


function TitleScreen:init()
    TitleScreen.super.init(self)
    
    titleScreenSprite:add()
end

function TitleScreen:onAppear()
    
end

function TitleScreen:onDisappear()
    titleScreenSprite:remove()
    titleScreenText:remove()
end

function TitleScreen:update()
    showIntermitentTitleText()

    if playdate.buttonJustReleased('a') then
        global.onChangeScreen(OPENING_CUTSCENE_SCREEN)
        sfx.playConfirm()
    end
end
