--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 12:06:42
--
local Priority = class("Priority",b3.Composite)

function Priority:onTick(tick)
	for i=1,#self.children do
		local status = self.children[i]:execute(tick)
		if status ~= b3.Com.FAILURE then
			return status
		end
	end
	return b3.Com.FAILURE
end

return Priority