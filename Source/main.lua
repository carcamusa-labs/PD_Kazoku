-- Tooling and libs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Other assets imports
import "core_logic/game_states"
import "assets/sound/pdfxr.lua"
import "assets/sound/global_sfx.lua"
import "assets/data/stages/cutscene_dialogs"
import "assets/data/stages/battle_stages_data"

-- Screen script and UI imports
import "./UI/message"
import "./UI/choice"
import "screen/common"
import "screen/splash"
import "screen/opening_cutscene"
import "screen/title"
import "screen/battle_screen"
import "screen/screen_manager/screen_manager"
import "screen/helper_functions/helpers"
import "screen/menu_functions/menu_functions"
import "screen/cutscene_manager/cutscene_manager"

-- Player and mob sprites imports
import "assets/sprites/player"
import "assets/sprites/father"
import "assets/sprites/mother"
import "assets/sprites/sister"
import "assets/sprites/grandma"


local pd <const> = playdate
local gfx <const> = pd.graphics
local spr <const> = gfx.sprite
local img <const> = gfx.image

-- Game screen management

function initGame()
    global.currentScreen = OpeningCutsceneScreen()
    global.currentScreen.onAppear()
end

function playdate.update()
    pd.timer.updateTimers()
    spr.update()
    global.currentScreen.update()
end

initGame()
