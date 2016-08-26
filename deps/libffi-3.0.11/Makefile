.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := ffi
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

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)/$(LP)ffi$(A)

ifeq ($(TARGET_ARCH),x86_64)
PLATFORM_OBJ  := win64
else
PLATFORM_OBJ  := win32
endif

_OBJECTS = \
	$(OBJ)ffi.o \
	$(OBJ)$(PLATFORM_OBJ).o \
	$(OBJ)prep_cif.o \
	$(OBJ)raw_api.o \
	$(OBJ)types.o \
	$(OBJ)closures.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	$(srcdir)src/x86/ffi.c \
	$(srcdir)src/x86/$(PLATFORM_OBJ).S \
	$(srcdir)src/prep_cif.c \
	$(srcdir)src/raw_api.c \
	$(srcdir)src/types.c \
	$(srcdir)src/closures.c

_OBJECTS_C_DIR_src_x86 = $(call list_src_to_obj,.c,$(O),$(call list_match_sufx_dir,.c,$(srcdir)src/x86/,$(SOURCES)))
_OBJECTS_S_DIR_src_x86 = $(call list_src_to_obj,.S,$(O),$(call list_match_sufx_dir,.S,$(srcdir)src/x86/,$(SOURCES)))
_OBJECTS_C_DIR_src = $(call list_src_to_obj,.c,$(O),$(call list_match_sufx_dir,.c,$(srcdir)src/,$(SOURCES)))

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall \
			 -I$(srcdir)include \
			 -I$(srcdir)i686-pc-mingw32/include \
			 -I$(srcdir)i686-pc-mingw32





CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(_OBJECTS_C_DIR_src_x86): $(OBJ)%.o: $(srcdir)src/x86/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_S_DIR_src_x86): $(OBJ)%.o: $(srcdir)src/x86/%.S
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_C_DIR_src): $(OBJ)%.o: $(srcdir)src/%.c
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
