LOCAL_PATH :=  $(call my-dir)/../

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_qcommon_exe

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

PROJECT_FILES := \
	qcommon/class.cpp \
	qcommon/con_set.cpp \
	qcommon/con_timer.cpp \
	qcommon/lightclass.cpp \
	qcommon/listener.cpp \
	qcommon/lz77.cpp \
	qcommon/mem_blockalloc.cpp \
	qcommon/mem_tempalloc.cpp \
	qcommon/script.cpp \
	qcommon/str.cpp \
	script/scriptexception.cpp \
	script/scriptvariable.cpp \
    qcommon/puff.c \
    qcommon/q_math.c \
    qcommon/q_shared.c \
    qcommon/alias.c \
    qcommon/bg_compat.cpp \
    qcommon/cm_fencemask.c \
    qcommon/cm_load.c \
    qcommon/cm_patch.c \
    qcommon/cm_polylib.c \
    qcommon/cm_terrain.c \
    qcommon/cm_test.c \
    qcommon/cm_trace.c \
    qcommon/cm_trace_lbd.cpp \
    qcommon/cm_trace_obfuscation.cpp \
    qcommon/cmd.c \
    qcommon/common.c \
    qcommon/crc.c \
    qcommon/cvar.c \
    qcommon/files.cpp \
    qcommon/ioapi.c \
    qcommon/huffman.cpp \
    qcommon/md4.c \
    qcommon/md5.c \
    qcommon/memory.c \
    qcommon/msg.cpp \
    qcommon/net_chan.c \
    qcommon/net_ip.c \
    qcommon/q_math.c \
    qcommon/q_shared.c \
    qcommon/unzip.c \


    #gamespy/sv_gamespy.c \
    #gamespy/sv_gqueryreporting.c \


LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES := mohaa_tiki

include $(BUILD_STATIC_LIBRARY)