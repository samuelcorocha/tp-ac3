transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {/opt/intelFPGA_lite/22.1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {/opt/intelFPGA_lite/22.1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {/opt/intelFPGA_lite/22.1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {/opt/intelFPGA_lite/22.1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {/opt/intelFPGA_lite/22.1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/maxv_ver
vmap maxv_ver ./verilog_libs/maxv_ver
vlog -vlog01compat -work maxv_ver {/opt/intelFPGA_lite/22.1/quartus/eda/sim_lib/maxv_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/adder.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/registers.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/alu.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/data_memory.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/zero_extend.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/mux.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/signal_extend.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/mux_selector_write.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/control_unit.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/alu_control.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/jr.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/fowarding.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/mux_3_32.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/stall_unit.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/flush_unit.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/wb_forwarding.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/mips.v}
vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/modules {/home/marcus/projetos/Verilog/MIPS 2/modules/instruction_memory.v}

vlog -vlog01compat -work work +incdir+/home/marcus/projetos/Verilog/MIPS\ 2/tests {/home/marcus/projetos/Verilog/MIPS 2/tests/MIPS_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  MIPS_TB

add wave *
view structure
view signals
run -all
