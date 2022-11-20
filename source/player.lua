import ('healthManager')
import ('bullet')

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(Entity)

function Player:init(x, y, scale, speed, health)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    Player.super.init(self, x, y, scale, speed, health)
    self.canReceiveInput = true
end

function Player:update()
    if !self.canReceiveInput then return end

    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 0 + self.height / 2 then
            self:moveEntity(0, -1, false)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 240 - self.height / 2 then
            self:moveEntity(0, 1, false)
        end
    end

    if pd.buttonJustPressed(pd.kButtonA) then
        self:shoot() -- TODO : Add a cooldown timer
    end
end

function Player:shoot()
    Bullet(self.x, self.y, 5, 3)
end

function Player:checkIfDead()
    if self.health:checkHealth() then
        resetGame()
    end
end