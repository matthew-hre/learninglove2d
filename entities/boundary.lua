local world = require("world")
local state = require("state")

return function(x_pos, y_pos, w, h, game_over_boundary)
	local entity = {}
	entity.body = love.physics.newBody(world, x_pos, y_pos, "static")
	entity.shape = love.physics.newRectangleShape(w, h)
	entity.fixture = love.physics.newFixture(entity.body, entity.shape)
	entity.fixture:setUserData(entity)

	entity.end_contact = function()
		state.game_over = game_over_boundary
	end

	return entity
end
