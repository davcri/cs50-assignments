--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleWithPotState = Class{__includes = EntityIdleState}

function PlayerIdleWithPotState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0

    if params then
        self.pot = params.pot
    end

    self.entity:changeAnimation('idle-pot-' .. self.entity.direction)
end

function PlayerIdleWithPotState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerIdleWithPotState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk-pot', {pot = self.pot})
    end

    if love.keyboard.wasPressed('space') then
        print('LAUNCH POT')
        -- self.entity:changeState('swing-sword')
    end
end

-- function PlayerIdleWithPotState:render()
--     EntityIdleState:render()
    
--     -- love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
--     --     math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))

--     -- local anim = self.entity
--     -- local anim = self.entity.currentAnimation
-- end