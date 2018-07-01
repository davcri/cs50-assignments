
Powerup = Class{}

function Powerup:init()
    self.x = math.random(20, VIRTUAL_WIDTH - 20)
    self.y = 120 + math.random(-30, 30)
    self.type = 8
    self.inPlay = false
    self.speed = 25
    self.width = 16
    self.height = 16
    self.timer = 0  --counter
    self.spawnTime = 1 -- seconds
end

function Powerup:collides(target) 
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    self:reset()

    return true
end

function Powerup:reset()
    self.inPlay = false
    self.timer = 0
    self.x = math.random(20, VIRTUAL_WIDTH - 20)
    self.y = 120 + math.random(-30, 30)
end

function Powerup:update(dt)
    -- update timer
    self.timer = self.timer + dt
    if self.timer > self.spawnTime then
        self.inPlay = true
    end
    -- update position
    self.y = self.y + self.speed*dt
end

function Powerup:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['powerups'][self.type], self.x, self.y)
    end
end

-- function Powerup:spawnBalls()
--     local b = Ball(math.random(7))
--     b.x = self.balls[1].x
--     b.y = self.balls[1].y
--     b.dx = math.random(-200, 200)
--     b.dy = math.random(-50, -60)
--     table.insert(self.balls, b) 
-- end