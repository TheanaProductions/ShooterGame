import 'spawner/enemySpawner'
import 'ui/scoreManager'
import 'entity/entity'
import 'entity/player'

local pd <const> = playdate
local gfx <const> = pd.graphics

class("GameScene").extends(gfx.sprite)

function GameScene:init()
    self:add()

    player = Player(35, 120, 4, 3, 3)
    player.canReceiveInput = true

    createScoreUI()

    self.waitingToStartGame = false
    startSpawner()
end

function GameScene:update()
    self.waitingToStartGame = waitingToStartGame

    if self.waitingToStartGame and pd.buttonJustPressed(pd.kButtonB) then
        startSpawner()
        self.waitingToStartGame = false
        player.canReceiveInput = true
        print("Starting game!")
    end
end