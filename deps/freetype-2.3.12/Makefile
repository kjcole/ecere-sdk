.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := libfreetype
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

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)/$(LP)freetype$(A)

_OBJECTS = $(_OBJECTS1) $(_OBJECTS2)
_OBJECTS1 = \
	$(OBJ)afglobal.o \
	$(OBJ)afindic.o \
	$(OBJ)autofit.o \
	$(OBJ)ftapi.o \
	$(OBJ)ftbase.o \
	$(OBJ)ftbbox.o \
	$(OBJ)ftbdf.o \
	$(OBJ)ftbitmap.o \
	$(OBJ)ftdebug.o \
	$(OBJ)ftgasp.o \
	$(OBJ)ftglyph.o \
	$(OBJ)ftgxval.o \
	$(OBJ)ftinit.o \
	$(OBJ)ftlcdfil.o \
	$(OBJ)ftmm.o \
	$(OBJ)ftotval.o \
	$(OBJ)ftpatent.o \
	$(OBJ)ftpfr.o \
	$(OBJ)ftstroke.o \
	$(OBJ)ftsynth.o \
	$(OBJ)ftsystem.o \
	$(OBJ)fttype1.o \
	$(OBJ)ftwinfnt.o \
	$(OBJ)ftxf86.o \
	$(OBJ)bdf.o \
	$(OBJ)ftcache.o \
	$(OBJ)cff.o \
	$(OBJ)type1cid.o \
	$(OBJ)gxvalid.o \
	$(OBJ)ftgzip.o \
	$(OBJ)ftlzw.o \
	$(OBJ)otvalid.o
_OBJECTS2 = \
	$(OBJ)pcf.o \
	$(OBJ)pfr.o \
	$(OBJ)psaux.o \
	$(OBJ)pshinter.o \
	$(OBJ)psnames.o \
	$(OBJ)raster.o \
	$(OBJ)sfnt.o \
	$(OBJ)smooth.o \
	$(OBJ)truetype.o \
	$(OBJ)type1.o \
	$(OBJ)type42.o \
	$(OBJ)winfnt.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	$(srcdir)src/autofit/afglobal.c \
	$(srcdir)src/autofit/afindic.c \
	$(srcdir)src/autofit/autofit.c \
	$(srcdir)src/base/ftapi.c \
	$(srcdir)src/base/ftbase.c \
	$(srcdir)src/base/ftbbox.c \
	$(srcdir)src/base/ftbdf.c \
	$(srcdir)src/base/ftbitmap.c \
	$(srcdir)src/base/ftdebug.c \
	$(srcdir)src/base/ftgasp.c \
	$(srcdir)src/base/ftglyph.c \
	$(srcdir)src/base/ftgxval.c \
	$(srcdir)src/base/ftinit.c \
	$(srcdir)src/base/ftlcdfil.c \
	$(srcdir)src/base/ftmm.c \
	$(srcdir)src/base/ftotval.c \
	$(srcdir)src/base/ftpatent.c \
	$(srcdir)src/base/ftpfr.c \
	$(srcdir)src/base/ftstroke.c \
	$(srcdir)src/base/ftsynth.c \
	$(srcdir)src/base/ftsystem.c \
	$(srcdir)src/base/fttype1.c \
	$(srcdir)src/base/ftwinfnt.c \
	$(srcdir)src/base/ftxf86.c \
	$(srcdir)src/bdf/bdf.c \
	$(srcdir)src/cache/ftcache.c \
	$(srcdir)src/cff/cff.c \
	$(srcdir)src/cid/type1cid.c \
	$(srcdir)src/gxvalid/gxvalid.c \
	$(srcdir)src/gzip/ftgzip.c \
	$(srcdir)src/lzw/ftlzw.c \
	$(srcdir)src/otvalid/otvalid.c \
	$(srcdir)src/pcf/pcf.c \
	$(srcdir)src/pfr/pfr.c \
	$(srcdir)src/psaux/psaux.c \
	$(srcdir)src/pshinter/pshinter.c \
	$(srcdir)src/psnames/psnames.c \
	$(srcdir)src/raster/raster.c \
	$(srcdir)src/sfnt/sfnt.c \
	$(srcdir)src/smooth/smooth.c \
	$(srcdir)src/truetype/truetype.c \
	$(srcdir)src/type1/type1.c \
	$(srcdir)src/type42/type42.c \
	$(srcdir)src/winfonts/winfnt.c

_OBJECTS_IN_DIR_src_autofit = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/autofit/,$(SOURCES)))
_OBJECTS_IN_DIR_src_base = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/base/,$(SOURCES)))
_OBJECTS_IN_DIR_src_bdf = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/bdf/,$(SOURCES)))
_OBJECTS_IN_DIR_src_cache = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/cache/,$(SOURCES)))
_OBJECTS_IN_DIR_src_cff = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/cff/,$(SOURCES)))
_OBJECTS_IN_DIR_src_cid = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/cid/,$(SOURCES)))
_OBJECTS_IN_DIR_src_gxvalid = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/gxvalid/,$(SOURCES)))
_OBJECTS_IN_DIR_src_gzip = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/gzip/,$(SOURCES)))
_OBJECTS_IN_DIR_src_lzw = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/lzw/,$(SOURCES)))
_OBJECTS_IN_DIR_src_otvalid = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/otvalid/,$(SOURCES)))
_OBJECTS_IN_DIR_src_pcf = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/pcf/,$(SOURCES)))
_OBJECTS_IN_DIR_src_pfr = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/pfr/,$(SOURCES)))
_OBJECTS_IN_DIR_src_psaux = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/psaux/,$(SOURCES)))
_OBJECTS_IN_DIR_src_pshinter = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/pshinter/,$(SOURCES)))
_OBJECTS_IN_DIR_src_psnames = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/psnames/,$(SOURCES)))
_OBJECTS_IN_DIR_src_raster = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/raster/,$(SOURCES)))
_OBJECTS_IN_DIR_src_sfnt = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/sfnt/,$(SOURCES)))
_OBJECTS_IN_DIR_src_smooth = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/smooth/,$(SOURCES)))
_OBJECTS_IN_DIR_src_truetype = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/truetype/,$(SOURCES)))
_OBJECTS_IN_DIR_src_type1 = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/type1/,$(SOURCES)))
_OBJECTS_IN_DIR_src_type42 = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/type42/,$(SOURCES)))
_OBJECTS_IN_DIR_src_winfonts = $(call list_src_to_obj,.c,$(O),$(call list_match_dir,$(srcdir)src/winfonts/,$(SOURCES)))

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

# Warning: Compiling with -O2 gives 0 font height with MinGW!!
PRJ_CFLAGS += \
	 $(if $(DEBUG),-g) $(FPIC) -w \
			 -DFT2_BUILD_LIBRARY \
			 -DFT_OPTION_AUTOFIT2 \
			 -I$(srcdir)../zlib-1.2.8 \
			 -I$(srcdir)include \
			 -I$(srcdir)include/freetype \
			 -I$(srcdir)include/freetype/internal





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

$(_OBJECTS_IN_DIR_src_autofit): $(OBJ)%.o: $(srcdir)src/autofit/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_base): $(OBJ)%.o: $(srcdir)src/base/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_bdf): $(OBJ)%.o: $(srcdir)src/bdf/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_cache): $(OBJ)%.o: $(srcdir)src/cache/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_cff): $(OBJ)%.o: $(srcdir)src/cff/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_cid): $(OBJ)%.o: $(srcdir)src/cid/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_gxvalid): $(OBJ)%.o: $(srcdir)src/gxvalid/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_gzip): $(OBJ)%.o: $(srcdir)src/gzip/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_lzw): $(OBJ)%.o: $(srcdir)src/lzw/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_otvalid): $(OBJ)%.o: $(srcdir)src/otvalid/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_pcf): $(OBJ)%.o: $(srcdir)src/pcf/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_pfr): $(OBJ)%.o: $(srcdir)src/pfr/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_psaux): $(OBJ)%.o: $(srcdir)src/psaux/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_pshinter): $(OBJ)%.o: $(srcdir)src/pshinter/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_psnames): $(OBJ)%.o: $(srcdir)src/psnames/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_raster): $(OBJ)%.o: $(srcdir)src/raster/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_sfnt): $(OBJ)%.o: $(srcdir)src/sfnt/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_smooth): $(OBJ)%.o: $(srcdir)src/smooth/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_truetype): $(OBJ)%.o: $(srcdir)src/truetype/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_type1): $(OBJ)%.o: $(srcdir)src/type1/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_type42): $(OBJ)%.o: $(srcdir)src/type42/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(_OBJECTS_IN_DIR_src_winfonts): $(OBJ)%.o: $(srcdir)src/winfonts/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

cleantarget:
	$(call rm,$(TARGET))

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
