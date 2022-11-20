local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(Entity)

function Player:init(x, y, scale, speed, health)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    Player.super.init(self, x, y, scale, speed, health)
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 0 + self.height / 2 then
            self:moveEntity(0, -1, false)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 240 - self.height / 2 then
            self:moveEntity(0, 1, false)
        end
    end
end