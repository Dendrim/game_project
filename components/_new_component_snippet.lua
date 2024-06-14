-- ctrl+h  и меняем [Componentname] на Новое имя

--[[

-- [Componentname]Component initializer
[Componentname]Component={}
[Componentname]Component.__index = [Componentname]Component
[Componentname]Component.name = "[Componentname]Component"

--конструктор
function [Componentname]Component.new()
  -- создаем пустую таблицу
  local new_[Componentname]Component = {
  }
  -- задаем тип таблицы
  setmetatable(new_[Componentname]Component, [Componentname]Component)

  return new_[Componentname]Component
end


]]