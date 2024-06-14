-- MovementComponent initializer
MovementComponent={}
MovementComponent.__index = MovementComponent
MovementComponent.name = "MovementComponent"

--конструктор
function MovementComponent.new(set_x, set_y)
  -- создаем пустую таблицу
  local new_MovementComponent = {
    movable = true,
    velocity = Vector.new(set_x,set_y)
  }
  -- задаем тип таблицы
  setmetatable(new_MovementComponent, MovementComponent)

  return new_MovementComponent
end