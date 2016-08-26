.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := ec
CONFIG := bootstrap
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

_CF_DIR = ../../../

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecBootstrap$(A)

BOOTSTRAP_OBJECTS = \
	$(OBJ)ast.o \
	$(OBJ)copy.o \
	$(OBJ)dbpass.o \
	$(OBJ)ec.main.o \
	$(OBJ)ecdefs.o \
	$(OBJ)expression.o \
	$(OBJ)firstPass.o \
	$(OBJ)freeAst.o \
	$(OBJ)grammar.o \
	$(OBJ)lexer.o \
	$(OBJ)loadSymbols.o \
	$(OBJ)output.o \
	$(OBJ)pass0.o \
	$(OBJ)pass1.o \
	$(OBJ)pass15.o \
	$(OBJ)pass16.o \
	$(OBJ)pass2.o \
	$(OBJ)pass3.o \
	$(OBJ)shortcuts.o \
	$(OBJ)type.o

OBJECTS = $(BOOTSTRAP_OBJECTS) \
	$(OBJ)bsl.o

SOURCES = \
	$(srcdir)bootstrap/ast.c \
	$(srcdir)bootstrap/copy.c \
	$(srcdir)bootstrap/dbpass.c \
	$(srcdir)bootstrap/ec.main.c \
	$(srcdir)bootstrap/ecdefs.c \
	$(srcdir)bootstrap/expression.c \
	$(srcdir)bootstrap/firstPass.c \
	$(srcdir)bootstrap/freeAst.c \
	$(srcdir)bootstrap/grammar.c \
	$(srcdir)bootstrap/lexer.c \
	$(srcdir)bootstrap/loadSymbols.c \
	$(srcdir)bootstrap/output.c \
	$(srcdir)bootstrap/pass0.c \
	$(srcdir)bootstrap/pass1.c \
	$(srcdir)bootstrap/pass15.c \
	$(srcdir)bootstrap/pass16.c \
	$(srcdir)bootstrap/pass2.c \
	$(srcdir)bootstrap/pass3.c \
	$(srcdir)bootstrap/shortcuts.c \
	$(srcdir)bootstrap/type.c \
	$(srcdir)../bsl.c

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS +=
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w \
			 -DECERE_STATIC
ECFLAGS += \
	 -nolinenumbers




CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

# OBJECT RULES

$(BOOTSTRAP_OBJECTS): $(OBJ)%.o: $(srcdir)bootstrap/%.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)bsl.o: $(srcdir)../bsl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

clean:
	$(call rm,$(TARGET))
	$(call rm,$(OBJECTS))

realclean:
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
