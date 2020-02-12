-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2019 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

base_size = 32

local nb = 0
x = x or 0
y = y or 0
life = life or nil

local first = true

return {
	blend_mode=additive and core.particles.BLEND_SHINY or nil,
	system_rotation = 0, system_rotationv = rotation or 0.3,
	generator = function()
	local fs = 38 * (radius or 1)

	return {
		trail = 0,
		life = life or 100,
		size = fs, sizev = 0, sizea = 0,

		x = x * base_size, xv = 0, xa = 0,
		y = y * base_size, yv = 0, ya = 0,
		dir = 0, dirv = dirv, dira = 0,
		vel = 0, velv = 0, vela = 0,

		r = 1, rv = 0, ra = 0,
		g = 1, gv = 0, ga = 0,
		b = 1, bv = 0, ba = 0,
		a = a or 1, av = 0, aa = 0,
	}
end, },
function(self)
	if first or not life then self.ps:emit(1) end
	first = false
end,
1, "particles_images/"..(img or "square"), true
