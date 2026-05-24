------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
  output = "DP-1",
  mode = "1920x1800@180",
  position = "0x0",
  scale = 1
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1680x1050@59.95",
  position = "-1600x0",
  scale = 1
})

hl.monitor({
  output   = "DVI-D-1",
  mode     = "1920x180@180",
  position = "1920x0",
  scale    = 1,
})
