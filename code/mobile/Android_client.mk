MOHAA_LOCAL_PATH:= $(call my-dir)/../client

LOCAL_PATH := $(MOHAA_LOCAL_PATH)

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_dev

MOHAA_LOCAL_CFLAGS := -O2 -g -DAPP_MODULE -DUSE_CODEC_MP3 -DMOHAA -DENGINE_NAME=\"openmohaa\" -Werror=return-type -Wno-pointer-bool-conversion -fsigned-char -fexceptions


MOHAA_LOCAL_C_INCLUDES := $(SDL_INCLUDE_PATHS)  \
                         $(TOP_DIR) \
                         $(TOP_DIR)/MobileTouchControls \
                         $(TOP_DIR)/Clibs_OpenTouch \
                         $(TOP_DIR)/Clibs_OpenTouch/alpha \
                         $(LOCAL_PATH)/../qcommon \
                         $(LOCAL_PATH)/../mobile \
                         $(TOP_DIR)/AudioLibs_OpenTouch/openal/include/ \
                         $(TOP_DIR)/AudioLibs_OpenTouch/libmad/ \



LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS) -DAPP_MODULE -DUSE_OPENAL=1

LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

ALL_FILES := $(wildcard $(LOCAL_PATH)/*.c $(LOCAL_PATH)/*.cpp) # ALL files in client

PROJECT_FILES := $(filter-out $(wildcard $(LOCAL_PATH)/snd_*.c $(LOCAL_PATH)/snd_*.cpp $(LOCAL_PATH)/cl_instantAction.cpp $(LOCAL_PATH)/cl_uiserverlist.cpp), $(ALL_FILES)) # Remove all Sound files


PROJECT_FILES += $(wildcard $(LOCAL_PATH)/snd_*_new.c* $(LOCAL_PATH)/snd_codec*.c*) # Add all new sound files
PROJECT_FILES += snd_info.cpp

PROJECT_FILES += $(wildcard $(LOCAL_PATH)/../uilib/*.c*) # ALL files in uilib


PROJECT_FILES := $(PROJECT_FILES:$(LOCAL_PATH)/%=%)


EXCLUDE :=

PROJECT_FILES := $(filter-out $(EXCLUDE), $(PROJECT_FILES))

ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
   LOCAL_CFLAGS += -DNO_VM_COMPILED
endif

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
 #PROJECT_FILES +=  qcommon/vm_armv7l.c
endif


LOCAL_SRC_FILES =  $(PROJECT_FILES)

LOCAL_SRC_FILES +=  ../mobile/game_interface.c \
                    ../mobile/ifaddrs.c \
                    ../../../../Clibs_OpenTouch/alpha/android_jni.cpp \
                    ../../../../Clibs_OpenTouch/alpha/touch_interface_omohaa.cpp \
                    ../../../../Clibs_OpenTouch/touch_interface_base.cpp

LOCAL_LDLIBS := -lEGL -ldl -llog -lOpenSLES -lz -lGLESv1_CM
LOCAL_STATIC_LIBRARIES := sigc libzip libpng logwritter SDL2_net mohaa_sdl_dev mohaa_syslib_dev mohaa_server_dev mohaa_skeletor_dev mohaa_refgl1_dev mohaa_tiki_dev mad
LOCAL_SHARED_LIBRARIES := touchcontrols SDL2  SDL2_mixer saffal openal GL4ES


include $(BUILD_SHARED_LIBRARY)

