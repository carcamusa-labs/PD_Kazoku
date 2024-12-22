SPLASH_SCREEN = "SplashScreen"

class(SPLASH_SCREEN).extends(Screen)

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

local splashScreenSprite = spr.new()
local splashScreenImage = img.new(200, 120)




-- Draws text on the image (empty so far)
gfx.pushContext(splashScreenImage)
gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))
gfx.drawTextAligned("CARCAMUSA", 100, 60, kTextAlignment.center)
gfx.setFontFamily(gfx.getFont(gfx.font.kVariantItalic))
gfx.drawTextAligned("LABS", 128, 75, kTextAlignment.center)
gfx.popContext()

splashScreenSprite:setImage(splashScreenImage:scaledImage(3))
splashScreenSprite:moveTo(200, 80)

function SplashScreen:init()
    SplashScreen.super.init(self)

    clearScreen(gfx.kColorWhite)
    splashScreenSprite:add()

    -- Change back to 5000ms later, sped up for testing purposes
    pd.timer.new(500, function ()
        global.onChangeScreen(TITLE_SCREEN)
    end)
end

function SplashScreen:onAppear()

end

function SplashScreen:onDisappear()
    splashScreenSprite:remove()
end

function SplashScreen:update()

end
