--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 15:04:56
--
local Action = class("Action",b3.BaseNode)

function Action:onCreate(properties)
	self.category = b3.Com.ACTION
end

return Action