--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-02 14:11:53
--
local B3Com = {}
local uuid = import(".uuid")
assert(uuid,"uuid is nil")
B3Com.Version = '0.1.0'

B3Com.Default_Weight = 10

-- Returning status
B3Com.SUCCESS   = 1
B3Com.FAILURE   = 2
B3Com.RUNNING   = 3
B3Com.ERROR     = 4

--Node categories
B3Com.COMPOSITE = 'composite'
B3Com.DECORATOR = 'decorator'
B3Com.ACTION    = 'action';
B3Com.CONDITION = 'condition'

--[[This function is used to create unique IDs for trees and nodes.

(consult http://www.ietf.org/rfc/rfc4122.txt).

@class createUUID
@constructor
@return {String} A unique ID.]]

function B3Com.createUUID()
	return uuid.new()
end

return B3Com