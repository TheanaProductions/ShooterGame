import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import 'scenes/sceneManager'
import 'scenes/menuScene'

import 'spawner/enemySpawner'
import 'ui/scoreManager'
import 'entity/entity'
import 'entity/player'

local pd <const> = playdate
local gfx <const> = pd.graphics

SCENE_MANAGER = SceneManager()

SCENE_MANAGER:switchScene(MenuScene)

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end

function gameOver()
    waitingToStartGame = true
    stopSpawner()
    resetScore()
    player.health:resetHealth()
    player.canReceiveInput = false
    -- TODO: Replace player at the starting position
    print("Game Over...")
end