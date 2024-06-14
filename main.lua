require "utils.table_functions"
require "utils/dump"
require "utils/vectors"
require "utils/bind_function"
require "utils/entity_manager"
require "systems.movement_system"
require "components.movement_component"
require "components.position_component"

function love.load()
  local img = love.graphics.newImage('logo.png')

	psystem = love.graphics.newParticleSystem(img, 32)
	psystem:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	psystem:setEmissionRate(5)
	psystem:setSizeVariation(1)
	psystem:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0) -- Fade to transparency.


  local success = love.window.setMode( 800, 600, {vsync = 0} )

  manager = EntityManager.new()

  local entity1 = {
    components = {}
  }

  manager:add_entity(entity1)
  manager:add_component(entity1, PositionComponent.new(300,300,0))
  manager:add_component(entity1, MovementComponent.new(2,2))

  local entity2 = {
    components = {}
  }

  manager:add_entity(entity2)
  manager:add_component(entity2, PositionComponent.new(320,370,0))
  manager:add_component(entity2, MovementComponent.new(2,6))

  local entity3 = {
    components = {}
  }

  manager:add_entity(entity3)
  manager:add_component(entity3, PositionComponent.new(350,300,0))
  manager:add_component(entity3, MovementComponent.new(6,10))

  local entity4 = {
    components = {}
  }

  manager:add_entity(entity4)
  manager:add_component(entity4, PositionComponent.new(300,350,0))
  manager:add_component(entity4, MovementComponent.new(9,5))

  local entity5 = {
    components = {}
  }

  manager:add_entity(entity5)
  manager:add_component(entity5, PositionComponent.new(400,350,0))
  manager:add_component(entity5, MovementComponent.new(5,7))
end

function love.update(dt)
  MovementSystem.update(manager, dt)

  --psystem:update(dt)
end

function love.draw()

  --love.graphics.draw(psystem, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)

  love.graphics.print(love.mouse.getX(), 20, 270)
  love.graphics.print(love.mouse.getY(), 20, 280)
  love.graphics.print(1/love.timer.getDelta(), 20, 290)
  love.graphics.print(#manager.all_entities, 20, 320)

  for _, entity in pairs(manager:select_with_components({'PositionComponent'})) do
    love.graphics.circle( 'line',
                          entity.components['PositionComponent'].location.x,
                          entity.components['PositionComponent'].location.y,
                          10, 6 )

    love.graphics.line(
      entity.components['PositionComponent'].location.x, entity.components['PositionComponent'].location.y,
      400,300
    )
  end
end
