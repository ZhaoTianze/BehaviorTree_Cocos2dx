--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 16:54:06
--
local Error = class("Error",b3.Action)

function Error:onTick(tick)
	return b3.Com.ERROR
end

return Error