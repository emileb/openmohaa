LOCAL_PATH :=  $(call my-dir)/../fgame/

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_game

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS) -DGAME_DLL -DWITH_SCRIPT_ENGINE -DARCHIVE_SUPPORTED
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES) \
                    $(LOCAL_PATH)/../script \
                    $(LOCAL_PATH)/../thirdparty/recastnavigation/DetourCrowd/Include \
                    $(LOCAL_PATH)/../thirdparty/recastnavigation/Detour/Include \
                    $(LOCAL_PATH)/../thirdparty/recastnavigation/Recast/Include \


PROJECT_FILES := \
        ../parser/parsetree.cpp \
        ../qcommon/class.cpp \
        ../qcommon/con_set.cpp \
        ../qcommon/con_timer.cpp \
        ../qcommon/listener.cpp \
        ../qcommon/lightclass.cpp \
        ../qcommon/lz77.cpp \
        ../qcommon/mem_blockalloc.cpp \
        ../qcommon/mem_tempalloc.cpp \
        ../qcommon/q_math.c \
        ../qcommon/q_shared.c \
        ../qcommon/script.cpp \
        ../qcommon/str.cpp \
        ../qcommon/delegate.cpp \


ALL_FILES := $(wildcard $(LOCAL_PATH)/*.c $(LOCAL_PATH)/*.cpp)
ALL_FILES += $(wildcard $(LOCAL_PATH)/../script/*.c*)
ALL_FILES += $(wildcard $(LOCAL_PATH)/../parser/generated/*.c*)
ALL_FILES += $(wildcard $(LOCAL_PATH)/../thirdparty/recastnavigation/DetourCrowd/Source/*.c*)
ALL_FILES += $(wildcard $(LOCAL_PATH)/../thirdparty/recastnavigation/Detour/Source/*.c*)
ALL_FILES += $(wildcard $(LOCAL_PATH)/../thirdparty/recastnavigation/Recast/Source/*.c*)


ALL_FILES := $(ALL_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES := $(PROJECT_FILES) $(ALL_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES := 

include $(BUILD_SHARED_LIBRARY)