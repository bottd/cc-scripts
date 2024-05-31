local broadcast_host_name = "day_night"
local broadcast_protocol = "service"
peripheral.find("modem", rednet.open)
rednet.host(broadcast_protocol, broadcast_host_name)
local is_day = true
local function build_message()
  if (is_day == true) then
    return "day"
  else
    return "night"
  end
end
while true do
  local event = {os.pullEvent()}
  if ((_G.type(event) == "table") and (event[1] == "rednet_message")) then
    local _3_
    do
      local t_2_ = event
      if (nil ~= t_2_) then
        t_2_ = t_2_[4]
      else
      end
      _3_ = t_2_
    end
    if (_3_ ~= "dns") then
      rednet.send(event[2], build_message())
    else
    end
  elseif ((_G.type(event) == "table") and (event[1] == "Redstone change")) then
    if (is_day ~= redstone.getInput("top")) then
      is_day = not is_day
      rednet.broadcast(build_message(), broadcast_protocol)
    else
    end
  else
  end
end
return nil
