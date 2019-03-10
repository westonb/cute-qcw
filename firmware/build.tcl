
# filename: build.tcl

set BUILD_DATE [ clock format [ clock seconds ] -format %m%d%Y ]
set BUILD_TIME [ clock format [ clock seconds ] -format %H%M%S ]

#######################################################################################
# User Settings
#######################################################################################

# global settings
set PROJ_NM "build"
set PROJ_DIR "./$PROJ_NM"
set PART_NM "xc7s25ftgb196-1"

# synthesis related settings
set SYNTH_ARGS ""
#append SYNTH_ARGS " " -flatten_hierarchy " " rebuilt " "
#append SYNTH_ARGS " " -gated_clock_conversion " " off " "
#append SYNTH_ARGS " " -bufg " {" 12 "} "
#append SYNTH_ARGS " " -fanout_limit " {" 10000 "} "
#append SYNTH_ARGS " " -directive " " Default " "
#append SYNTH_ARGS " " -fsm_extraction " " auto " "
#append SYNTH_ARGS " " -keep_equivalent_registers " "
#append SYNTH_ARGS " " -resource_sharing " " auto " "
#append SYNTH_ARGS " " -control_set_opt_threshold " " auto " "
#append SYNTH_ARGS " " -no_lc " "
#append SYNTH_ARGS " " -shreg_min_size " {" 3 "} "
#append SYNTH_ARGS " " -shreg_min_size " {" 5 "} "
#append SYNTH_ARGS " " -max_bram " {" -1 "} "
#append SYNTH_ARGS " " -max_dsp " {" -1 "} "
#append SYNTH_ARGS " " -cascade_dsp " " auto " "
#append SYNTH_ARGS " " -verbose

set DEFINES ""
append DEFINES -verilog_define " " USE_DEBUG " "

set TOP_MODULE "controller_top"

#######################################################################################
# Build Design
#######################################################################################

# Create project
create_project -force $PROJ_NM $PROJ_DIR

# read all design files and constraints
read_verilog [glob ./rtl/*.v]
add_files {src/firmware.hex}
read_xdc {const/pins.xdc const/clocks.xdc}

# Synthesize Design
eval "synth_design $DEFINES $SYNTH_ARGS -top $TOP_MODULE -part $PART_NM"
report_timing_summary -file $PROJ_DIR/${PROJ_NM}_post_synth_tim.rpt
report_utilization -file $PROJ_DIR/${PROJ_NM}_post_synth_util.rpt
write_checkpoint -force $PROJ_DIR/${PROJ_NM}_post_synth.dcp

# Opt Design
opt_design -directive Explore
report_timing_summary -file $PROJ_DIR/${PROJ_NM}_post_opt_tim.rpt
report_utilization -file $PROJ_DIR/${PROJ_NM}_post_opt_util.rpt
write_checkpoint -force $PROJ_DIR/${PROJ_NM}_post_opt.dcp
# Upgrade DSP connection warnings (like "Invalid PCIN Connection for OPMODE value") to
# an error because this is an error post route
set_property SEVERITY {ERROR} [get_drc_checks DSPS-*]
# Run DRC on opt design to catch early issues like comb loops
report_drc -file $PROJ_DIR/${PROJ_NM}_post_opt_drc.rpt

# Place Design
place_design 
report_timing_summary -file $PROJ_DIR/${PROJ_NM}_post_place_tim.rpt
report_utilization -file $PROJ_DIR/${PROJ_NM}_post_place_util.rpt
write_checkpoint -force $PROJ_DIR/${PROJ_NM}_post_place.dcp

# Post Place Phys Opt
phys_opt_design -directive AggressiveExplore
report_timing_summary -file $PROJ_DIR/${PROJ_NM}_post_place_physopt_tim.rpt
report_utilization -file $PROJ_DIR/${PROJ_NM}_post_place_physopt_util.rpt
write_checkpoint -force $PROJ_DIR/${PROJ_NM}_post_place_physopt.dcp

# Route Design
route_design -directive Explore
report_timing_summary -file $PROJ_DIR/${PROJ_NM}_post_route_tim.rpt
report_utilization -hierarchical -file $PROJ_DIR/${PROJ_NM}_post_route_util.rpt
report_route_status -file $PROJ_DIR/${PROJ_NM}_post_route_status.rpt
report_io -file $PROJ_DIR/${PROJ_NM}_post_route_io.rpt
report_power -file $PROJ_DIR/${PROJ_NM}_post_route_power.rpt
report_design_analysis -logic_level_distribution \
 -of_timing_paths [get_timing_paths -max_paths 10000 \
 -slack_lesser_than 0] \
 -file $PROJ_DIR/${PROJ_NM}_post_route_vios.rpt
write_checkpoint -force $PROJ_DIR/${PROJ_NM}_post_route.dcp

set WNS [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
puts "Post Route WNS = $WNS"

# Write out bitfile
write_debug_probes -force $PROJ_DIR/${PROJ_NM}_${BUILD_DATE}_${BUILD_TIME}_${WNS}ns.ltx
#write_bitstream -force $PROJ_DIR/${PROJ_NM}_${BUILD_DATE}_${BUILD_TIME}_${WNS}ns.bit -bin_file
write_bitstream -force bitstream.bit -bin_file

quit
