import ('enemy')

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startSpawner()
    math.randomseed(playdate.getSecondsSinceEpoch())
    createTimer()
end

function createTimer()
    local spawnTime = math.random(500, 1000)
    spawnTimer = pd.timer.performAfterDelay(spawnTime, function()
        createTimer()
        spawnEnemy()
    end)
end

function stopSpawner()
    clearEnemy()
    if spawnTimer then
        spawnTimer:remove()
    end
end

function spawnEnemy()
    local spawnY = math.random(10, 230)
    Enemy(430, spawnY, 4, 1.25, 1)
end

function clearEnemy()
    local allSprites = gfx.sprite.getAllSprites()
    for index,sprite in ipairs(allSprites) do
        if sprite.isa(Enemy) then
            sprite:remove()
        end
    end
end