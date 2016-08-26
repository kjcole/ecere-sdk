.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := ungif
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

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)/$(LP)ungif$(A)

_OBJECTS = \
	$(OBJ)dgif_lib.o \
	$(OBJ)gif_err.o \
	$(OBJ)gifalloc.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	$(srcdir)lib/dgif_lib.c \
	$(srcdir)lib/gif_err.c \
	$(srcdir)lib/gifalloc.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w $(FVISIBILITY)





CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(_OBJECTS): $(OBJ)%.o: $(srcdir)lib/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

cleantarget:
	$(call rm,$(TARGET))

clean: cleantarget
	$(call rm,$(_OBJECTS))

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
