
-- PositionComponent initializer
PositionComponent={}
PositionComponent.__index = PositionComponent
PositionComponent.name = "PositionComponent"

--конструктор
function PositionComponent.new(set_x, set_y, set_height)
  -- создаем пустую таблицу
  local new_PositionComponent = {
    location = Vector.new(set_x, set_y),
    height = set_height
  }
  -- задаем тип таблицы
  setmetatable(new_PositionComponent, PositionComponent)

  return new_PositionComponent
end

