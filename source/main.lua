import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import 'entity'
import 'player'
import 'enemySpawner'
import 'scoreManager'

local pd <const> = playdate
local gfx <const> = pd.graphics

local waitingToStartGame

local function initialize()
    player = Player(35, 120, 4, 3, 3)
    createScoreUI()
    resetGame()
end

function resetGame()
    waitingToStartGame = true
    stopSpawner()
    resetScore()
    player.health:resetHealth()
    player.canReceiveInput = false
    print("Paused Game...")
end

function playdate.update()
    if waitingToStartGame and pd.buttonJustPressed(pd.kButtonB) then
        startSpawner()
        waitingToStartGame = false
        player.canReceiveInput = true
        print("Starting game!")
    end

    gfx.sprite.update()
    pd.timer.updateTimers()
end

initialize()