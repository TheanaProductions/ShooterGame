import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import 'entity'
import 'player'
import 'enemySpawner'

local pd <const> = playdate
local gfx <const> = pd.graphics

local waitingToStartGame = true

function initialize()
    player = Player(35, 120, 4, 3, 3)
    resetGame()
end

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end

function resetGame()
    waitingToStartGame = true
    stopSpawner()
    player.health:resetHealth()
    player.canReceiveInput = false
    print("You lost!")

    if waitingToStartGame and pd.buttonJustPressed(pd.kButtonB) then
        startSpawner()
        waitingToStartGame = false
        print("Starting game!")
    end
end