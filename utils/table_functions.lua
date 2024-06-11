function table.find_first_and_remove(target_table, value, start_position)
  if value == nil or target_table == nil then
    return
  end

  for i = start_position, #target_table do
    if value == target_table[i] then
      table.remove(target_table, i)
      return i
    end
  end

  return nil
end

function table.find_and_remove_all(target_table, value)
  if value == nil or target_table == nil then
    return
  end

  local i = 1
  while i do
    i = table.find_first_and_remove(target_table, value, i)
  end
  return nil
end
