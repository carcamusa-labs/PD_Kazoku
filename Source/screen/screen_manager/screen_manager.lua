global = {
    currentScreen = nil
}

-- Params used for BattleScreen params only so far
function global.onChangeScreen(targetScreen, params)
    local screenTransitionTime = 500 -- Adjust time here

    global.currentScreen.onDisappear()
    
    startScreenTransition(screenTransitionTime, function ()
        if targetScreen == OPENING_CUTSCENE_SCREEN then
            global.currentScreen = OpeningCutsceneScreen()
        elseif targetScreen == TITLE_SCREEN then
            global.currentScreen = TitleScreen()
        elseif targetScreen == BATTLE_SCREEN then
            global.currentScreen = BattleScreen(params)
        else
            print("Can't change to unknown screen: " .. targetScreen)
        end
    end)
end
