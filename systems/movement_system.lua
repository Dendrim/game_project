
-- MovementSystem initializer
MovementSystem={}
MovementSystem.__index = MovementSystem
MovementSystem.name = "MovementSystem"

--конструктор
--[[
function MovementSystem.new()
  -- создаем пустую таблицу
  local new_MovementSystem = {
  }
  -- задаем тип таблицы
  setmetatable(new_MovementSystem, MovementSystem)

  return new_MovementSystem
end
 ]]

function MovementSystem.update(entity_manager, dt)
  for _, entity in pairs(entity_manager:select_with_components({'MovementComponent','PositionComponent'})) do
    entity.components['PositionComponent'].location =
      entity.components['PositionComponent'].location + entity.components['MovementComponent'].velocity:scale(dt)
      entity.components['PositionComponent'].location = entity.components['PositionComponent'].location:rotate_around(30 * dt,Vector.new(400,300))
  end
end