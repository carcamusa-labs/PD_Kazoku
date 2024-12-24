BATTLE_SCREEN = "BattleScreen"

local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

class(BATTLE_SCREEN).extends(Screen)


-- Screen lifecycle
-- Takes param from data/stages/battle_stages_data (stage1, stage2, etc)
function BattleScreen:init(params)
	BattleScreen.super.init(self)

    local currentStageData = stagesData[params]

    drawBackground(currentStageData.charFullImg, gfx.kColorBlack)

    -- Load father's dialogue here
    -- Change timer to 2000 and 1000 respectively later
    pd.timer.new(100, function ()
        Message.show(--[[ cutsceneDialogs[params] ]] {"TEST MESSAGE"}, currentStageData.enemy, function ()
            pd.timer.new(100, function ()
                -- Starts and instantiates battle mode, sprites, movement and everything

                -- All of this initializes a 'ready' screen with text
                local stageReadyImg = img.new(200, 120)
                local stageReadySpr = spr.new()
                local stageReadyText = currentStageData.name

                gfx.pushContext(stageReadyImg)
                clearScreen(gfx.kColorBlack)
                gfx.drawTextAligned(stageReadyText, 100, 40, kTextAlignment.center)
                gfx.drawTextAligned(stagesData.startText, 100, 80, kTextAlignment.center)
                gfx.popContext()

                stageReadySpr:setImage(stageReadyImg:scaledImage(2))
                stageReadySpr:moveTo(200, 120)
                stageReadySpr:add()
                -------------------------------------------------------

                pd.timer.new(2000, function ()
                    clearScreen(gfx.kColorBlack)
                    stageReadySpr:remove()
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