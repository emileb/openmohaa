LOCAL_PATH :=  $(call my-dir)/../server

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_server

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

PROJECT_FILES := \
            sv_ccmds.c \
            sv_client.c \
            sv_game.c \
            sv_init.c \
            sv_main.c \
            sv_net_chan.c \
            sv_snapshot.c \
            sv_snd.c \
            sv_world.c \

LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

include $(BUILD_STATIC_LIBRARY)