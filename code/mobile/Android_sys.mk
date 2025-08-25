LOCAL_PATH :=  $(call my-dir)/../sys

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_syslib

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

PROJECT_FILES := \
                con_log.c \
                sys_autoupdater.c \
                sys_main.c \
                new/sys_main_new.c \
                new/sys_unix_new.c \
                con_tty.c \
                sys_unix.c \
                win_bounds.cpp \
                win_localization.cpp \


LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

include $(BUILD_STATIC_LIBRARY)