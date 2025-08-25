LOCAL_PATH :=  $(call my-dir)/../tiki/

include $(CLEAR_VARS)

LOCAL_MODULE := mohaa_tiki

LOCAL_CFLAGS := $(MOHAA_LOCAL_CFLAGS)
LOCAL_C_INCLUDES := $(MOHAA_LOCAL_C_INCLUDES)

PROJECT_FILES := \
                tiki_anim.cpp \
                tiki_cache.cpp \
                tiki_commands.cpp \
                tiki_files.cpp \
                tiki_frame.cpp \
                tiki_imports.cpp \
                tiki_parse.cpp \
                tiki_skel.cpp \
                tiki_surface.cpp \
                tiki_tag.cpp \
                tiki_utility.cpp \
                tiki_mesh.cpp \
                ../qcommon/tiki_main.cpp \
                ../qcommon/tiki_script.cpp \


LOCAL_SRC_FILES := $(PROJECT_FILES)

$(info $(LOCAL_SRC_FILES))

LOCAL_LDLIBS := -ldl -llog

include $(BUILD_STATIC_LIBRARY)