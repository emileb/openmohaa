LOCAL_PATH :=  $(call my-dir)/../sdl/

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_sdl

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

PROJECT_FILES := \
        sdl_input.c \
        sdl_gamma.c \
        sdl_glimp.c \

LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES := mohaa_qcommon_exe

include $(BUILD_STATIC_LIBRARY)