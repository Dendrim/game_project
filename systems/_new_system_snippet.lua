-- ctrl+h  и меняем [Componentname] на Новое имя

--[[

-- [SystemName]System initializer
[SystemName]System={}
[SystemName]System.__index = [SystemName]System
[SystemName]System.name = "[SystemName]System"

--конструктор
function [SystemName]System.new()
  -- создаем пустую таблицу
  local new_[SystemName]System = {
  }
  -- задаем тип таблицы
  setmetatable(new_[SystemName]System, [SystemName]System)

  return new_[SystemName]System
end


]]