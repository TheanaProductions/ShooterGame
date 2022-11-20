class ("HealthManager").extends()

function HealthManager:init(maxHealth)

    -- Todo: Add visible hearts for the player

    self.maxHealth = maxHealth
    self.currentHealth = maxHealth
end

function HealthManager:loseHealth(amount)
    self.currentHealth -= amount
end

function HealthManager:winHealth(amount)
    self.currentHealth += amount;

    if self.currentHealth > self.maxHealth then
        self.currentHealth = self.maxHealth
    end
end

function HealthManager:checkHealth()
    if self.currentHealth <= 0 then
        return true
    end

    return false
end

function HealthManager:resetHealth()
    self.currentHealth = self.maxHealth
end