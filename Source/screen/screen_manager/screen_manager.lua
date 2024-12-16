global = {
    currentScreen = nil
}

function global.onChangeScreen(targetScreen)
    local screenTransitionTime = 500 -- Adjust time here

    global.currentScreen.onDisappear()
    
    startScreenTransition(screenTransitionTime, function ()
        if targetScreen == EXPLORE_SCREEN then
            global.currentScreen = ExploreScreen()
        elseif targetScreen == BATTLE_SCREEN then
            global.currentScreen = BattleScreen()
        elseif targetScreen == TITLE_SCREEN then
            global.currentScreen = TitleScreen()
        else
            print("Can't change to unknown screen: " .. targetScreen)
        end
    end)
end
