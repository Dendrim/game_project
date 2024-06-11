require "utils.table_functions"
require "utils/dump"
require "utils/vectors"
require "utils/bind_function"
require "utils/entity_manager"
require "components.position_component"

function love.load()
  local success = love.window.setMode( 800, 600, {vsync = 0} )


  local man1 = EntityManager.new()
  local man2 = EntityManager.new()

  local a = {child= nil}
  local b = {parent = nil}

  print_table(a)
  print_table(man2)



  local entity1 = {
    components = {
      PositionComponent.new{set_x=0,set_y=0,set_height=0}
    }
  }
  print_table(entity1)

  man1:add_entity(entity1)
  man2:add_entity(entity1)

  print_table(man2.all_entities)

  print 'man1'
  print_table(man1)
  print()
  print 'man2'
  print_table(man2)

  print ''
  print ''

  man1:remove_entity(entity1)
  man2:remove_entity(entity1)

  print 'man1'
  print_table(man1)
  print()
  print 'man2'
  print_table(man2)

end

function love.update(dt)

end

function love.draw()
  love.graphics.print(love.mouse.getX(), 20, 270)
  love.graphics.print(love.mouse.getY(), 20, 280)
  love.graphics.print(1/love.timer.getDelta(), 20, 290)
end



