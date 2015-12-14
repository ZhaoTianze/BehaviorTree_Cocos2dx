--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 11:39:40
--
local Sequence = class("Sequence",b3.Composite)

function Sequence:onTick(tick)
	for i=1,#self.children do
		local status = self.children[i]:execute(tick)
		if status ~= b3.Com.SUCCESS then
			return status
		end
	end
	return b3.Com.SUCCESS
end

return Sequence