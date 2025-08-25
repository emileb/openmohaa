LOCAL_PATH :=  $(call my-dir)/../

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_qcommon

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


LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES :=

include $(BUILD_STATIC_LIBRARY)