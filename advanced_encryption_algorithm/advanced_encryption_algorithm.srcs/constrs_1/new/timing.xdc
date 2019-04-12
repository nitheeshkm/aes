create_clock -period 4.000 -name clk -waveform {0.000 2.000} -add [list [get_ports clk] [get_ports clk]]
