require "utils.table_functions"

--TODO:
-- функции для добавления и удаления компонентов
-- функции для фильтрации сущностей по наличию компонентов
-- Стандартизировать интерфейс

EntityManager = {name = 'EntityManager'}
EntityManager.__index = EntityManager
--конструктор
function EntityManager.new()
  local new_entity_manager = {
    all_entities = {},
    by_components = {}
  }

  setmetatable(new_entity_manager, EntityManager)

  return new_entity_manager
end

function EntityManager:add_entity(entity)
  table.insert(self.all_entities, entity)

  for _, component in pairs(entity.components) do
    if self.by_components[component.name] ~= nil then
      table.insert(self.by_components[component.name], entity)
    else
      self.by_components[component.name] = {}
      table.insert(self.by_components[component.name], entity)
    end
  end

  return entity
end

function EntityManager:remove_entity(entity)
  table.find_and_remove_all(self.all_entities, entity)

  for _, component in pairs(entity.components) do
    table.find_and_remove_all(self.by_components[component.name], entity)
  end
end

function EntityManager:add_component(entity, component)
  entity.components[component.name] = component

  if not (table.contains(self.by_components[component.name], entity))then
    if self.by_components[component.name] ~= nil then
      table.insert(self.by_components[component.name], entity)
    else
      self.by_components[component.name] = {}
      table.insert(self.by_components[component.name], entity)
    end
  end
end

function EntityManager:remove_component(entity, component)
  entity.components[component.name] = nil
  table.find_and_remove_all(self.by_components[component.name], entity)
end

function EntityManager:select_with_components(required_component_names)

  local query_result = {}
  for _, potential_entity in pairs(self.by_components[required_component_names[1]]) do
    for _, component in pairs(required_component_names) do
      if potential_entity.components[component] == nil then
        goto continue
      end
    end
    table.insert(query_result, potential_entity)
    ::continue::
  end

  return query_result
end
