--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 19:21:57
--
local Inverter = class("Inverter",b3.Decorator)

function Inverter:onTick(tick)
	if not self.child then
		return b3.Com.ERROR
	end

	local status = self.child:execute(tick)

	if status == b3.Com.SUCCESS then
		status = b3.Com.FAILURE
	elseif status == b3.Com.FAILURE then
		status = b3.Com.SUCCESS
	end

	return status
end

return Inverter