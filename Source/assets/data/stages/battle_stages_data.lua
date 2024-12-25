-- Data used for each of the 4 battle stages:

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

stagesData = {
    startText = "START!",
    drawScreenCollisionMargins = function ()
        local marginUp = img.new(400, 2, gfx.kColorWhite)
        local marginDown = img.new(400, 2, gfx.kColorWhite)
        local marginLeft = img.new(2, 240, gfx.kColorWhite)
        local marginRight = img.new(2, 240, gfx.kColorWhite)
        local marginUpSpr = spr.new(marginUp)
        local marginDownSpr = spr.new(marginDown)
        local marginLeftSpr = spr.new(marginLeft)
        local marginRightSpr = spr.new(marginRight)
        marginUpSpr:moveTo(200, 0)
        marginDownSpr:moveTo(200, 240)
        marginLeftSpr:moveTo(0, 120)
        marginRightSpr:moveTo(400, 120)
        marginUpSpr:setTag(0)
        marginDownSpr:setTag(0)
        marginLeftSpr:setTag(0)
        marginRightSpr:setTag(0)
        marginUpSpr:setTag(0)
        marginDownSpr:setTag(0)
        marginLeftSpr:setTag(0)
        marginRightSpr:setTag(0)

        print("Collision margins drawn")
    end,
    stage1 = {
        charFullImg = "assets/img/characters/father",
        name = "Stage 1 - 'THE FATHER'",
        bgImg = "",
        bgm = "",
        enemy = "Father",
        drawCollisions = function ()
            stagesData.drawScreenCollisionMargins()

            print("------------------------")
            print("Stage 1 collisions drawn")
            print("------------------------")
        end
    },
    stage2 = {
        charFullImg = "assets/img/characters/mother",
        name = "Stage 2 - 'THE MOTHER'",
        bgImg = "",
        bgm = "",
        enemy = "Mother",
        drawCollisions = function ()
            stagesData.drawScreenCollisionMargins()

            print("------------------------")
            print("Stage 2 collisions drawn")
            print("------------------------")
        end
    },
    stage3 = {
        charFullImg = "assets/img/characters/sister",
        name = "Stage 3 - 'THE SISTER'",
        bgImg = "",
        bgm = "",
        enemy = "Sister",
        drawCollisions = function ()
            stagesData.drawScreenCollisionMargins()

            print("------------------------")
            print("Stage 3 collisions drawn")
            print("------------------------")
        end
    },
    stage4 = {
        charFullImg = "assets/img/characters/grandma",
        name = "Stage 4 - 'THE GRANDMA'",
        bgImg = "",
        bgm = "",
        enemy = "Grandma",
        drawCollisions = function ()
            stagesData.drawScreenCollisionMargins()

            print("------------------------")
            print("Stage 4 collisions drawn")
            print("------------------------")
        end
    }
}