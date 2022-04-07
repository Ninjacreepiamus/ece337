#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Apr  7 08:47:20 2022                
#                                                     
#######################################################

#@(#)CDS: Innovus v16.12-s051_1 (64bit) 08/17/2016 12:18 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 16.12-s051_1 NR160816-1350/16_12-UB (database version 2.30, 347.6.1) {superthreading v1.30}
#@(#)CDS: AAE 16.12-s026 (64bit) 08/17/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 16.12-s023_1 () Aug 12 2016 01:35:46 ( )
#@(#)CDS: SYNTECH 16.12-s009_1 () Aug 11 2016 01:33:09 ( )
#@(#)CDS: CPE v16.12-s054
#@(#)CDS: IQRC/TQRC 15.2.4-s467 (64bit) Wed Jul 20 17:12:38 PDT 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set conf_qxconf_file NULL
set conf_qxlib_file NULL
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set floorplan_default_site core
set fpIsMaxIoHeight 0
set init_gnd_net gnd
set init_io_file innovus.io
set init_lef_file {/package/eda/cells/OSU/v2.7/cadence/lib/ami05/lib/osu05_stdcells.lef /package/eda/cells/OSU/v2.7/cadence/lib/ami05/lib/osu05_stdcells.stacks.lef}
set init_mmmc_file osu05_MMMC.view
set init_oa_search_lib {}
set init_pwr_net vdd
set init_verilog mapped/layout_lab_design.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set timing_library_ccs_noise_vin_clip_points {}
set timing_library_ccs_noise_vout_clip_points {}
set timing_library_load_pin_cap_indices {}
set timing_library_write_library_to_directory {}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design
floorPlan -r 1.0 0.6 50 50 50 50
unfixAllIos
legalizePin
addRing -spacing_bottom 9.9 -width_left 9.9 -width_bottom 9.9 -width_top 9.9 -spacing_top 9.9 -layer_bottom metal1 -width_right 9.9 -around default_power_domain -center 1 -layer_top metal1 -spacing_right 9.9 -spacing_left 9.9 -layer_right metal2 -layer_left metal2 -offset 9.9 -nets { gnd vdd }
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM1Cont -isVisible 1
setLayerPreference allM1Cont -isSelectable 0
setLayerPreference allM1Cont -isSelectable 1
setLayerPreference term -isVisible 0
setLayerPreference violation -isVisible 0
setLayerPreference busguide -isVisible 0
setLayerPreference aggress -isVisible 0
setLayerPreference text -isVisible 0
setLayerPreference pinText -isVisible 0
setLayerPreference flightLine -isVisible 0
setLayerPreference portNum -isVisible 0
setLayerPreference dpt -isVisible 0
setLayerPreference term -isVisible 1
setLayerPreference violation -isVisible 1
setLayerPreference busguide -isVisible 1
setLayerPreference aggress -isVisible 1
setLayerPreference text -isVisible 1
setLayerPreference pinText -isVisible 1
setLayerPreference flightLine -isVisible 1
setLayerPreference portNum -isVisible 1
setLayerPreference dpt -isVisible 1
setLayerPreference bump -isVisible 0
setLayerPreference bumpBack -isVisible 0
setLayerPreference bumpConnect -isVisible 0
setLayerPreference bump -isVisible 1
setLayerPreference bumpBack -isVisible 1
setLayerPreference bumpConnect -isVisible 1
setLayerPreference blackBox -isVisible 0
setLayerPreference blackBox -isVisible 1
setLayerPreference areaIo -isVisible 0
setLayerPreference areaIo -isVisible 1
setLayerPreference io -isVisible 0
setLayerPreference io -isVisible 1
setLayerPreference phyCell -isVisible 0
setLayerPreference phyCell -isVisible 1
setLayerPreference coverCell -isVisible 0
setLayerPreference coverCell -isVisible 1
setLayerPreference stdCell -isVisible 0
setLayerPreference stdCell -isVisible 1
setLayerPreference block -isVisible 0
setLayerPreference block -isVisible 1
setLayerPreference inst -isVisible 0
setLayerPreference inst -isVisible 1
setLayerPreference instanceCell -isVisible 0
setLayerPreference inst -isVisible 0
setLayerPreference block -isVisible 0
setLayerPreference stdCell -isVisible 0
setLayerPreference coverCell -isVisible 0
setLayerPreference phyCell -isVisible 0
setLayerPreference io -isVisible 0
setLayerPreference areaIo -isVisible 0
setLayerPreference blackBox -isVisible 0
setLayerPreference instanceCell -isVisible 1
setLayerPreference inst -isVisible 1
setLayerPreference block -isVisible 1
setLayerPreference stdCell -isVisible 1
setLayerPreference coverCell -isVisible 1
setLayerPreference phyCell -isVisible 1
setLayerPreference io -isVisible 1
setLayerPreference areaIo -isVisible 1
setLayerPreference blackBox -isVisible 1
setLayerPreference hinst -isVisible 0
setLayerPreference guide -isVisible 0
setLayerPreference fence -isVisible 0
setLayerPreference region -isVisible 0
setLayerPreference partition -isVisible 0
setLayerPreference hinst -isVisible 1
setLayerPreference guide -isVisible 1
setLayerPreference fence -isVisible 1
setLayerPreference region -isVisible 1
setLayerPreference partition -isVisible 1
setLayerPreference obstruct -isVisible 0
setLayerPreference screen -isVisible 0
setLayerPreference macroOnly -isVisible 0
setLayerPreference layerBlk -isVisible 0
setLayerPreference fillBlk -isVisible 0
setLayerPreference trimBlk -isVisible 0
setLayerPreference blockHalo -isVisible 0
setLayerPreference routingHalo -isVisible 0
setLayerPreference blkLink -isVisible 0
setLayerPreference obstruct -isVisible 1
setLayerPreference screen -isVisible 1
setLayerPreference macroOnly -isVisible 1
setLayerPreference layerBlk -isVisible 1
setLayerPreference fillBlk -isVisible 1
setLayerPreference trimBlk -isVisible 1
setLayerPreference blockHalo -isVisible 1
setLayerPreference routingHalo -isVisible 1
setLayerPreference blkLink -isVisible 1
setLayerPreference stdRow -isVisible 0
setLayerPreference ioRow -isVisible 0
setLayerPreference sitePattern -isVisible 0
setLayerPreference macroSitePattern -isVisible 0
setLayerPreference stdRow -isVisible 1
setLayerPreference ioRow -isVisible 1
setLayerPreference sitePattern -isVisible 1
setLayerPreference macroSitePattern -isVisible 1
setLayerPreference relFPlan -isVisible 0
setLayerPreference sdpGroup -isVisible 0
setLayerPreference sdpConnect -isVisible 0
setLayerPreference sizeBlkg -isVisible 0
setLayerPreference resizeFPLine1 -isVisible 0
setLayerPreference resizeFPLine2 -isVisible 0
setLayerPreference congTag -isVisible 0
setLayerPreference ioSlot -isVisible 0
setLayerPreference overlapMacro -isVisible 0
setLayerPreference overlapGuide -isVisible 0
setLayerPreference overlapBlk -isVisible 0
setLayerPreference datapath -isVisible 0
setLayerPreference relFPlan -isVisible 1
setLayerPreference sdpGroup -isVisible 1
setLayerPreference sdpConnect -isVisible 1
setLayerPreference sizeBlkg -isVisible 1
setLayerPreference resizeFPLine1 -isVisible 1
setLayerPreference resizeFPLine2 -isVisible 1
setLayerPreference congTag -isVisible 1
setLayerPreference ioSlot -isVisible 1
setLayerPreference overlapMacro -isVisible 1
setLayerPreference overlapGuide -isVisible 1
setLayerPreference overlapBlk -isVisible 1
setLayerPreference datapath -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference obsblock -isVisible 1
setLayerPreference obsstdCell -isVisible 1
setLayerPreference obsio -isVisible 1
setLayerPreference obsother -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference obsblock -isVisible 0
setLayerPreference obsstdCell -isVisible 0
setLayerPreference obsio -isVisible 0
setLayerPreference obsother -isVisible 0
setLayerPreference layoutObj -isVisible 0
setLayerPreference routeGuide -isVisible 0
setLayerPreference ptnPinBlk -isVisible 0
setLayerPreference ptnFeed -isVisible 0
setLayerPreference routeGuide -isVisible 1
setLayerPreference ptnPinBlk -isVisible 1
setLayerPreference ptnFeed -isVisible 1
setLayerPreference pwrdm -isVisible 0
setLayerPreference netRect -isVisible 0
setLayerPreference substrateNoise -isVisible 0
setLayerPreference powerNet -isVisible 0
setLayerPreference pwrdm -isVisible 1
setLayerPreference netRect -isVisible 1
setLayerPreference substrateNoise -isVisible 1
setLayerPreference powerNet -isVisible 1
setLayerPreference net -isVisible 0
setLayerPreference power -isVisible 0
setLayerPreference pgPower -isVisible 0
setLayerPreference pgGround -isVisible 0
setLayerPreference shield -isVisible 0
setLayerPreference unknowState -isVisible 0
setLayerPreference metalFill -isVisible 0
setLayerPreference clock -isVisible 0
setLayerPreference whatIfShape -isVisible 0
setLayerPreference net -isVisible 1
setLayerPreference power -isVisible 1
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 1
setLayerPreference shield -isVisible 1
setLayerPreference unknowState -isVisible 1
setLayerPreference metalFill -isVisible 1
setLayerPreference clock -isVisible 1
setLayerPreference whatIfShape -isVisible 1
setPlaceMode -congEffort medium
placeDesign -inPlaceOpt
checkPlace
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference obsblock -isVisible 1
setLayerPreference obsstdCell -isVisible 1
setLayerPreference obsio -isVisible 1
setLayerPreference obsother -isVisible 1
setLayerPreference layoutObj -isVisible 1
gui_select -rect {1718.639 648.139 1824.931 557.437}
gui_select -rect {2060.189 605.623 2152.308 646.722}
gui_select -rect {1829.182 619.795 1958.149 499.331}
uiSetTool select
gui_select -rect {1680.375 984.020 1693.130 975.516}
gui_select -rect {-33.245 1040.365 -15.591 977.596}
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference obsblock -isVisible 0
setLayerPreference obsstdCell -isVisible 0
setLayerPreference obsio -isVisible 0
setLayerPreference obsother -isVisible 0
setLayerPreference layoutObj -isVisible 0
sroute
trialRoute
timeDesign -preCTS
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -preCTS -drv
trialRoute
timeDesign -postCTS
setExtractRCMode -assumeMetFill
extractRC -outfile encounter.cap
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -postCTS -hold
optDesign -postCTS -drv
all_hold_analysis_views
all_setup_analysis_views
getPlaceMode -doneQuickCTS -quiet
addFiller -cell FILL
globalNetConnect vdd -type tiehi
globalNetConnect vdd -type pgpin -pin vdd -all -override
globalNetConnect gnd -type tielo
globalNetConnect gnd -type pgpin -pin gnd -all -override
sroute
globalDetailRoute
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference obsblock -isVisible 1
setLayerPreference obsstdCell -isVisible 1
setLayerPreference obsio -isVisible 1
setLayerPreference obsother -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference obsblock -isVisible 0
setLayerPreference obsstdCell -isVisible 0
setLayerPreference obsio -isVisible 0
setLayerPreference obsother -isVisible 0
setLayerPreference layoutObj -isVisible 0
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference obsblock -isVisible 1
setLayerPreference obsstdCell -isVisible 1
setLayerPreference obsio -isVisible 1
setLayerPreference obsother -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference obsblock -isVisible 0
setLayerPreference obsstdCell -isVisible 0
setLayerPreference obsio -isVisible 0
setLayerPreference obsother -isVisible 0
setLayerPreference layoutObj -isVisible 0
setLayerPreference stdRow -isVisible 0
setLayerPreference ioRow -isVisible 0
setLayerPreference sitePattern -isVisible 0
setLayerPreference macroSitePattern -isVisible 0
setLayerPreference stdRow -isVisible 1
setLayerPreference ioRow -isVisible 1
setLayerPreference sitePattern -isVisible 1
setLayerPreference macroSitePattern -isVisible 1
setLayerPreference stdRow -isVisible 0
setLayerPreference ioRow -isVisible 0
setLayerPreference sitePattern -isVisible 0
setLayerPreference macroSitePattern -isVisible 0
setLayerPreference stdRow -isVisible 1
setLayerPreference ioRow -isVisible 1
setLayerPreference sitePattern -isVisible 1
setLayerPreference macroSitePattern -isVisible 1
setLayerPreference stdRow -isVisible 0
setLayerPreference ioRow -isVisible 0
setLayerPreference sitePattern -isVisible 0
setLayerPreference macroSitePattern -isVisible 0
setLayerPreference stdRow -isVisible 1
setLayerPreference ioRow -isVisible 1
setLayerPreference sitePattern -isVisible 1
setLayerPreference macroSitePattern -isVisible 1
setLayerPreference routeGuide -isVisible 0
setLayerPreference ptnPinBlk -isVisible 0
setLayerPreference ptnFeed -isVisible 0
setLayerPreference routeGuide -isVisible 1
setLayerPreference ptnPinBlk -isVisible 1
setLayerPreference ptnFeed -isVisible 1
setLayerPreference pwrdm -isVisible 0
setLayerPreference netRect -isVisible 0
setLayerPreference substrateNoise -isVisible 0
setLayerPreference powerNet -isVisible 0
setLayerPreference pwrdm -isVisible 1
setLayerPreference netRect -isVisible 1
setLayerPreference substrateNoise -isVisible 1
setLayerPreference powerNet -isVisible 1
setLayerPreference allM0 -isVisible 0
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM1 -isVisible 0
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3 -isVisible 0
setLayerPreference allM0 -isVisible 1
setLayerPreference allM1Cont -isVisible 1
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3 -isVisible 1
setLayerPreference allM0 -isVisible 0
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM1 -isVisible 0
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3 -isVisible 0
setLayerPreference allM0 -isVisible 1
setLayerPreference allM1Cont -isVisible 1
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3 -isVisible 1
setExtractRCMode -engine postRoute -effortLevel low -reduce 0.0
extractRC
setAnalysisMode -analysisType onChipVariation
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
setOptMode -usefulSkew false
optDesign -postRoute -incr
addFiller -cell FILL -prefix FIL -fillBoundary
ecoRoute
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix layout_lab_design_postRoute -outDir timingReports
get_time_unit
report_timing -machine_readable -max_points 10000 -max_slack 0.75 -path_exceptions all > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
uiKit::addWidget .dodo -type main
uiKit::addWidget gtd@frameOnly_detail -type main
uiKit::addWidget sgnviewer_tdg_frame -type main -closecmd {::sgn::quitApply sgnviewer_tdg_frame}
uiKit::addWidget sgnviewer_tdg_frame.ib -type statusbar -in sgnviewer_tdg_frame
uiKit::addWidget sgnviewer_tdg_frame.msg -type message -variable ::csv::infoMsg(sgnviewer_tdg_frame) -stretch 1
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U71
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n4
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U56
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U71
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U71
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n40
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/FE_OFC8_n29
zoomSelected
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/FE_OFN8_n29
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U234
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n222
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n4
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U56
zoomSelected
editSelect -net I0/LD/T_FIFO/IP_FIFO/UFIFORAM/n114
zoomSelected
