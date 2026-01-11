LOCAL_PATH :=  $(call my-dir)

SYSTEM_SOURCES = \
	../corepp/class.cpp \
	../corepp/con_set.cpp \
	../corepp/con_timer.cpp \
	../corepp/delegate.cpp \
	../corepp/lightclass.cpp \
	../corepp/listener.cpp \
	../corepp/lz77.cpp \
	../corepp/mem_blockalloc.cpp \
	../corepp/mem_tempalloc.cpp \
	../corepp/script.cpp \
	../corepp/str.cpp \
#	../script/scriptexception.cpp \
	../script/scriptvariable.cpp \


include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_client.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_qcommon.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_qcommon_exe.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_sdl.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_tiki.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_sys.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_server.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_skeletor.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_refgl1.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_cgame.mk
include $(TOP_DIR)/Alpha/openmohaa_dev/code/mobile/Android_fgame.mk
