--TODO:
-- функции для добавления и удаления компонентов
-- функции для фильтрации сущностей по наличию компонентов


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

