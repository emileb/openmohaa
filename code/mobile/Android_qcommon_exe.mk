LOCAL_PATH :=  $(call my-dir)/../qcommon

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_qcommon_exe_dev

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

PROJECT_FILES := \
    $(SYSTEM_SOURCES) \
    	../script/scriptexception.cpp \
    	../script/scriptvariable.cpp \
    q_math.c \
    q_shared.c \
    alias.c \
    bg_compat.cpp \
    cm_fencemask.c \
    cm_load.c \
    cm_patch.c \
    cm_polylib.c \
    cm_terrain.c \
    cm_test.c \
    cm_trace.c \
    cm_trace_lbd.cpp \
    cm_trace_obfuscation.cpp \
    cmd.c \
    common.c \
    crc.c \
    cvar.c \
    files.cpp \
    ioapi.c \
    huffman.cpp \
    md4.c \
    md5.c \
    memory.c \
    msg.cpp \
    net_chan.c \
    net_ip.c \
    q_math.c \
    q_shared.c \
    unzip.c \


    #gamespy/sv_gamespy.c \
    #gamespy/sv_gqueryreporting.c \


LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES := mohaa_tiki_dev

include $(BUILD_STATIC_LIBRARY)