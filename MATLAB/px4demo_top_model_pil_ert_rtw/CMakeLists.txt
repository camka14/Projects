## This cmakelist.txt file was generated from
## the UAVToolbox Support Package for PX4 Autopilots

add_definitions(
-DMODEL=px4demo_top_model_pil -DNUMST=1 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0 -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTID01EQ=0 -DTERMFCN=0 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=0 -DPX4 -DFMUv5 -DNULL=0 -DMW_PX4_NUTTX_BUILD -DEXTMODE_DISABLETESTING -DEXTMODE_DISABLEPRINTF -DEXTMODE_DISABLE_ARGS_PROCESSING=1 -DDAEMON_MODE=1 -DMW_STANDALONE_EXECUTION_PROFILER_ON -DSTACK_SIZE=64 -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__ -DRT -DMW_PX4_DISABLE_MAVLINK=1 )

px4_add_module(
    MODULE modules__px4_simulink_app
    MAIN px4_simulink_app
    STACK_MAIN 2000
SRCS
   ert_main.cpp
   px4demo_top_model_pil.cpp
   px4demo_top_model_pil_data.cpp
   MW_PX4_TaskControl.cpp
   nuttxinitialize.cpp
   MW_custom_RTOS_header.h
   px4demo_top_model_pil.h
   px4demo_top_model_pil_private.h
   px4demo_top_model_pil_types.h
   rtmodel.h
   MW_uORB_busstruct_conversion.h
   rtw_continuous.h
   rtw_solver.h
   MW_PX4_TaskControl.h
   nuttxinitialize.h
   MW_target_hardware_resources.h
   rtwtypes.h
    COMPILE_FLAGS
       -fpermissive
       -Wno-narrowing
    INCLUDES
       ${PX4_SOURCE_DIR}/src/modules/px4_simulink_app
       ${PX4_SOURCE_DIR}/src/modules/mavlink
       ${PX4_SOURCE_DIR}/mavlink/include/mavlink
)

get_target_property(PX4_SL_APP_COMPILE_FLAGS modules__px4_simulink_app COMPILE_OPTIONS)
list(REMOVE_ITEM PX4_SL_APP_COMPILE_FLAGS -Werror)
set_target_properties(modules__px4_simulink_app PROPERTIES COMPILE_OPTIONS "${PX4_SL_APP_COMPILE_FLAGS}")

