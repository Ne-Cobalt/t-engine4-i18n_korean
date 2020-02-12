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

return { generator = function()
	local life = rng.range(10, 20)
	local size = rng.range(15, 20)
	local angle = math.rad(rng.range(0, 360))
	local distance = engine.Map.tile_w * rng.float(2, 2.5)
	local vel = distance / life

	return {
		trail = 1,
		life = life,
		size = size, sizev = 0.2, sizea = 0,

		x = -size / 2 + distance * math.cos(angle), xv = 0, xa = 0,
		y = -size / 2 + distance * math.sin(angle), yv = 0, ya = 0,
		dir = angle, dirv = 0, dira = 0,
		vel = -vel, velv = 0, vela = 0,

		r = rng.range(rm, rM)/255, 		rv = 0, ra = 0,
		g = rng.range(gm, gM)/255,		gv = 0, ga = 0,
		b = rng.range(bm, bM)/255,		bv = 0, ba = 0,
		a = rng.range(am, aM)/255, 		av = 0.01, aa = 0,
	}
end, },
function(self)
	self.nb = (self.nb or 0) + 1
	if self.nb < 6 then
		self.ps:emit(10)
	end
end,
120
