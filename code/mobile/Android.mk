LOCAL_PATH :=  $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := mohaa

LOCAL_CFLAGS := -DOMOHAA -DENGINE_NAME=\"omohaa\"

LOCAL_STATIC_LIBRARIES := sigc libzip libpng logwritter SDL2_net mohaa_client mohaa_syslib
LOCAL_SHARED_LIBRARIES := touchcontrols SDL2  SDL2_mixer core_shared saffal


LOCAL_C_INCLUDES :=     $(SDL_INCLUDE_PATHS)  \
                        $(TOP_DIR) \
                        $(TOP_DIR)/MobileTouchControls \
                        $(TOP_DIR)/AudioLibs_OpenTouch/liboggvorbis/include \
                        $(TOP_DIR)/Clibs_OpenTouch \
                        $(TOP_DIR)/Clibs_OpenTouch/alpha \
                        $(LOCAL_PATH)/jpeg-8c/ \
                        $(LOCAL_PATH)/libvorbis-1.3.5/lib

LOCAL_SRC_FILES =  game_interface.c \
                   ifaddrs.c \
                    ../../../../Clibs_OpenTouch/alpha/android_jni.cpp \
                    ../../../../Clibs_OpenTouch/alpha/touch_interface_omohaa.cpp \
                    ../../../../Clibs_OpenTouch/touch_interface_base.cpp

LOCAL_LDLIBS := -lEGL -ldl -llog -lOpenSLES -lz -lGLESv1_CM
LOCAL_STATIC_LIBRARIES := core_shared mohaa_client

include $(BUILD_SHARED_LIBRARY)

include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_client.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_qcommon.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_qcommon_exe.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_sdl.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_tiki.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_sys.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_server.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_skeletor.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_refgl1.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_cgame.mk
include $(TOP_DIR)/Alpha/openmohaa/code/mobile/Android_fgame.mk
