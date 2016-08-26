.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := ecere
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

RES = res/

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecereBootstrap$(A)

BOOTSTRAP_OBJECTS = \
	$(OBJ)Array.o \
	$(OBJ)AVLTree.o \
	$(OBJ)BinaryTree.o \
	$(OBJ)BTNode.o \
	$(OBJ)BufferedFile.o \
	$(OBJ)BuiltInContainer.o \
	$(OBJ)Container.o \
	$(OBJ)CustomAVLTree.o \
	$(OBJ)dataTypes.o \
	$(OBJ)DualPipe.o \
	$(OBJ)ecere.main.o \
	$(OBJ)File.o \
	$(OBJ)instance.o \
	$(OBJ)LinkList.o \
	$(OBJ)List.o \
	$(OBJ)Map.o \
	$(OBJ)memory.o \
	$(OBJ)OldList.o \
	$(OBJ)String.o \
	$(OBJ)System.o \
	$(OBJ)TempFile.o \
	$(OBJ)i18n.o

OBJECTS = $(BOOTSTRAP_OBJECTS) \
	$(OBJ)instance.c.o \
	$(OBJ)DualPipe.c.o \
	$(OBJ)File.c.o \
	$(OBJ)System.c.o

SOURCES = \
	$(srcdir)bootstrap/Array.c \
	$(srcdir)bootstrap/AVLTree.c \
	$(srcdir)bootstrap/BinaryTree.c \
	$(srcdir)bootstrap/i18n.c \
	$(srcdir)bootstrap/BTNode.c \
	$(srcdir)bootstrap/BufferedFile.c \
	$(srcdir)bootstrap/BuiltInContainer.c \
	$(srcdir)bootstrap/Container.c \
	$(srcdir)bootstrap/CustomAVLTree.c \
	$(srcdir)bootstrap/dataTypes.c \
	$(srcdir)bootstrap/DualPipe.c \
	$(srcdir)bootstrap/ecere.main.c \
	$(srcdir)bootstrap/File.c \
	$(srcdir)bootstrap/instance.c \
	$(srcdir)bootstrap/LinkList.c \
	$(srcdir)bootstrap/List.c \
	$(srcdir)bootstrap/Map.c \
	$(srcdir)bootstrap/memory.c \
	$(srcdir)bootstrap/OldList.c \
	$(srcdir)bootstrap/String.c \
	$(srcdir)bootstrap/System.c \
	$(srcdir)bootstrap/TempFile.c \
	$(srcdir)../../../ecere/src/com/instance.c \
	$(srcdir)../../../ecere/src/sys/DualPipe.c \
	$(srcdir)../../../ecere/src/sys/File.c \
	$(srcdir)../../../ecere/src/sys/System.c

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS +=
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG),-g) $(FPIC) -w \
	 -DBUILDING_ECERE_COM -DECERE_STATIC -DECERE_BOOTSTRAP
ECFLAGS += \
	 -nolinenumbers -defaultns ecere




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

$(OBJ)File.c.o: $(srcdir)../../../ecere/src/sys/File.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)DualPipe.c.o: $(srcdir)../../../ecere/src/sys/DualPipe.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)System.c.o: $(srcdir)../../../ecere/src/sys/System.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)instance.c.o: $(srcdir)../../../ecere/src/com/instance.c
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
