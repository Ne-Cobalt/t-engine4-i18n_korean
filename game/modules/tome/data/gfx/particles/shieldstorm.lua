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

return { generator = function()
	local ad = rng.range(0, 360)
	local a = math.rad(ad)
	local dir = math.rad(ad + 90)
	local r = rng.avg(1, 40 * radius)
	local dirv = math.rad(5)

	return {
		trail = 1,
		life = 20,
		size = rng.range(12, 18), sizev = -0.1, sizea = 0,

		x = r * math.cos(a), xv = 0, xa = 0,
		y = r * math.sin(a), yv = 0, ya = 0,
		dir = dir, dirv = dirv, dira = 0,
		vel = 10, velv = 0, vela = 0,

		r = rng.range(200, 230)/255,  rv = 0, ra = 0,
		g = rng.range(200, 230)/255,      gv = 0, ga = 0,
		b = rng.range(200, 230)/255,      bv = 0, ba = 0,
		a = rng.range(200, 255)/255,   av = 0, aa = 0,
	}
end, },
function(self)
	if nb < 6 then
		self.ps:emit(20)
		nb = nb + 1
	end
end,
200,
"shockbolt/object/shield_voratun"
