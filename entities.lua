local boundary = require("entities/boundary")
local paddle = require("entities/paddle")
local ball = require("entities/ball")
local brick = require("entities/brick")
local pause_text = require("entities/pause-text")
local stage_clear_text = require("entities/stage-clear-text")
local game_over_text = require("entities/game-over-text")

local screen_w, screen_h = love.graphics.getDimensions()

local entities = {
	boundary(400, 606, screen_w, 5, true),
	boundary(-6, 300, 5, screen_h),
	boundary(806, 300, 5, screen_h),
	boundary(400, -6, screen_w, 5),
	paddle(300, 500),
	ball(200, 200),
	pause_text(),
	stage_clear_text(),
	game_over_text(),
}

local row_width = love.window.getMode() - 20
for number = 0, 38 do
	local brick_x = ((number * 60) % row_width) + 40
	local brick_y = (math.floor((number * 60) / row_width) * 40) + 80
	entities[#entities + 1] = brick(brick_x, brick_y)
end

return entities
