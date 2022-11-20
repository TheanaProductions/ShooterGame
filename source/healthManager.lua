class ("HealthManager").extends()

function HealthManager:init(maxHealth)

    -- Todo: Add visible hearts for the player

    self.maxHealth = maxHealth
    self.currentHealth = maxHealth
end

function HealthManager:loseHealth(amount)
    self.currentHealth -= amount
    print("Lost " .. amount .. " health")

    if self.currentHealth <= 0 then
        resetGame()
    end
end

function HealthManager:winHealth(amount)
    self.currentHealth += amount;

    print("Won " .. amount .. " health")

    if self.currentHealth > self.maxHealth then
        self.currentHealth = self.maxHealth
    end
end