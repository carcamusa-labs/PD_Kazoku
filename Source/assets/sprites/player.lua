PLAYER = "Player"

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

playerSpeed = PLAYER_INIT_SPEED
playerDamage = PLAYER_INIT_DAMAGE
playerHealth = PLAYER_INIT_HEALTH
playerImg = img.new(30, 30, gfx.kColorWhite)
playerSprite = spr.new(playerImg)

class(PLAYER).extends(spr)

function Player:init(x, y)
    Player.super.init(self)
    setGamemode(1)

    toggleAllPlayerActions("on")
    playerSprite:moveTo(x, y)
    playerSprite:add()
end

function Player:onAppear()
end

function Player:onDisappear()
    toggleAllPlayerActions("off")
    playerSprite:remove()
end

function Player:update()
end