.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := libjpeg
VERSION := 
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE
CFLAGS =
LDFLAGS =
endif
PRJ_CFLAGS =
CECFLAGS =
OFLAGS =
LIBS =

ifdef DEBUG
NOSTRIP := y
endif

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = ../../

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)jpeg$(A)

_OBJECTS = $(_OBJECTS1) $(_OBJECTS2)
_OBJECTS1 = \
	$(OBJ)jcapimin.o \
	$(OBJ)jcapistd.o \
	$(OBJ)jccoefct.o \
	$(OBJ)jccolor.o \
	$(OBJ)jcdctmgr.o \
	$(OBJ)jchuff.o \
	$(OBJ)jcinit.o \
	$(OBJ)jcmainct.o \
	$(OBJ)jcmarker.o \
	$(OBJ)jcmaster.o \
	$(OBJ)jcomapi.o \
	$(OBJ)jcparam.o \
	$(OBJ)jcprepct.o \
	$(OBJ)jcsample.o \
	$(OBJ)jctrans.o \
	$(OBJ)jdapimin.o \
	$(OBJ)jdapistd.o \
	$(OBJ)jdatadst.o \
	$(OBJ)jdatasrc.o \
	$(OBJ)jdcoefct.o \
	$(OBJ)jdcolor.o \
	$(OBJ)jddctmgr.o \
	$(OBJ)jdhuff.o \
	$(OBJ)jdinput.o \
	$(OBJ)jdmainct.o \
	$(OBJ)jdmarker.o \
	$(OBJ)jdmaster.o \
	$(OBJ)jdmerge.o \
	$(OBJ)jdpostct.o \
	$(OBJ)jdsample.o \
	$(OBJ)jdtrans.o
_OBJECTS2 = \
	$(OBJ)jerror.o \
	$(OBJ)jfdctflt.o \
	$(OBJ)jfdctfst.o \
	$(OBJ)jfdctint.o \
	$(OBJ)jidctflt.o \
	$(OBJ)jidctfst.o \
	$(OBJ)jidctint.o \
	$(OBJ)jquant1.o \
	$(OBJ)jquant2.o \
	$(OBJ)jutils.o \
	$(OBJ)jaricom.o \
	$(OBJ)jcarith.o \
	$(OBJ)jdarith.o \
	$(OBJ)jmemmgr.o \
	$(OBJ)jmemnobs.o \
	$(OBJ)transupp.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	$(srcdir)jcapimin.c \
	$(srcdir)jcapistd.c \
	$(srcdir)jccoefct.c \
	$(srcdir)jccolor.c \
	$(srcdir)jcdctmgr.c \
	$(srcdir)jchuff.c \
	$(srcdir)jcinit.c \
	$(srcdir)jcmainct.c \
	$(srcdir)jcmarker.c \
	$(srcdir)jcmaster.c \
	$(srcdir)jcomapi.c \
	$(srcdir)jcparam.c \
	$(srcdir)jcprepct.c \
	$(srcdir)jcsample.c \
	$(srcdir)jctrans.c \
	$(srcdir)jdapimin.c \
	$(srcdir)jdapistd.c \
	$(srcdir)jdatadst.c \
	$(srcdir)jdatasrc.c \
	$(srcdir)jdcoefct.c \
	$(srcdir)jdcolor.c \
	$(srcdir)jddctmgr.c \
	$(srcdir)jdhuff.c \
	$(srcdir)jdinput.c \
	$(srcdir)jdmainct.c \
	$(srcdir)jdmarker.c \
	$(srcdir)jdmaster.c \
	$(srcdir)jdmerge.c \
	$(srcdir)jdpostct.c \
	$(srcdir)jdsample.c \
	$(srcdir)jdtrans.c \
	$(srcdir)jerror.c \
	$(srcdir)jfdctflt.c \
	$(srcdir)jfdctfst.c \
	$(srcdir)jfdctint.c \
	$(srcdir)jidctflt.c \
	$(srcdir)jidctfst.c \
	$(srcdir)jidctint.c \
	$(srcdir)jquant1.c \
	$(srcdir)jquant2.c \
	$(srcdir)jutils.c \
	$(srcdir)jaricom.c \
	$(srcdir)jcarith.c \
	$(srcdir)jdarith.c \
	$(srcdir)jmemmgr.c \
	$(srcdir)jmemnobs.c \
	$(srcdir)transupp.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\""

ECFLAGS += -module $(MODULE)
CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS1),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS2),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
endif
endif
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

vpath %.c $(srcdir)

$(_OBJECTS): $(OBJ)%$(O): $(srcdir)%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

cleantarget:
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)))
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO))
endif
endif
endif

clean: cleantarget
	$(call rm,$(_OBJECTS1))
	$(call rm,$(_OBJECTS2))

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
