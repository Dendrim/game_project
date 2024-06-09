
table.unpack = unpack

function bind(func, arg_table)
   return function() return func(table.unpack(arg_table)) end
end
