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

--------------------------------------------------------------------------------------
-- Advanced shaders
--------------------------------------------------------------------------------------
if core.shader.active(4) then
use_shader = {type="fireflash"}
base_size = 64

local nb = 0

return {
	system_rotation = rng.range(0,359), system_rotationv = 0,
	generator = function()
	return {
		life = 8,
		size = 64, sizev = 0, sizea = 0,

		x = 0, xv = 0, xa = 0,
		y = 0, yv = 0, ya = 0,
		dir = 0, dirv = dirv, dira = 0,
		vel = 0, velv = 0, vela = 0,

		r = 1, rv = 0, ra = 0,
		g = 1, gv = 0, ga = 0,
		b = 1, bv = 0, ba = 0,
		a = 0.7, av = 0, aa = 0,
	}
end, },
function(self)
	if nb < 1 then
		self.ps:emit(1)
	end
	nb = nb + 1
end,
1, "particles_images/fireflash"

--------------------------------------------------------------------------------------
-- Default
--------------------------------------------------------------------------------------
else
	base_size = 32

return {
	base = 1000,

	angle = { 0, 360 }, anglev = { 2000, 4000 }, anglea = { 200, 600 },

	life = { 5, 10 },
	size = { 3, 6 }, sizev = {0, 0}, sizea = {0, 0},

	r = {200, 255}, rv = {0, 0}, ra = {0, 0},
	g = {120, 170}, gv = {0, 0}, ga = {0, 0},
	b = {0, 0}, bv = {0, 0}, ba = {0, 0},
	a = {255, 255}, av = {0, 0}, aa = {0, 0},

}, function(self)
	self.nb = (self.nb or 0) + 1
	if self.nb < 4 then
		self.ps:emit(100)
	end
end
end