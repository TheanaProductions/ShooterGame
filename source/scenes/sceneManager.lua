local pd <const> = playdate
local gfx <const> = pd.graphics

class ("SceneManager").extends()

function SceneManager:switchScene(scene)
    self.newScene = scene

    gfx.sprite.removeAll()
    self:removeAllTimers()
    gfx.setDrawOffset(0, 0)

    print("New scene!")
    self.newScene()
end

function SceneManager:removeAllTimers()
    local allTimers = pd.timer.allTimers()
    for _, timer in ipairs(allTimers) do
        timer:remove()
    end
end