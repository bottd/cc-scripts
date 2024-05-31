; read redstone status from block above
; this will be a day/night sensor
; then broadcast "day" or "night" based on status of sensor

(local broadcast_host_name :day_night)
(local broadcast_protocol :service)
(peripheral.find :modem rednet.open)
(rednet.host broadcast_protocol broadcast_host_name)

(var is_day true)
(fn build_message []
  (if (= is_day true)
      :day
      :night))

(while true
  (local event [(os.pullEvent)])
  (case event
    [:rednet_message] (when (not= (?. event 4) :dns) 
                        (rednet.send (. event 2) (build_message)))
    ["Redstone change"] (when (not= is_day (redstone.getInput :top))
      (set is_day (not is_day))
      (rednet.broadcast (build_message) broadcast_protocol))))
