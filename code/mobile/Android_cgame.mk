LOCAL_PATH :=  $(call my-dir)/../cgame/

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_cgame

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS) -DCGAME_DLL
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES) \
                    $(LOCAL_PATH)/../script

PROJECT_FILES := \
        ../qcommon/class.cpp \
      	../qcommon/con_set.cpp \
      	../qcommon/con_timer.cpp \
      	../qcommon/listener.cpp \
      	../qcommon/lz77.cpp \
      	../qcommon/mem_blockalloc.cpp \
      	../qcommon/mem_tempalloc.cpp \
      	../qcommon/q_math.c \
      	../qcommon/q_shared.c \
      	../qcommon/script.cpp \
      	../qcommon/str.cpp \
      	../qcommon/lightclass.cpp \
      	../script/scriptexception.cpp \
      	../script/scriptvariable.cpp \
        ../fgame/bg_misc.cpp \
        ../fgame/bg_pmove.cpp \
        ../fgame/bg_slidemove.cpp \
        ../fgame/bg_voteoptions.cpp \


ALL_FILES := $(wildcard $(LOCAL_PATH)/*.c $(LOCAL_PATH)/*.cpp) # ALL files
ALL_FILES := $(ALL_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES := $(PROJECT_FILES) $(ALL_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES :=

include $(BUILD_SHARED_LIBRARY)