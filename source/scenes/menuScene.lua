import 'scenes/gameScene'

local pd <const> = playdate
local gfx <const> = pd.graphics

class("MenuScene").extends(gfx.sprite)

-- TODO: Create the scene
function MenuScene:init()
    self:add()
    print('This is the menu Scene')
end

function MenuScene:update()
    if pd.buttonJustPressed(pd.kButtonB) then
        print("Click")
        SCENE_MANAGER:switchScene(GameScene)
    end
end