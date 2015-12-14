--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 16:58:31
--
local Succeeder = class("Succeeder",b3.Action)

function Succeeder:onTick(tick)
	return b3.Com.SUCCESS
end

return Succeeder