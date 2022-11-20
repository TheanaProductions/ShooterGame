import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import 'entity'
import 'player'
import 'enemy'

local pd <const> = playdate
local gfx <const> = pd.graphics

math.randomseed(playdate.getSecondsSinceEpoch())

player = Player(35, 120, 4, 3, 3)
Enemy(425, 100, 4, 1.5, 1)

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end

function resetGame()
    print("You lost!")
end