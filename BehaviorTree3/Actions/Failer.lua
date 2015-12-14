--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 16:56:21
--
local Failer = class("Failer",b3.Action)

function Failer:onTick(tick)
	return b3.Com.FAILURE
end

return Failer