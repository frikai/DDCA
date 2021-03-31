#output for the hex display
set_property PACKAGE_PIN W7 [get_ports {s[6]}]
set_property PACKAGE_PIN W6 [get_ports {s[5]}]
set_property PACKAGE_PIN U8 [get_ports {s[4]}]
set_property PACKAGE_PIN V8 [get_ports {s[3]}]
set_property PACKAGE_PIN U5 [get_ports {s[2]}]
set_property PACKAGE_PIN V5 [get_ports {s[1]}]
set_property PACKAGE_PIN U7 [get_ports {s[0]}]
set_property PACKAGE_PIN U16 [get_ports {s[7]}]

#input switches for the addition
set_property PACKAGE_PIN V17 [get_ports {a[0]}]
set_property PACKAGE_PIN V16 [get_ports {a[1]}]
set_property PACKAGE_PIN W16 [get_ports {a[2]}]
set_property PACKAGE_PIN W17 [get_ports {a[3]}]
set_property PACKAGE_PIN W15 [get_ports {b[0]}]
set_property PACKAGE_PIN V15 [get_ports {b[1]}]
set_property PACKAGE_PIN W14 [get_ports {b[2]}]
set_property PACKAGE_PIN W13 [get_ports {b[3]}]

#screen selector output
set_property PACKAGE_PIN U2 [get_ports {AN[0]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]

#switches for the screen selector input
set_property PACKAGE_PIN T1 [get_ports {c[0]}]
set_property PACKAGE_PIN R2 [get_ports {c[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {a b s c AN}]