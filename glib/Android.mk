LOCAL_PATH:= $(call my-dir)

GLIB_TOP := $(LOCAL_PATH)/..

local_src_files:= \
    ./libcharset/localcharset.c \
    garray.c        \
    gasyncqueue.c   \
    gatomic.c       \
    gbacktrace.c    \
    gbase64.c       \
    gbitlock.c      \
    gbookmarkfile.c \
    gbuffer.c       \
    gcache.c        \
    gchecksum.c     \
    gcompletion.c   \
    gconvert.c      \
    gdataset.c      \
    gdate.c         \
    gdatetime.c     \
    gdir.c          \
    gerror.c        \
    gfileutils.c    \
    ghash.c         \
    ghook.c         \
    ghostutils.c    \
    giochannel.c    \
    gkeyfile.c      \
    glist.c         \
    gmain.c         \
    gmappedfile.c   \
    gmarkup.c       \
    gmem.c          \
    gmessages.c     \
    gnode.c         \
    goption.c       \
    gpattern.c      \
    gpoll.c         \
    gprimes.c       \
    gqsort.c        \
    gqueue.c        \
    grel.c          \
    grand.c         \
    gregex.c        \
    gscanner.c      \
    gsequence.c     \
    gshell.c        \
    gslice.c        \
    gslist.c        \
    gstdio.c        \
    gstrfuncs.c     \
    gstring.c       \
    gtestutils.c    \
    gthread.c       \
    gthreadpool.c   \
    gtimer.c        \
    gtimezone.c     \
    gtree.c         \
    guniprop.c      \
    gutf8.c         \
    gunibreak.c     \
    gunicollate.c   \
    gunidecomp.c    \
    gurifuncs.c     \
    gutils.c        \
    gvariant.c      \
    gvariant-core.c \
    gvariant-parser.c \
    gvariant-serialiser.c \
    gvarianttypeinfo.c \
    gvarianttype.c  \
    gprintf.c       \
    giounix.c       \
    gspawn.c

local_c_includes := 			\
	$(GLIB_TOP)			\
	$(GLIB_TOP)/android		\
	$(GLIB_TOP)/android-internal	\
	$(LOCAL_PATH)/android-internal	\
	$(LOCAL_PATH)/libcharset       	\
	$(LOCAL_PATH)/gnulib           	\
	$(LOCAL_PATH)/pcre

# ./glib private macros, copy from Makefile.am
local_cflags := \
	-DLIBDIR=\"$(libdir)\"		\
	-DHAVE_CONFIG_H			\
	-DG_LOG_DOMAIN=\"GLib\"		\
	-DPCRE_STATIC			\
	-DG_DISABLE_DEPRECATED		\
	-DGLIB_COMPILATION

local_export_c_includes := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../android

#
# Static library
#
include $(CLEAR_VARS)

LOCAL_MODULE := libglib-2.0_static
LOCAL_CFLAGS := $(local_cflags)
LOCAL_C_INCLUDES := $(local_c_includes)
LOCAL_SRC_FILES := $(local_src_files)

LOCAL_EXPORT_C_INCLUDES += $(local_export_c_includes)

include $(BUILD_STATIC_LIBRARY)

#
# Shared library
#
include $(CLEAR_VARS)

LOCAL_MODULE := libglib-2.0
LOCAL_CFLAGS := $(local_cflags)
LOCAL_C_INCLUDES := $(local_c_includes)
LOCAL_SRC_FILES := $(local_src_files)

LOCAL_EXPORT_C_INCLUDES += $(local_export_c_includes)

LOCAL_STATIC_LIBRARIES := libpcre
LOCAL_LDLIBS :=				\
	-llog

include $(BUILD_SHARED_LIBRARY)

include $(LOCAL_PATH)/pcre/Android.mk
