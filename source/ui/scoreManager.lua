local pd <const> = playdate
local gfx <const> = pd.graphics

local scoreSprite
local score

function createScoreUI()
    scoreSprite = gfx.sprite.new()
    resetScore()
    scoreSprite:setCenter(0, 0)
    scoreSprite:moveTo(320, 4)
    scoreSprite:add()
end

local function updateDisplay()
    local scoreText = "Score: " .. score
    local textWidth, textHeight = gfx.getTextSize(scoreText)
    local scoreImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(scoreImage)
        gfx.drawText(scoreText, 0, 0)
    gfx.popContext()
    scoreSprite:setImage(scoreImage)
end

function resetScore()
    score = 0
    updateDisplay()
end

function addScore(amount)
    score += amount
    updateDisplay()
end