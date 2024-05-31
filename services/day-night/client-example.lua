peripheral.find("modem", rednet.open)
local day_night_id = rednet.lookup("service", "day_night")
rednet.send(day_night_id)
local _local_1_ = rednet.receive()
local id = _local_1_[1]
local message = _local_1_[2]
return print(message)
