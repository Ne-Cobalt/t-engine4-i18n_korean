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

return {
	frag = "shield",
	vert = nil,
	args = {
		tex = { texture = 0 },
		mainfbo = { texture = 1 },
		color = color or {0.4, 0.7, 1.0},
		time_factor = time_factor or 4000,
		aadjust = aadjust or 10,
		impact = {0, 0},
		impact_tick = -1000,
		impact_color = {1.0, 0.3, 1.0},
		impact_time = 800,
		llpow = 2,
		ellipsoidalFactor = ellipsoidalFactor or 1.2, --1 is perfect circle, >1 is ellipsoidal
		oscillationSpeed = oscillationSpeed or 0.0, --oscillation between ellipsoidal and spherical form
		antialiasingRadius = antialiasingRadius or 0.98, --1.0 is no antialiasing, 0.0 - fully smoothed(looks worse)
		shieldIntensity = shieldIntensity or 0.15, --physically affects shield layer thickness
		wobblingPower = wobblingPower or 0.2,
		wobblingSpeed = wobblingSpeed or 0.02,
		horizontalScrollingSpeed = horizontalScrollingSpeed or 1.0,
		verticalScrollingSpeed = verticalScrollingSpeed or 0.3,
	},
	resetargs = {
		tick_start = function() return core.game.getFrameTime() end,
	},
	clone = false,
}
