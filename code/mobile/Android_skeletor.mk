LOCAL_PATH :=  $(call my-dir)/../skeletor

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_skeletor

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

# All C files
ALL_FILES := $(wildcard $(LOCAL_PATH)/*.c $(LOCAL_PATH)/*.cpp) # ALL files

# Set
PROJECT_FILES := $(ALL_FILES)

# Fix paths
PROJECT_FILES := $(PROJECT_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

include $(BUILD_STATIC_LIBRARY)