LOCAL_PATH :=  $(call my-dir)/../renderergl1

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_refgl1_dev

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES) \
                     $(LOCAL_PATH)/../thirdparty/jpeg-9f/ \


# All C files
ALL_FILES := $(wildcard $(LOCAL_PATH)/*.c $(LOCAL_PATH)/*.cpp) # ALL files

ALL_FILES += $(wildcard $(LOCAL_PATH)/../thirdparty/jpeg-9f/*.c) #
ALL_FILES += $(wildcard $(LOCAL_PATH)/../renderercommon/*.c) #


# Set
PROJECT_FILES := $(ALL_FILES)

# Fix paths
PROJECT_FILES := $(PROJECT_FILES:$(LOCAL_PATH)/%=%)

PROJECT_FILES := $(filter-out ../renderercommon/tr_subs.c , $(PROJECT_FILES))

LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog
LOCAL_STATIC_LIBRARIES :=  mohaa_tiki_dev

include $(BUILD_STATIC_LIBRARY)