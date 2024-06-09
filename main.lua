require "utils/dump"
require "utils/vectors"
require "utils/bind_function"

function love.load()
  local success = love.window.setMode( 800, 600, {vsync = 0} )
end

function love.update(dt)

end

function love.draw()
  love.graphics.print(love.mouse.getX(), 20, 270)
  love.graphics.print(love.mouse.getY(), 20, 280)
  love.graphics.print(1/love.timer.getDelta(), 20, 290)
end
