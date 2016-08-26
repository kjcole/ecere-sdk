.PHONY: all objdir cleaneceretarget cleantarget clean realclean distclean nores

# CORE VARIABLES

MODULE := ecere
VERSION := 0.44
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = sharedlib

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

_CF_DIR = ../
USE_BOOTSTRAP := defined

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

ifdef PREFIXLIBDIR
CFLAGS += -DDEB_HOST_MULTIARCH=\"$(call escspace,$(PREFIXLIBDIR))\"
endif

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = res/

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecere$(SO)$(VER)
ifdef LINUX_TARGET
SONAME = -Wl,-soname,libecere.so.0
else
SONAME =
endif

_ECSOURCES = $(_ECSOURCES1) $(_ECSOURCES2) $(_ECSOURCES3)
_ECSOURCES1 = \
	$(srcdir)src/sys/Archive.ec \
	$(srcdir)src/sys/BufferedFile.ec \
	$(srcdir)src/sys/Date.ec \
	$(srcdir)src/sys/DualPipe.ec \
	$(srcdir)src/sys/EARArchive.ec \
	$(srcdir)src/sys/File.ec \
	$(srcdir)src/sys/FileMonitor.ec \
	$(srcdir)src/sys/GlobalAppSettings.ec \
	$(srcdir)src/sys/JSON.ec \
	$(srcdir)src/sys/JSONGlobalSettings.ec \
	$(srcdir)src/sys/memory.ec \
	$(srcdir)src/sys/Mutex.ec \
	$(srcdir)src/sys/Semaphore.ec \
	$(srcdir)src/sys/System.ec \
	$(srcdir)src/sys/TempFile.ec \
	$(srcdir)src/sys/Thread.ec \
	$(srcdir)src/sys/Time.ec \
	$(srcdir)src/sys/unicode.ec \
	$(srcdir)src/sys/units.ec \
	$(srcdir)src/sys/i18n.ec \
	$(srcdir)src/sys/Condition.ec \
	$(srcdir)src/gfx/3D/meshes/Cube.ec \
	$(srcdir)src/gfx/3D/meshes/SkyBox.ec \
	$(srcdir)src/gfx/3D/meshes/Sphere.ec \
	$(srcdir)src/gfx/3D/models/Object3DSFormat.ec \
	$(srcdir)src/gfx/3D/Camera.ec \
	$(srcdir)src/gfx/3D/Matrix.ec \
	$(srcdir)src/gfx/3D/Mesh.ec \
	$(srcdir)src/gfx/3D/Object.ec \
	$(srcdir)src/gfx/3D/Plane.ec \
	$(srcdir)src/gfx/3D/Quaternion.ec \
	$(srcdir)src/gfx/3D/Vector3D.ec \
	$(srcdir)src/gfx/bitmaps/BMPFormat.ec \
	$(srcdir)src/gfx/bitmaps/GIFFormat.ec \
	$(srcdir)src/gfx/bitmaps/JPEGFormat.ec \
	$(srcdir)src/gfx/bitmaps/PCXFormat.ec \
	$(srcdir)src/gfx/bitmaps/PNGFormat.ec \
	$(srcdir)src/gfx/bitmaps/RGBFormat.ec \
	$(srcdir)src/gfx/drivers/gl3/glab.ec \
	$(srcdir)src/gfx/drivers/gl3/immediate.ec \
	$(srcdir)src/gfx/drivers/gl3/matrixStack.ec \
	$(srcdir)src/gfx/drivers/gl3/shaders.ec \
	$(srcdir)src/gfx/drivers/gl3/defaultShader.ec \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/Direct3D8DisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/Direct3D9DisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/DirectDrawDisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/GDIDisplayDriver.ec,) \
	$(srcdir)src/gfx/drivers/lfbBlit.ec \
	$(srcdir)src/gfx/drivers/lfbConvert.ec \
	$(srcdir)src/gfx/drivers/LFBDisplayDriver.ec \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),$(srcdir)src/gfx/drivers/NCursesDisplayDriver.ec,) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/drivers/OpenGLDisplayDriver.ec) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec,)
_ECSOURCES2 = \
	$(if ,$(srcdir)src/gfx/drivers/CocoaOpenGLDisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/Win32ConsoleDisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gfx/drivers/Win32PrinterDisplayDriver.ec,) \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),$(srcdir)src/gfx/drivers/XDisplayDriver.ec,) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/atlasBuilder.ec) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/drawManager.ec) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/fmFontManager.ec) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/fontRenderer.ec) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/textureManager.ec) \
	$(srcdir)src/gfx/Bitmap.ec \
	$(srcdir)src/gfx/BitmapResource.ec \
	$(srcdir)src/gfx/Color.ec \
	$(srcdir)src/gfx/Display.ec \
	$(srcdir)src/gfx/DisplaySystem.ec \
	$(srcdir)src/gfx/FontResource.ec \
	$(srcdir)src/gfx/Resource.ec \
	$(srcdir)src/gfx/Surface.ec \
	$(srcdir)src/gfx/fontManagement.ec \
	$(srcdir)src/gfx/fontRendering.ec \
	$(srcdir)src/gfx/imgDistMap.ec \
	$(srcdir)src/gui/controls/Button.ec \
	$(srcdir)src/gui/controls/CalendarControl.ec \
	$(srcdir)src/gui/controls/DataBox.ec \
	$(srcdir)src/gui/controls/DropBox.ec \
	$(srcdir)src/gui/controls/EditBox.ec \
	$(srcdir)src/gui/controls/Label.ec \
	$(srcdir)src/gui/controls/ListBox.ec \
	$(srcdir)src/gui/controls/Menu.ec \
	$(srcdir)src/gui/controls/Picture.ec \
	$(srcdir)src/gui/controls/ProgressBar.ec \
	$(srcdir)src/gui/controls/ScrollBar.ec \
	$(srcdir)src/gui/controls/StatusBar.ec \
	$(srcdir)src/gui/controls/TabControl.ec \
	$(srcdir)src/gui/controls/PaneSplitter.ec \
	$(srcdir)src/gui/controls/Stacker.ec \
	$(srcdir)src/gui/controls/PathBox.ec \
	$(srcdir)src/gui/controls/ToolTip.ec \
	$(srcdir)src/gui/controls/SelectorBar.ec \
	$(srcdir)src/gui/dialogs/ColorPicker.ec \
	$(srcdir)src/gui/dialogs/FileDialog.ec \
	$(srcdir)src/gui/dialogs/FindDialog.ec \
	$(srcdir)src/gui/dialogs/GoToDialog.ec \
	$(srcdir)src/gui/dialogs/MessageBox.ec \
	$(srcdir)src/gui/dialogs/ReplaceDialog.ec \
	$(srcdir)src/gui/dialogs/WindowList.ec \
	$(if ,$(srcdir)src/gui/drivers/cocoa/CocoaDispatch.ec,) \
	$(if ,$(srcdir)src/gui/drivers/cocoa/CocoaInterface.ec,)
_ECSOURCES3 = \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),$(srcdir)src/gui/drivers/NCursesInterface.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gui/drivers/Win32Interface.ec,) \
	$(if $(WINDOWS_TARGET),$(srcdir)src/gui/drivers/Win32ConsoleInterface.ec,) \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),$(srcdir)src/gui/drivers/XInterface.ec,) \
	$(srcdir)src/gui/skins/TVisionSkin.ec \
	$(srcdir)src/gui/skins/WindowsSkin.ec \
	$(srcdir)src/gui/Anchor.ec \
	$(srcdir)src/gui/ClipBoard.ec \
	$(srcdir)src/gui/Cursor.ec \
	$(srcdir)src/gui/Desktop3D.ec \
	$(srcdir)src/gui/FormDesigner.ec \
	$(srcdir)src/gui/GuiApplication.ec \
	$(srcdir)src/gui/Interface.ec \
	$(srcdir)src/gui/Key.ec \
	$(srcdir)src/gui/Skin.ec \
	$(srcdir)src/gui/Timer.ec \
	$(srcdir)src/gui/typeEdit.ec \
	$(srcdir)src/gui/Window.ec \
	$(srcdir)src/net/dcom.ec \
	$(srcdir)src/net/HTTPFile.ec \
	$(srcdir)src/net/network.ec \
	$(srcdir)src/net/NetworkClientFile.ec \
	$(srcdir)src/net/Service.ec \
	$(srcdir)src/net/Socket.ec \
	$(if $(ENABLE_SSL),$(srcdir)src/net/SSLSocket.ec,) \
	$(srcdir)src/com/containers/Array.ec \
	$(srcdir)src/com/containers/AVLTree.ec \
	$(srcdir)src/com/containers/BuiltInContainer.ec \
	$(srcdir)src/com/containers/Container.ec \
	$(srcdir)src/com/containers/CustomAVLTree.ec \
	$(srcdir)src/com/containers/LinkList.ec \
	$(srcdir)src/com/containers/List.ec \
	$(srcdir)src/com/containers/Map.ec \
	$(srcdir)src/com/BinaryTree.ec \
	$(srcdir)src/com/BTNode.ec \
	$(srcdir)src/com/dataTypes.ec \
	$(srcdir)src/com/instance.ec \
	$(srcdir)src/com/String.ec \
	$(srcdir)src/com/OldList.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))
ECSOURCES1 = $(call shwspace,$(_ECSOURCES1))
ECSOURCES2 = $(call shwspace,$(_ECSOURCES2))
ECSOURCES3 = $(call shwspace,$(_ECSOURCES3))

COBJECTS = $(COBJECTS1) $(COBJECTS2) $(COBJECTS3)
COBJECTS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES1)))))
COBJECTS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES2)))))
COBJECTS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES3)))))

SYMBOLS = $(SYMBOLS1) $(SYMBOLS2) $(SYMBOLS3)
SYMBOLS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES1)))))
SYMBOLS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES2)))))
SYMBOLS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES3)))))

IMPORTS = $(IMPORTS1) $(IMPORTS2) $(IMPORTS3)
IMPORTS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES1)))))
IMPORTS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES2)))))
IMPORTS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES3)))))

ECOBJECTS = $(ECOBJECTS1) $(ECOBJECTS2) $(ECOBJECTS3)
ECOBJECTS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES1)))))
ECOBJECTS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES2)))))
ECOBJECTS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES3)))))

BOWLS = $(BOWLS1) $(BOWLS2) $(BOWLS3)
BOWLS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES1)))))
BOWLS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES2)))))
BOWLS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES3)))))

_OBJECTS = \
	$(OBJ)File.c.o \
	$(OBJ)DualPipe.c.o \
	$(OBJ)System.c.o \
	$(OBJ)harfbuzz-freetype.o \
	$(OBJ)harfbuzz-unicode-tables.o \
	$(OBJ)harfbuzz-unicode.o \
	$(OBJ)harfbuzz-arabic.o \
	$(OBJ)harfbuzz-buffer.o \
	$(OBJ)harfbuzz-gdef.o \
	$(OBJ)harfbuzz-gpos.o \
	$(OBJ)harfbuzz-gsub.o \
	$(OBJ)harfbuzz-hangul.o \
	$(OBJ)harfbuzz-hebrew.o \
	$(OBJ)harfbuzz-indic.o \
	$(OBJ)harfbuzz-khmer.o \
	$(OBJ)harfbuzz-myanmar.o \
	$(OBJ)harfbuzz-open.o \
	$(OBJ)harfbuzz-shaper.o \
	$(OBJ)harfbuzz-stream.o \
	$(OBJ)harfbuzz-tibetan.o \
	$(OBJ)harfbuzz-impl.o \
	$(OBJ)harfbuzz-thai.o \
	$(OBJ)gl_compat_4_4.o \
	$(if $(DISABLE_GL),,$(OBJ)cc$(O)) \
	$(if $(DISABLE_GL),,$(OBJ)ccstr$(O)) \
	$(if $(DISABLE_GL),,$(OBJ)mm$(O)) \
	$(if ,$(OBJ)CocoaEcereBridge.o,) \
	$(if ,$(OBJ)EcereView.o,) \
	$(OBJ)instance.c.o

OBJECTS = $(_OBJECTS) $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES) \
	$(srcdir)src/sys/File.c \
	$(srcdir)src/sys/DualPipe.c \
	$(srcdir)src/sys/System.c \
	$(srcdir)src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c \
	$(srcdir)src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c \
	$(srcdir)src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-arabic.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-buffer.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-gdef.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-gpos.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-gsub.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-hangul.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-indic.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-khmer.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-open.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-shaper.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-stream.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-impl.c \
	$(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-thai.c \
	$(srcdir)src/gfx/drivers/gl3/gl_compat_4_4.c \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/cc/cc.c) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/cc/ccstr.c) \
	$(if $(DISABLE_GL),,$(srcdir)src/gfx/newFonts/cc/mm.c) \
	$(if ,$(srcdir)src/gui/drivers/cocoa/CocoaEcereBridge.m,) \
	$(if ,$(srcdir)src/gui/drivers/cocoa/EcereView.m,) \
	$(srcdir)src/com/instance.c

RESOURCES = $(RESOURCES1) $(RESOURCES2) $(RESOURCES3)
RESOURCES1 = \
	$(srcdir)$(RES)actions/editFind.png \
	$(srcdir)$(RES)actions/folderNew.png \
	$(srcdir)$(RES)actions/goDown.png \
	$(srcdir)$(RES)actions/goHome.png \
	$(srcdir)$(RES)actions/goNext.png \
	$(srcdir)$(RES)actions/goPrevious.png \
	$(srcdir)$(RES)actions/goUp.png \
	$(srcdir)$(RES)actions/listAdd.png \
	$(srcdir)$(RES)actions/listRemove.png \
	$(srcdir)$(RES)actions/viewRefresh.png \
	$(srcdir)$(RES)actions/windowNew.png \
	$(srcdir)$(RES)actions/clean.png \
	$(srcdir)$(RES)actions/docSave.png \
	$(srcdir)$(RES)actions/docNew.png \
	$(srcdir)$(RES)constructs/class.png \
	$(srcdir)$(RES)constructs/data.png \
	$(srcdir)$(RES)constructs/dataPrivate.png \
	$(srcdir)$(RES)constructs/dataType.png \
	$(srcdir)$(RES)constructs/enum.png \
	$(srcdir)$(RES)constructs/enumValue.png \
	$(srcdir)$(RES)constructs/event.png \
	$(srcdir)$(RES)constructs/library.png \
	$(srcdir)$(RES)constructs/method.png \
	$(srcdir)$(RES)constructs/methodPrivate.png \
	$(srcdir)$(RES)constructs/namespace.png \
	$(srcdir)$(RES)constructs/property.png \
	$(srcdir)$(RES)constructs/propertyPrivate.png \
	$(srcdir)$(RES)controls/button.png \
	$(srcdir)$(RES)controls/calendar.png \
	$(srcdir)$(RES)controls/checkBox.png \
	$(srcdir)$(RES)controls/dataBox.png \
	$(srcdir)$(RES)controls/dropBox.png \
	$(srcdir)$(RES)controls/editBox.png \
	$(srcdir)$(RES)controls/groupBox.png \
	$(srcdir)$(RES)controls/label.png \
	$(srcdir)$(RES)controls/listBox.png \
	$(srcdir)$(RES)controls/menu.png \
	$(srcdir)$(RES)controls/optionBox.png \
	$(srcdir)$(RES)controls/progressBar.png \
	$(srcdir)$(RES)controls/scrollBarHorizontal.png \
	$(srcdir)$(RES)controls/scrollBarVertical.png \
	$(srcdir)$(RES)controls/statusBar.png \
	$(srcdir)$(RES)cursors/arrow.png \
	$(srcdir)$(RES)cursors/cross.png \
	$(srcdir)$(RES)cursors/iBeam.png \
	$(srcdir)$(RES)cursors/move.png \
	$(srcdir)$(RES)cursors/sizeEastWest.png \
	$(srcdir)$(RES)cursors/sizeNortEastSouthWest.png \
	$(srcdir)$(RES)cursors/sizeNorthSouth.png \
	$(srcdir)$(RES)cursors/sizeNortWestSouthEast.png
RESOURCES2 = \
	$(srcdir)$(RES)devices/computer.png \
	$(srcdir)$(RES)devices/driveHardDisk.png \
	$(srcdir)$(RES)devices/driveRemovableMedia.png \
	$(srcdir)$(RES)devices/mediaFloppy.png \
	$(srcdir)$(RES)devices/mediaOptical.png \
	$(srcdir)$(RES)elements/areaClose.png \
	$(srcdir)$(RES)elements/areaMaximize.png \
	$(srcdir)$(RES)elements/areaMinimize.png \
	$(srcdir)$(RES)elements/areaRestore.png \
	$(srcdir)$(RES)elements/arrowDown.png \
	$(srcdir)$(RES)elements/arrowLeft.png \
	$(srcdir)$(RES)elements/arrowRight.png \
	$(srcdir)$(RES)elements/arrowUp.png \
	$(srcdir)$(RES)elements/checkBoxChecked.png \
	$(srcdir)$(RES)elements/checkBoxDisabled.png \
	$(srcdir)$(RES)elements/checkBoxDisabledChecked.png \
	$(srcdir)$(RES)elements/checkBox.png \
	$(srcdir)$(RES)elements/optionBoxDisabled.png \
	$(srcdir)$(RES)elements/optionBoxDisabledSelected.png \
	$(srcdir)$(RES)elements/optionBoxDown.png \
	$(srcdir)$(RES)elements/optionBoxSelectedDown.png \
	$(srcdir)$(RES)elements/optionBoxSelectedUp.png \
	$(srcdir)$(RES)elements/optionBoxUp.png \
	$(srcdir)$(RES)elements/orderAscending.png \
	$(srcdir)$(RES)elements/orderCategorized.png \
	$(srcdir)$(RES)elements/orderDescending.png \
	$(srcdir)$(RES)emblems/unreadable.png \
	$(srcdir)$(RES)mimeTypes/file.png \
	$(srcdir)$(RES)mimeTypes/image.png \
	$(srcdir)$(RES)mimeTypes/package.png \
	$(srcdir)$(RES)mimeTypes/packageOpticalDisc.png \
	$(srcdir)$(RES)mimeTypes/packageSoftware.png \
	$(srcdir)$(RES)mimeTypes/text.png \
	$(srcdir)$(RES)mimeTypes/textCHeader.png \
	$(srcdir)$(RES)mimeTypes/textCSource.png \
	$(srcdir)$(RES)mimeTypes/textC++Header.png \
	$(srcdir)$(RES)mimeTypes/textC++Source.png \
	$(srcdir)$(RES)mimeTypes/textEcereHeader.png \
	$(srcdir)$(RES)mimeTypes/textEcereProject.png \
	$(srcdir)$(RES)mimeTypes/textEcereSource.png \
	$(srcdir)$(RES)mimeTypes/textEcereWorkspace.png \
	$(srcdir)$(RES)mimeTypes/textHyperTextMarkup.png
RESOURCES3 = \
	$(srcdir)$(RES)mimeTypes/brokenFile.png \
	$(srcdir)$(RES)places/driveRemote.png \
	$(srcdir)$(RES)places/folder.png \
	$(srcdir)$(RES)places/folderRemote.png \
	$(srcdir)$(RES)places/networkServer.png \
	$(srcdir)$(RES)places/networkWorkgroup.png \
	$(srcdir)$(RES)places/brokenFolder.png \
	$(srcdir)$(RES)status/audioVolumeHigh.png \
	$(srcdir)$(RES)status/folderOpen.png \
	$(srcdir)$(RES)unicode/derivedGeneralCategoryStripped.txt \
	$(srcdir)locale/es.mo \
	$(srcdir)locale/hu.mo \
	$(srcdir)locale/mr.mo \
	$(srcdir)locale/nl.mo \
	$(srcdir)locale/pt_BR.mo \
	$(srcdir)locale/ru.mo \
	$(srcdir)locale/zh_CN.mo \
	$(srcdir)src/gfx/drivers/gl3/default.frag \
	$(srcdir)src/gfx/drivers/gl3/default.vert

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,jpeg) \
	$(call _L,png) \
	$(call _L,z) \
	$(call _L,freetype) \
	$(call _L,curl)
endif

# Careful to keep ../deps/glext as -isystem instead of generated -I
PRJ_CFLAGS += \
	 $(if $(WINDOWS_TARGET), \
			 -isystem $(srcdir)../deps/glext \
			 -I$(srcdir)../deps/jpeg-9a \
			 -I$(srcdir)../deps/libpng-1.6.12 \
			 -I$(srcdir)../deps/libungif-4.1.1/lib \
			 -I$(srcdir)../deps/zlib-1.2.8 \
			 -I$(srcdir)../deps/freetype-2.3.12/include \
			 -I$(srcdir)../deps/curl-7.51.0/include \
			 $(if $(ENABLE_SSL),-I$(OPENSSL_INCLUDE_DIR),)) \
	 $(if $(LINUX_TARGET), \
			 -I/usr/include/freetype2,) \
	 $(if $(OSX_TARGET), \
			 -I/usr/include/freetype2 \
			 -I$(SYSROOT)/usr/X11/include/freetype2 \
			 -I$(SYSROOT)/usr/X11/include \
			 -I/usr/X11R6/include/freetype2 \
			 -I/usr/X11R6/include \
			 -I$(srcdir)src/gui/drivers/cocoa \
			 -I$(srcdir)../deps/jpeg-9a \
			 -I$(srcdir)../deps/libpng-1.6.12 \
			 -I$(srcdir)../deps/libungif-4.1.1/lib,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w \
			 -DBUILDING_ECERE_COM \
			 -DCURL_DISABLE_TYPECHECK \
			 -I$(srcdir)src/gfx/drivers/gl3/ \
			 -I$(srcdir)src/gfx/drivers/harfbuzz \
			 -I/usr/X11R6/include \
			 -I/usr/X11R6/include/freetype2 $(FVISIBILITY)

CUSTOM1_PRJ_CFLAGS = \
	 $(if $(LINUX_TARGET), \
			 -D_FILE_OFFSET_BITS=64,) \
	 $(PRJ_CFLAGS)

CUSTOM2_PRJ_CFLAGS = \
			 -DECERE_COM_MODULE \
	 $(PRJ_CFLAGS)

CUSTOM3_PRJ_CFLAGS = \
			 -I$(srcdir)src/gfx/newFonts/cc \
	 $(PRJ_CFLAGS)

ECFLAGS += -module $(MODULE)
ECFLAGS += \
	 -nolinenumbers -defaultns ecere

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../deps/zlib-1.2.8/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 -L../deps/jpeg-9a/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 -L../deps/libpng-1.6.12/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 -L../deps/freetype-2.3.12/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 -L../deps/curl-7.51.0/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 $(if $(ENABLE_SSL),-L$(OPENSSL_LIB_DIR) -L$(OPENSSL_BIN_DIR))
LIBS += \
	$(call _L,dxguid) \
	$(call _L,ddraw) \
	$(call _L,dinput) \
	$(call _L,winmm) \
	$(call _L,opengl32) \
	$(call _L,ws2_32) \
	$(call _L,kernel32) \
	$(call _L,user32) \
	$(call _L,gdi32) \
	$(call _L,mpr) \
	$(call _L,advapi32) \
	$(call _L,shell32) \
	$(call _L,winspool) \
	$(call _L,imm32) \
	$(call _L,ungif) \
	$(if $(ENABLE_SSL),$(call _L,eay32)) \
	$(if $(ENABLE_SSL),$(call _L,ssleay32))
endif

else
ifdef LINUX_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L/usr/X11R6/lib
LIBS += \
	$(call _L,ncurses) \
	$(call _L,pthread) \
	$(call _L,m) \
	$(call _L,dl) \
	$(call _L,fontconfig) \
	$(call _L,gif) \
	$(call _L,X11) \
	$(call _L,Xext) \
	$(call _L,Xrender) \
	$(if $(DISABLE_GL),,$(call _L,GL)) \
	$(if $(ENABLE_SSL),$(call _L,ssl)) \
	$(if $(ENABLE_SSL),$(call _L,crypto)) \
	$(call _L,curl)
endif

else
ifdef OSX_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L$(SYSROOT)/usr/X11/lib \
	 -L/usr/X11R6/lib \
	 -L../deps/jpeg-9a/obj/release.$(PLATFORM)$(COMPILER_SUFFIX) \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)
LIBS += \
	$(call _L,curses) \
	$(call _L,pthread) \
	$(call _L,m) \
	$(call _L,dl) \
	$(call _L,fontconfig) \
	$(call _L,ungif) \
	$(call _L,X11) \
	$(call _L,Xext) \
	$(call _L,Xrender) \
	$(call _L,GL) \
	$(if $(ENABLE_SSL),$(call _L,ssl)) \
	$(if $(ENABLE_SSL),$(call _L,crypto))
endif

endif
endif
endif

CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	@$(call rm,$(OBJ)symbols.lst)
	@$(call touch,$(OBJ)symbols.lst)
	$(call addtolistfile,$(SYMBOLS1),$(OBJ)symbols.lst)
	$(call addtolistfile,$(SYMBOLS2),$(OBJ)symbols.lst)
	$(call addtolistfile,$(SYMBOLS3),$(OBJ)symbols.lst)
	$(call addtolistfile,$(IMPORTS1),$(OBJ)symbols.lst)
	$(call addtolistfile,$(IMPORTS2),$(OBJ)symbols.lst)
	$(call addtolistfile,$(IMPORTS3),$(OBJ)symbols.lst)
	$(ECS) $(ARCH_FLAGS) $(ECSLIBOPT) @$(OBJ)symbols.lst -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir

nores: $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
ifdef WINDOWS_TARGET
	$(call cp,$(TARGET),../compiler/bootstrap/obj/bin.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/)
endif
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cp,$(TARGET),../$(HOST_SODESTDIR))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) ../$(HOST_SODESTDIR)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) ../$(HOST_SODESTDIR)$(LP)$(MODULE)$(SO),)
endif
endif

$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS),$(OBJ)objects.lst)
	$(call addtolistfile,$(OBJ)$(MODULE).main$(O),$(OBJ)objects.lst)
	$(call addtolistfile,$(ECOBJECTS1),$(OBJ)objects.lst)
	$(call addtolistfile,$(ECOBJECTS2),$(OBJ)objects.lst)
	$(call addtolistfile,$(ECOBJECTS3),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(SONAME) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)actions/editFind.png $(srcdir)$(RES)actions/folderNew.png $(srcdir)$(RES)actions/goDown.png $(srcdir)$(RES)actions/goHome.png $(srcdir)$(RES)actions/goNext.png $(srcdir)$(RES)actions/goPrevious.png $(srcdir)$(RES)actions/goUp.png $(srcdir)$(RES)actions/listAdd.png $(srcdir)$(RES)actions/listRemove.png $(srcdir)$(RES)actions/viewRefresh.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)actions/windowNew.png $(srcdir)$(RES)actions/clean.png $(srcdir)$(RES)actions/docSave.png $(srcdir)$(RES)actions/docNew.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)constructs/class.png $(srcdir)$(RES)constructs/data.png $(srcdir)$(RES)constructs/dataPrivate.png $(srcdir)$(RES)constructs/dataType.png $(srcdir)$(RES)constructs/enum.png $(srcdir)$(RES)constructs/enumValue.png $(srcdir)$(RES)constructs/event.png $(srcdir)$(RES)constructs/library.png $(srcdir)$(RES)constructs/method.png $(srcdir)$(RES)constructs/methodPrivate.png "constructs"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)constructs/namespace.png $(srcdir)$(RES)constructs/property.png $(srcdir)$(RES)constructs/propertyPrivate.png "constructs"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)controls/button.png $(srcdir)$(RES)controls/calendar.png $(srcdir)$(RES)controls/checkBox.png $(srcdir)$(RES)controls/dataBox.png $(srcdir)$(RES)controls/dropBox.png $(srcdir)$(RES)controls/editBox.png $(srcdir)$(RES)controls/groupBox.png $(srcdir)$(RES)controls/label.png $(srcdir)$(RES)controls/listBox.png $(srcdir)$(RES)controls/menu.png "controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)controls/optionBox.png $(srcdir)$(RES)controls/progressBar.png $(srcdir)$(RES)controls/scrollBarHorizontal.png $(srcdir)$(RES)controls/scrollBarVertical.png $(srcdir)$(RES)controls/statusBar.png "controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)cursors/arrow.png $(srcdir)$(RES)cursors/cross.png $(srcdir)$(RES)cursors/iBeam.png $(srcdir)$(RES)cursors/move.png $(srcdir)$(RES)cursors/sizeEastWest.png $(srcdir)$(RES)cursors/sizeNortEastSouthWest.png $(srcdir)$(RES)cursors/sizeNorthSouth.png $(srcdir)$(RES)cursors/sizeNortWestSouthEast.png "cursors"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)devices/computer.png $(srcdir)$(RES)devices/driveHardDisk.png $(srcdir)$(RES)devices/driveRemovableMedia.png $(srcdir)$(RES)devices/mediaFloppy.png $(srcdir)$(RES)devices/mediaOptical.png "devices"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)elements/areaClose.png $(srcdir)$(RES)elements/areaMaximize.png $(srcdir)$(RES)elements/areaMinimize.png $(srcdir)$(RES)elements/areaRestore.png $(srcdir)$(RES)elements/arrowDown.png $(srcdir)$(RES)elements/arrowLeft.png $(srcdir)$(RES)elements/arrowRight.png $(srcdir)$(RES)elements/arrowUp.png $(srcdir)$(RES)elements/checkBoxChecked.png $(srcdir)$(RES)elements/checkBoxDisabled.png "elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)elements/checkBoxDisabledChecked.png $(srcdir)$(RES)elements/checkBox.png $(srcdir)$(RES)elements/optionBoxDisabled.png $(srcdir)$(RES)elements/optionBoxDisabledSelected.png $(srcdir)$(RES)elements/optionBoxDown.png $(srcdir)$(RES)elements/optionBoxSelectedDown.png $(srcdir)$(RES)elements/optionBoxSelectedUp.png $(srcdir)$(RES)elements/optionBoxUp.png $(srcdir)$(RES)elements/orderAscending.png $(srcdir)$(RES)elements/orderCategorized.png "elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)elements/orderDescending.png "elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)emblems/unreadable.png "emblems"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)mimeTypes/file.png $(srcdir)$(RES)mimeTypes/image.png $(srcdir)$(RES)mimeTypes/package.png $(srcdir)$(RES)mimeTypes/packageOpticalDisc.png $(srcdir)$(RES)mimeTypes/packageSoftware.png $(srcdir)$(RES)mimeTypes/text.png $(srcdir)$(RES)mimeTypes/textCHeader.png $(srcdir)$(RES)mimeTypes/textCSource.png $(srcdir)$(RES)mimeTypes/textC++Header.png $(srcdir)$(RES)mimeTypes/textC++Source.png "mimeTypes"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)mimeTypes/textEcereHeader.png $(srcdir)$(RES)mimeTypes/textEcereProject.png $(srcdir)$(RES)mimeTypes/textEcereSource.png $(srcdir)$(RES)mimeTypes/textEcereWorkspace.png $(srcdir)$(RES)mimeTypes/textHyperTextMarkup.png $(srcdir)$(RES)mimeTypes/brokenFile.png "mimeTypes"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)places/driveRemote.png $(srcdir)$(RES)places/folder.png $(srcdir)$(RES)places/folderRemote.png $(srcdir)$(RES)places/networkServer.png $(srcdir)$(RES)places/networkWorkgroup.png $(srcdir)$(RES)places/brokenFolder.png "places"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)status/audioVolumeHigh.png $(srcdir)$(RES)status/folderOpen.png "status"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)$(RES)unicode/derivedGeneralCategoryStripped.txt "unicode"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)locale/es.mo $(srcdir)locale/hu.mo $(srcdir)locale/mr.mo $(srcdir)locale/nl.mo $(srcdir)locale/pt_BR.mo $(srcdir)locale/ru.mo $(srcdir)locale/zh_CN.mo "locale"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(srcdir)src/gfx/drivers/gl3/default.frag $(srcdir)src/gfx/drivers/gl3/default.vert "shaders"
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
	$(call mkdir,../$(SODESTDIR))
	$(call cp,$(TARGET),../$(SODESTDIR))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) ../$(SODESTDIR)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) ../$(SODESTDIR)$(LP)$(MODULE)$(SO),)
endif	
endif
endif

# SYMBOL RULES

$(OBJ)Archive.sym: $(srcdir)src/sys/Archive.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)BufferedFile.sym: $(srcdir)src/sys/BufferedFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Date.sym: $(srcdir)src/sys/Date.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DualPipe.sym: $(srcdir)src/sys/DualPipe.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)EARArchive.sym: $(srcdir)src/sys/EARArchive.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)File.sym: src/sys/File.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c $< -o $@

$(OBJ)FileMonitor.sym: $(srcdir)src/sys/FileMonitor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GlobalAppSettings.sym: $(srcdir)src/sys/GlobalAppSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)JSON.sym: $(srcdir)src/sys/JSON.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)JSONGlobalSettings.sym: $(srcdir)src/sys/JSONGlobalSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)memory.sym: $(srcdir)src/sys/memory.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Mutex.sym: $(srcdir)src/sys/Mutex.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Semaphore.sym: $(srcdir)src/sys/Semaphore.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)System.sym: $(srcdir)src/sys/System.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)TempFile.sym: $(srcdir)src/sys/TempFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Thread.sym: $(srcdir)src/sys/Thread.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Time.sym: $(srcdir)src/sys/Time.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)unicode.sym: $(srcdir)src/sys/unicode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)units.sym: $(srcdir)src/sys/units.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)i18n.sym: $(srcdir)src/sys/i18n.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Condition.sym: $(srcdir)src/sys/Condition.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Cube.sym: $(srcdir)src/gfx/3D/meshes/Cube.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)SkyBox.sym: $(srcdir)src/gfx/3D/meshes/SkyBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Sphere.sym: $(srcdir)src/gfx/3D/meshes/Sphere.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Object3DSFormat.sym: $(srcdir)src/gfx/3D/models/Object3DSFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Camera.sym: $(srcdir)src/gfx/3D/Camera.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Matrix.sym: $(srcdir)src/gfx/3D/Matrix.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Mesh.sym: $(srcdir)src/gfx/3D/Mesh.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Object.sym: $(srcdir)src/gfx/3D/Object.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Plane.sym: $(srcdir)src/gfx/3D/Plane.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Quaternion.sym: $(srcdir)src/gfx/3D/Quaternion.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Vector3D.sym: $(srcdir)src/gfx/3D/Vector3D.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)BMPFormat.sym: $(srcdir)src/gfx/bitmaps/BMPFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GIFFormat.sym: $(srcdir)src/gfx/bitmaps/GIFFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)JPEGFormat.sym: $(srcdir)src/gfx/bitmaps/JPEGFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PCXFormat.sym: $(srcdir)src/gfx/bitmaps/PCXFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PNGFormat.sym: $(srcdir)src/gfx/bitmaps/PNGFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)RGBFormat.sym: $(srcdir)src/gfx/bitmaps/RGBFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)glab.sym: $(srcdir)src/gfx/drivers/gl3/glab.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)immediate.sym: $(srcdir)src/gfx/drivers/gl3/immediate.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)matrixStack.sym: $(srcdir)src/gfx/drivers/gl3/matrixStack.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)shaders.sym: $(srcdir)src/gfx/drivers/gl3/shaders.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)defaultShader.sym: $(srcdir)src/gfx/drivers/gl3/defaultShader.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Direct3D8DisplayDriver.sym: $(srcdir)src/gfx/drivers/Direct3D8DisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Direct3D9DisplayDriver.sym: $(srcdir)src/gfx/drivers/Direct3D9DisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)DirectDrawDisplayDriver.sym: $(srcdir)src/gfx/drivers/DirectDrawDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)GDIDisplayDriver.sym: $(srcdir)src/gfx/drivers/GDIDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)lfbBlit.sym: $(srcdir)src/gfx/drivers/lfbBlit.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)lfbConvert.sym: $(srcdir)src/gfx/drivers/lfbConvert.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)LFBDisplayDriver.sym: $(srcdir)src/gfx/drivers/LFBDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)NCursesDisplayDriver.sym: $(srcdir)src/gfx/drivers/NCursesDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)OpenGLDisplayDriver.sym: $(srcdir)src/gfx/drivers/OpenGLDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32BitmapPrinterDisplayDriver.sym: $(srcdir)src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaOpenGLDisplayDriver.sym: $(srcdir)src/gfx/drivers/CocoaOpenGLDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32ConsoleDisplayDriver.sym: $(srcdir)src/gfx/drivers/Win32ConsoleDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32PrinterDisplayDriver.sym: $(srcdir)src/gfx/drivers/Win32PrinterDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)XDisplayDriver.sym: $(srcdir)src/gfx/drivers/XDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)atlasBuilder.sym: $(srcdir)src/gfx/newFonts/atlasBuilder.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)drawManager.sym: $(srcdir)src/gfx/newFonts/drawManager.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)fmFontManager.sym: $(srcdir)src/gfx/newFonts/fmFontManager.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)fontRenderer.sym: $(srcdir)src/gfx/newFonts/fontRenderer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)textureManager.sym: $(srcdir)src/gfx/newFonts/textureManager.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Bitmap.sym: $(srcdir)src/gfx/Bitmap.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)BitmapResource.sym: $(srcdir)src/gfx/BitmapResource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Color.sym: $(srcdir)src/gfx/Color.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Display.sym: $(srcdir)src/gfx/Display.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DisplaySystem.sym: $(srcdir)src/gfx/DisplaySystem.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FontResource.sym: $(srcdir)src/gfx/FontResource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Resource.sym: $(srcdir)src/gfx/Resource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Surface.sym: $(srcdir)src/gfx/Surface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)fontManagement.sym: $(srcdir)src/gfx/fontManagement.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)fontRendering.sym: $(srcdir)src/gfx/fontRendering.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)imgDistMap.sym: $(srcdir)src/gfx/imgDistMap.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Button.sym: $(srcdir)src/gui/controls/Button.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)CalendarControl.sym: $(srcdir)src/gui/controls/CalendarControl.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DataBox.sym: $(srcdir)src/gui/controls/DataBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DropBox.sym: $(srcdir)src/gui/controls/DropBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)EditBox.sym: $(srcdir)src/gui/controls/EditBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Label.sym: $(srcdir)src/gui/controls/Label.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ListBox.sym: $(srcdir)src/gui/controls/ListBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Menu.sym: $(srcdir)src/gui/controls/Menu.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Picture.sym: $(srcdir)src/gui/controls/Picture.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ProgressBar.sym: $(srcdir)src/gui/controls/ProgressBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ScrollBar.sym: $(srcdir)src/gui/controls/ScrollBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)StatusBar.sym: $(srcdir)src/gui/controls/StatusBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)TabControl.sym: $(srcdir)src/gui/controls/TabControl.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PaneSplitter.sym: $(srcdir)src/gui/controls/PaneSplitter.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Stacker.sym: $(srcdir)src/gui/controls/Stacker.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PathBox.sym: $(srcdir)src/gui/controls/PathBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ToolTip.sym: $(srcdir)src/gui/controls/ToolTip.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)SelectorBar.sym: $(srcdir)src/gui/controls/SelectorBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ColorPicker.sym: $(srcdir)src/gui/dialogs/ColorPicker.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FileDialog.sym: $(srcdir)src/gui/dialogs/FileDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FindDialog.sym: $(srcdir)src/gui/dialogs/FindDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GoToDialog.sym: $(srcdir)src/gui/dialogs/GoToDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)MessageBox.sym: $(srcdir)src/gui/dialogs/MessageBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ReplaceDialog.sym: $(srcdir)src/gui/dialogs/ReplaceDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)WindowList.sym: $(srcdir)src/gui/dialogs/WindowList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaDispatch.sym: $(srcdir)src/gui/drivers/cocoa/CocoaDispatch.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaInterface.sym: $(srcdir)src/gui/drivers/cocoa/CocoaInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)NCursesInterface.sym: $(srcdir)src/gui/drivers/NCursesInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32Interface.sym: $(srcdir)src/gui/drivers/Win32Interface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32ConsoleInterface.sym: $(srcdir)src/gui/drivers/Win32ConsoleInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)XInterface.sym: $(srcdir)src/gui/drivers/XInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)TVisionSkin.sym: $(srcdir)src/gui/skins/TVisionSkin.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)WindowsSkin.sym: $(srcdir)src/gui/skins/WindowsSkin.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Anchor.sym: $(srcdir)src/gui/Anchor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ClipBoard.sym: $(srcdir)src/gui/ClipBoard.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Cursor.sym: $(srcdir)src/gui/Cursor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Desktop3D.sym: $(srcdir)src/gui/Desktop3D.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FormDesigner.sym: $(srcdir)src/gui/FormDesigner.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GuiApplication.sym: $(srcdir)src/gui/GuiApplication.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Interface.sym: $(srcdir)src/gui/Interface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Key.sym: $(srcdir)src/gui/Key.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Skin.sym: $(srcdir)src/gui/Skin.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Timer.sym: $(srcdir)src/gui/Timer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)typeEdit.sym: $(srcdir)src/gui/typeEdit.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Window.sym: $(srcdir)src/gui/Window.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)dcom.sym: $(srcdir)src/net/dcom.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)HTTPFile.sym: $(srcdir)src/net/HTTPFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)network.sym: $(srcdir)src/net/network.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)NetworkClientFile.sym: $(srcdir)src/net/NetworkClientFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Service.sym: $(srcdir)src/net/Service.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Socket.sym: $(srcdir)src/net/Socket.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)SSLSocket.sym: $(srcdir)src/net/SSLSocket.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Array.sym: $(srcdir)src/com/containers/Array.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)AVLTree.sym: $(srcdir)src/com/containers/AVLTree.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)BuiltInContainer.sym: $(srcdir)src/com/containers/BuiltInContainer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Container.sym: $(srcdir)src/com/containers/Container.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)CustomAVLTree.sym: $(srcdir)src/com/containers/CustomAVLTree.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)LinkList.sym: $(srcdir)src/com/containers/LinkList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)List.sym: $(srcdir)src/com/containers/List.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Map.sym: $(srcdir)src/com/containers/Map.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)BinaryTree.sym: $(srcdir)src/com/BinaryTree.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)BTNode.sym: $(srcdir)src/com/BTNode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)dataTypes.sym: $(srcdir)src/com/dataTypes.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)instance.sym: $(srcdir)src/com/instance.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)String.sym: $(srcdir)src/com/String.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)OldList.sym: $(srcdir)src/com/OldList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

# C OBJECT RULES

$(OBJ)Archive.c: $(srcdir)src/sys/Archive.ec $(OBJ)Archive.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)BufferedFile.c: $(srcdir)src/sys/BufferedFile.ec $(OBJ)BufferedFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Date.c: $(srcdir)src/sys/Date.ec $(OBJ)Date.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)DualPipe.c: $(srcdir)src/sys/DualPipe.ec $(OBJ)DualPipe.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)EARArchive.c: $(srcdir)src/sys/EARArchive.ec $(OBJ)EARArchive.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)File.c: $(srcdir)src/sys/File.ec $(OBJ)File.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)FileMonitor.c: $(srcdir)src/sys/FileMonitor.ec $(OBJ)FileMonitor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)GlobalAppSettings.c: $(srcdir)src/sys/GlobalAppSettings.ec $(OBJ)GlobalAppSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)JSON.c: $(srcdir)src/sys/JSON.ec $(OBJ)JSON.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)JSONGlobalSettings.c: $(srcdir)src/sys/JSONGlobalSettings.ec $(OBJ)JSONGlobalSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)memory.c: $(srcdir)src/sys/memory.ec $(OBJ)memory.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Mutex.c: $(srcdir)src/sys/Mutex.ec $(OBJ)Mutex.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Semaphore.c: $(srcdir)src/sys/Semaphore.ec $(OBJ)Semaphore.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)System.c: $(srcdir)src/sys/System.ec $(OBJ)System.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)TempFile.c: $(srcdir)src/sys/TempFile.ec $(OBJ)TempFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Thread.c: $(srcdir)src/sys/Thread.ec $(OBJ)Thread.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Time.c: $(srcdir)src/sys/Time.ec $(OBJ)Time.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)unicode.c: $(srcdir)src/sys/unicode.ec $(OBJ)unicode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)units.c: $(srcdir)src/sys/units.ec $(OBJ)units.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)i18n.c: $(srcdir)src/sys/i18n.ec $(OBJ)i18n.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Condition.c: $(srcdir)src/sys/Condition.ec $(OBJ)Condition.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Cube.c: $(srcdir)src/gfx/3D/meshes/Cube.ec $(OBJ)Cube.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)SkyBox.c: $(srcdir)src/gfx/3D/meshes/SkyBox.ec $(OBJ)SkyBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Sphere.c: $(srcdir)src/gfx/3D/meshes/Sphere.ec $(OBJ)Sphere.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Object3DSFormat.c: $(srcdir)src/gfx/3D/models/Object3DSFormat.ec $(OBJ)Object3DSFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Camera.c: $(srcdir)src/gfx/3D/Camera.ec $(OBJ)Camera.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Matrix.c: $(srcdir)src/gfx/3D/Matrix.ec $(OBJ)Matrix.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Mesh.c: $(srcdir)src/gfx/3D/Mesh.ec $(OBJ)Mesh.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Object.c: $(srcdir)src/gfx/3D/Object.ec $(OBJ)Object.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Plane.c: $(srcdir)src/gfx/3D/Plane.ec $(OBJ)Plane.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Quaternion.c: $(srcdir)src/gfx/3D/Quaternion.ec $(OBJ)Quaternion.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Vector3D.c: $(srcdir)src/gfx/3D/Vector3D.ec $(OBJ)Vector3D.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)BMPFormat.c: $(srcdir)src/gfx/bitmaps/BMPFormat.ec $(OBJ)BMPFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)GIFFormat.c: $(srcdir)src/gfx/bitmaps/GIFFormat.ec $(OBJ)GIFFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)JPEGFormat.c: $(srcdir)src/gfx/bitmaps/JPEGFormat.ec $(OBJ)JPEGFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)PCXFormat.c: $(srcdir)src/gfx/bitmaps/PCXFormat.ec $(OBJ)PCXFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)PNGFormat.c: $(srcdir)src/gfx/bitmaps/PNGFormat.ec $(OBJ)PNGFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)RGBFormat.c: $(srcdir)src/gfx/bitmaps/RGBFormat.ec $(OBJ)RGBFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)glab.c: $(srcdir)src/gfx/drivers/gl3/glab.ec $(OBJ)glab.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)immediate.c: $(srcdir)src/gfx/drivers/gl3/immediate.ec $(OBJ)immediate.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)matrixStack.c: $(srcdir)src/gfx/drivers/gl3/matrixStack.ec $(OBJ)matrixStack.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)shaders.c: $(srcdir)src/gfx/drivers/gl3/shaders.ec $(OBJ)shaders.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)defaultShader.c: $(srcdir)src/gfx/drivers/gl3/defaultShader.ec $(OBJ)defaultShader.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Direct3D8DisplayDriver.c: $(srcdir)src/gfx/drivers/Direct3D8DisplayDriver.ec $(OBJ)Direct3D8DisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Direct3D9DisplayDriver.c: $(srcdir)src/gfx/drivers/Direct3D9DisplayDriver.ec $(OBJ)Direct3D9DisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)DirectDrawDisplayDriver.c: $(srcdir)src/gfx/drivers/DirectDrawDisplayDriver.ec $(OBJ)DirectDrawDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)GDIDisplayDriver.c: $(srcdir)src/gfx/drivers/GDIDisplayDriver.ec $(OBJ)GDIDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

$(OBJ)lfbBlit.c: $(srcdir)src/gfx/drivers/lfbBlit.ec $(OBJ)lfbBlit.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)lfbConvert.c: $(srcdir)src/gfx/drivers/lfbConvert.ec $(OBJ)lfbConvert.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)LFBDisplayDriver.c: $(srcdir)src/gfx/drivers/LFBDisplayDriver.ec $(OBJ)LFBDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)NCursesDisplayDriver.c: $(srcdir)src/gfx/drivers/NCursesDisplayDriver.ec $(OBJ)NCursesDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

$(OBJ)OpenGLDisplayDriver.c: $(srcdir)src/gfx/drivers/OpenGLDisplayDriver.ec $(OBJ)OpenGLDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32BitmapPrinterDisplayDriver.c: $(srcdir)src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec $(OBJ)Win32BitmapPrinterDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaOpenGLDisplayDriver.c: $(srcdir)src/gfx/drivers/CocoaOpenGLDisplayDriver.ec $(OBJ)CocoaOpenGLDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32ConsoleDisplayDriver.c: $(srcdir)src/gfx/drivers/Win32ConsoleDisplayDriver.ec $(OBJ)Win32ConsoleDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32PrinterDisplayDriver.c: $(srcdir)src/gfx/drivers/Win32PrinterDisplayDriver.ec $(OBJ)Win32PrinterDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)XDisplayDriver.c: $(srcdir)src/gfx/drivers/XDisplayDriver.ec $(OBJ)XDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif


$(OBJ)atlasBuilder.c: $(srcdir)src/gfx/newFonts/atlasBuilder.ec $(OBJ)atlasBuilder.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)drawManager.c: $(srcdir)src/gfx/newFonts/drawManager.ec $(OBJ)drawManager.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)fmFontManager.c: $(srcdir)src/gfx/newFonts/fmFontManager.ec $(OBJ)fmFontManager.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)fontRenderer.c: $(srcdir)src/gfx/newFonts/fontRenderer.ec $(OBJ)fontRenderer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)textureManager.c: $(srcdir)src/gfx/newFonts/textureManager.ec $(OBJ)textureManager.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Bitmap.c: $(srcdir)src/gfx/Bitmap.ec $(OBJ)Bitmap.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)BitmapResource.c: $(srcdir)src/gfx/BitmapResource.ec $(OBJ)BitmapResource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Color.c: $(srcdir)src/gfx/Color.ec $(OBJ)Color.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Display.c: $(srcdir)src/gfx/Display.ec $(OBJ)Display.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)DisplaySystem.c: $(srcdir)src/gfx/DisplaySystem.ec $(OBJ)DisplaySystem.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)FontResource.c: $(srcdir)src/gfx/FontResource.ec $(OBJ)FontResource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Resource.c: $(srcdir)src/gfx/Resource.ec $(OBJ)Resource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Surface.c: $(srcdir)src/gfx/Surface.ec $(OBJ)Surface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)fontManagement.c: $(srcdir)src/gfx/fontManagement.ec $(OBJ)fontManagement.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)fontRendering.c: $(srcdir)src/gfx/fontRendering.ec $(OBJ)fontRendering.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)imgDistMap.c: $(srcdir)src/gfx/imgDistMap.ec $(OBJ)imgDistMap.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Button.c: $(srcdir)src/gui/controls/Button.ec $(OBJ)Button.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)CalendarControl.c: $(srcdir)src/gui/controls/CalendarControl.ec $(OBJ)CalendarControl.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)DataBox.c: $(srcdir)src/gui/controls/DataBox.ec $(OBJ)DataBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)DropBox.c: $(srcdir)src/gui/controls/DropBox.ec $(OBJ)DropBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)EditBox.c: $(srcdir)src/gui/controls/EditBox.ec $(OBJ)EditBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Label.c: $(srcdir)src/gui/controls/Label.ec $(OBJ)Label.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ListBox.c: $(srcdir)src/gui/controls/ListBox.ec $(OBJ)ListBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Menu.c: $(srcdir)src/gui/controls/Menu.ec $(OBJ)Menu.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Picture.c: $(srcdir)src/gui/controls/Picture.ec $(OBJ)Picture.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ProgressBar.c: $(srcdir)src/gui/controls/ProgressBar.ec $(OBJ)ProgressBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ScrollBar.c: $(srcdir)src/gui/controls/ScrollBar.ec $(OBJ)ScrollBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)StatusBar.c: $(srcdir)src/gui/controls/StatusBar.ec $(OBJ)StatusBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)TabControl.c: $(srcdir)src/gui/controls/TabControl.ec $(OBJ)TabControl.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)PaneSplitter.c: $(srcdir)src/gui/controls/PaneSplitter.ec $(OBJ)PaneSplitter.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Stacker.c: $(srcdir)src/gui/controls/Stacker.ec $(OBJ)Stacker.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)PathBox.c: $(srcdir)src/gui/controls/PathBox.ec $(OBJ)PathBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ToolTip.c: $(srcdir)src/gui/controls/ToolTip.ec $(OBJ)ToolTip.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)SelectorBar.c: $(srcdir)src/gui/controls/SelectorBar.ec $(OBJ)SelectorBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ColorPicker.c: $(srcdir)src/gui/dialogs/ColorPicker.ec $(OBJ)ColorPicker.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)FileDialog.c: $(srcdir)src/gui/dialogs/FileDialog.ec $(OBJ)FileDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)FindDialog.c: $(srcdir)src/gui/dialogs/FindDialog.ec $(OBJ)FindDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)GoToDialog.c: $(srcdir)src/gui/dialogs/GoToDialog.ec $(OBJ)GoToDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)MessageBox.c: $(srcdir)src/gui/dialogs/MessageBox.ec $(OBJ)MessageBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ReplaceDialog.c: $(srcdir)src/gui/dialogs/ReplaceDialog.ec $(OBJ)ReplaceDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)WindowList.c: $(srcdir)src/gui/dialogs/WindowList.ec $(OBJ)WindowList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaDispatch.c: $(srcdir)src/gui/drivers/cocoa/CocoaDispatch.ec $(OBJ)CocoaDispatch.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaInterface.c: $(srcdir)src/gui/drivers/cocoa/CocoaInterface.ec $(OBJ)CocoaInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)NCursesInterface.c: $(srcdir)src/gui/drivers/NCursesInterface.ec $(OBJ)NCursesInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32Interface.c: $(srcdir)src/gui/drivers/Win32Interface.ec $(OBJ)Win32Interface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32ConsoleInterface.c: $(srcdir)src/gui/drivers/Win32ConsoleInterface.ec $(OBJ)Win32ConsoleInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)XInterface.c: $(srcdir)src/gui/drivers/XInterface.ec $(OBJ)XInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)
endif

$(OBJ)TVisionSkin.c: $(srcdir)src/gui/skins/TVisionSkin.ec $(OBJ)TVisionSkin.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)WindowsSkin.c: $(srcdir)src/gui/skins/WindowsSkin.ec $(OBJ)WindowsSkin.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Anchor.c: $(srcdir)src/gui/Anchor.ec $(OBJ)Anchor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)ClipBoard.c: $(srcdir)src/gui/ClipBoard.ec $(OBJ)ClipBoard.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Cursor.c: $(srcdir)src/gui/Cursor.ec $(OBJ)Cursor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Desktop3D.c: $(srcdir)src/gui/Desktop3D.ec $(OBJ)Desktop3D.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)FormDesigner.c: $(srcdir)src/gui/FormDesigner.ec $(OBJ)FormDesigner.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)GuiApplication.c: $(srcdir)src/gui/GuiApplication.ec $(OBJ)GuiApplication.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Interface.c: $(srcdir)src/gui/Interface.ec $(OBJ)Interface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Key.c: $(srcdir)src/gui/Key.ec $(OBJ)Key.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Skin.c: $(srcdir)src/gui/Skin.ec $(OBJ)Skin.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Timer.c: $(srcdir)src/gui/Timer.ec $(OBJ)Timer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)typeEdit.c: $(srcdir)src/gui/typeEdit.ec $(OBJ)typeEdit.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Window.c: $(srcdir)src/gui/Window.ec $(OBJ)Window.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)dcom.c: $(srcdir)src/net/dcom.ec $(OBJ)dcom.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)HTTPFile.c: $(srcdir)src/net/HTTPFile.ec $(OBJ)HTTPFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)network.c: $(srcdir)src/net/network.ec $(OBJ)network.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)NetworkClientFile.c: $(srcdir)src/net/NetworkClientFile.ec $(OBJ)NetworkClientFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Service.c: $(srcdir)src/net/Service.ec $(OBJ)Service.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Socket.c: $(srcdir)src/net/Socket.ec $(OBJ)Socket.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)SSLSocket.c: $(srcdir)src/net/SSLSocket.ec $(OBJ)SSLSocket.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Array.c: $(srcdir)src/com/containers/Array.ec $(OBJ)Array.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)AVLTree.c: $(srcdir)src/com/containers/AVLTree.ec $(OBJ)AVLTree.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)BuiltInContainer.c: $(srcdir)src/com/containers/BuiltInContainer.ec $(OBJ)BuiltInContainer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Container.c: $(srcdir)src/com/containers/Container.ec $(OBJ)Container.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)CustomAVLTree.c: $(srcdir)src/com/containers/CustomAVLTree.ec $(OBJ)CustomAVLTree.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)LinkList.c: $(srcdir)src/com/containers/LinkList.ec $(OBJ)LinkList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)List.c: $(srcdir)src/com/containers/List.ec $(OBJ)List.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)Map.c: $(srcdir)src/com/containers/Map.ec $(OBJ)Map.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)BinaryTree.c: $(srcdir)src/com/BinaryTree.ec $(OBJ)BinaryTree.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)BTNode.c: $(srcdir)src/com/BTNode.ec $(OBJ)BTNode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)dataTypes.c: $(srcdir)src/com/dataTypes.ec $(OBJ)dataTypes.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)instance.c: $(srcdir)src/com/instance.ec $(OBJ)instance.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)String.c: $(srcdir)src/com/String.ec $(OBJ)String.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

$(OBJ)OldList.c: $(srcdir)src/com/OldList.ec $(OBJ)OldList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@ -symbols $(OBJ)

# OBJECT RULES

$(OBJ)Archive.o: $(OBJ)Archive.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)BufferedFile.o: $(OBJ)BufferedFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Date.o: $(OBJ)Date.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DualPipe.o: $(OBJ)DualPipe.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)EARArchive.o: $(OBJ)EARArchive.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)File.o: $(OBJ)File.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c $< -o $@

$(OBJ)FileMonitor.o: $(OBJ)FileMonitor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GlobalAppSettings.o: $(OBJ)GlobalAppSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)JSON.o: $(OBJ)JSON.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)JSONGlobalSettings.o: $(OBJ)JSONGlobalSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)memory.o: $(OBJ)memory.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Mutex.o: $(OBJ)Mutex.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Semaphore.o: $(OBJ)Semaphore.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)System.o: $(OBJ)System.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)TempFile.o: $(OBJ)TempFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Thread.o: $(OBJ)Thread.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Time.o: $(OBJ)Time.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)unicode.o: $(OBJ)unicode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)units.o: $(OBJ)units.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)File.c.o: $(srcdir)src/sys/File.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c $< -o $@

$(OBJ)DualPipe.c.o: $(srcdir)src/sys/DualPipe.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)System.c.o: $(srcdir)src/sys/System.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)i18n.o: $(OBJ)i18n.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Condition.o: $(OBJ)Condition.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Cube.o: $(OBJ)Cube.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)SkyBox.o: $(OBJ)SkyBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Sphere.o: $(OBJ)Sphere.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Object3DSFormat.o: $(OBJ)Object3DSFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Camera.o: $(OBJ)Camera.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Matrix.o: $(OBJ)Matrix.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Mesh.o: $(OBJ)Mesh.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Object.o: $(OBJ)Object.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Plane.o: $(OBJ)Plane.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Quaternion.o: $(OBJ)Quaternion.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Vector3D.o: $(OBJ)Vector3D.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)BMPFormat.o: $(OBJ)BMPFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GIFFormat.o: $(OBJ)GIFFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)JPEGFormat.o: $(OBJ)JPEGFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PCXFormat.o: $(OBJ)PCXFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PNGFormat.o: $(OBJ)PNGFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)RGBFormat.o: $(OBJ)RGBFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-freetype.o: $(srcdir)src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-unicode-tables.o: $(srcdir)src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-unicode.o: $(srcdir)src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-arabic.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-arabic.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-buffer.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-buffer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-gdef.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-gdef.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-gpos.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-gpos.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-gsub.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-gsub.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-hangul.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-hangul.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-hebrew.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-indic.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-indic.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-khmer.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-khmer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-myanmar.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-open.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-open.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-shaper.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-shaper.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-stream.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-stream.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-tibetan.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-impl.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-impl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)harfbuzz-thai.o: $(srcdir)src/gfx/drivers/harfbuzz/harfbuzz-thai.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Direct3D8DisplayDriver.o: $(OBJ)Direct3D8DisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Direct3D9DisplayDriver.o: $(OBJ)Direct3D9DisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)DirectDrawDisplayDriver.o: $(OBJ)DirectDrawDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)GDIDisplayDriver.o: $(OBJ)GDIDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)lfbBlit.o: $(OBJ)lfbBlit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)lfbConvert.o: $(OBJ)lfbConvert.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)LFBDisplayDriver.o: $(OBJ)LFBDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)NCursesDisplayDriver.o: $(OBJ)NCursesDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)OpenGLDisplayDriver.o: $(OBJ)OpenGLDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32BitmapPrinterDisplayDriver.o: $(OBJ)Win32BitmapPrinterDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaOpenGLDisplayDriver.o: $(OBJ)CocoaOpenGLDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32ConsoleDisplayDriver.o: $(OBJ)Win32ConsoleDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32PrinterDisplayDriver.o: $(OBJ)Win32PrinterDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)XDisplayDriver.o: $(OBJ)XDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)cc$(O): $(srcdir)src/gfx/newFonts/cc/cc.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)ccstr$(O): $(srcdir)src/gfx/newFonts/cc/ccstr.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)mm$(O): $(srcdir)src/gfx/newFonts/cc/mm.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) -c $< -o $@

$(OBJ)atlasBuilder$(O): $(OBJ)atlasBuilder.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)drawManager$(O): $(OBJ)drawManager.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)fmFontManager$(O): $(OBJ)fmFontManager.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)fontRenderer$(O): $(OBJ)fontRenderer.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)textureManager$(O): $(OBJ)textureManager.c
	$(CC) $(CFLAGS) $(CUSTOM3_PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)Bitmap.o: $(OBJ)Bitmap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)BitmapResource.o: $(OBJ)BitmapResource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Color.o: $(OBJ)Color.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Display.o: $(OBJ)Display.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DisplaySystem.o: $(OBJ)DisplaySystem.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FontResource.o: $(OBJ)FontResource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Resource.o: $(OBJ)Resource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Surface.o: $(OBJ)Surface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)fontManagement$(O): $(OBJ)fontManagement.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)fontRendering$(O): $(OBJ)fontRendering.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)imgDistMap$(O): $(OBJ)imgDistMap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $< -o $@

$(OBJ)Button.o: $(OBJ)Button.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)CalendarControl.o: $(OBJ)CalendarControl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DataBox.o: $(OBJ)DataBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)DropBox.o: $(OBJ)DropBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)EditBox.o: $(OBJ)EditBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Label.o: $(OBJ)Label.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ListBox.o: $(OBJ)ListBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Menu.o: $(OBJ)Menu.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Picture.o: $(OBJ)Picture.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ProgressBar.o: $(OBJ)ProgressBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ScrollBar.o: $(OBJ)ScrollBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)StatusBar.o: $(OBJ)StatusBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)TabControl.o: $(OBJ)TabControl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PaneSplitter.o: $(OBJ)PaneSplitter.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Stacker.o: $(OBJ)Stacker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)PathBox.o: $(OBJ)PathBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ToolTip.o: $(OBJ)ToolTip.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)SelectorBar.o: $(OBJ)SelectorBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ColorPicker.o: $(OBJ)ColorPicker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FileDialog.o: $(OBJ)FileDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FindDialog.o: $(OBJ)FindDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GoToDialog.o: $(OBJ)GoToDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)MessageBox.o: $(OBJ)MessageBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ReplaceDialog.o: $(OBJ)ReplaceDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)WindowList.o: $(OBJ)WindowList.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaDispatch.o: $(OBJ)CocoaDispatch.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaEcereBridge.o: $(srcdir)src/gui/drivers/cocoa/CocoaEcereBridge.m
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(OSX_TARGET),)
$(OBJ)CocoaInterface.o: $(OBJ)CocoaInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(OSX_TARGET),)
$(OBJ)EcereView.o: $(srcdir)src/gui/drivers/cocoa/EcereView.m
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)NCursesInterface.o: $(OBJ)NCursesInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32Interface.o: $(OBJ)Win32Interface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(WINDOWS_TARGET),)
$(OBJ)Win32ConsoleInterface.o: $(OBJ)Win32ConsoleInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)XInterface.o: $(OBJ)XInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@
endif

$(OBJ)TVisionSkin.o: $(OBJ)TVisionSkin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)WindowsSkin.o: $(OBJ)WindowsSkin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Anchor.o: $(OBJ)Anchor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)ClipBoard.o: $(OBJ)ClipBoard.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Cursor.o: $(OBJ)Cursor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Desktop3D.o: $(OBJ)Desktop3D.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)FormDesigner.o: $(OBJ)FormDesigner.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)GuiApplication.o: $(OBJ)GuiApplication.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Interface.o: $(OBJ)Interface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Key.o: $(OBJ)Key.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Skin.o: $(OBJ)Skin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Timer.o: $(OBJ)Timer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)typeEdit.o: $(OBJ)typeEdit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)gl_compat_4_4.o: $(srcdir)src/gfx/drivers/gl3/gl_compat_4_4.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)glab.o: $(OBJ)glab.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)immediate.o: $(OBJ)immediate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)matrixStack.o: $(OBJ)matrixStack.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)shaders.o: $(OBJ)shaders.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)defaultShader.o: $(OBJ)defaultShader.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Window.o: $(OBJ)Window.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)dcom.o: $(OBJ)dcom.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)HTTPFile.o: $(OBJ)HTTPFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)network.o: $(OBJ)network.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)NetworkClientFile.o: $(OBJ)NetworkClientFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Service.o: $(OBJ)Service.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Socket.o: $(OBJ)Socket.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)SSLSocket.o: $(OBJ)SSLSocket.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

$(OBJ)Array.o: $(OBJ)Array.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)AVLTree.o: $(OBJ)AVLTree.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)BuiltInContainer.o: $(OBJ)BuiltInContainer.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Container.o: $(OBJ)Container.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)CustomAVLTree.o: $(OBJ)CustomAVLTree.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)LinkList.o: $(OBJ)LinkList.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)List.o: $(OBJ)List.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)Map.o: $(OBJ)Map.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)BinaryTree.o: $(OBJ)BinaryTree.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)BTNode.o: $(OBJ)BTNode.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)dataTypes.o: $(OBJ)dataTypes.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)instance.o: $(OBJ)instance.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)String.o: $(OBJ)String.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)OldList.o: $(OBJ)OldList.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)instance.c.o: $(srcdir)src/com/instance.c
	$(CC) $(CFLAGS) $(CUSTOM2_PRJ_CFLAGS) -c $< -o $@

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $< -o $@

cleaneceretarget:
	$(call rm,$(TARGET))

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rm,$(OBJ)symbols.lst)
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
	$(_MAKE) -f Makefile.ecereCOM cleantarget
	$(_MAKE) -f Makefile.vanilla cleantarget

clean: cleantarget
	$(call rm,$(_OBJECTS))
	$(call rm,$(ECOBJECTS1))
	$(call rm,$(ECOBJECTS2))
	$(call rm,$(ECOBJECTS3))
	$(call rm,$(COBJECTS1))
	$(call rm,$(COBJECTS2))
	$(call rm,$(COBJECTS3))
	$(call rm,$(BOWLS1))
	$(call rm,$(BOWLS2))
	$(call rm,$(BOWLS3))
	$(call rm,$(IMPORTS1))
	$(call rm,$(IMPORTS2))
	$(call rm,$(IMPORTS3))
	$(call rm,$(SYMBOLS1))
	$(call rm,$(SYMBOLS2))
	$(call rm,$(SYMBOLS3))
	$(_MAKE) -f Makefile.ecereCOM clean
	$(_MAKE) -f Makefile.vanilla clean

realclean: cleantarget
	$(call rmr,$(OBJ))
	$(_MAKE) -f Makefile.ecereCOM realclean
	$(_MAKE) -f Makefile.vanilla realclean

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;

#troubleshoot:
#	@$(call echo,OBJECTS = $(OBJECTS))

#ifdef WINDOWS
.PHONY: debug_openssl
debug_openssl:
	@$(call echo,OPENSSL_CONF = $(OPENSSL_CONF))
	@$(call echo,_OPENSSL_CONF = $(_OPENSSL_CONF))
	@$(call echo,OPENSSL_INCLUDE_DIR = $(OPENSSL_INCLUDE_DIR))
	@$(call echo,OPENSSL_LIB_DIR = $(OPENSSL_LIB_DIR))
	@$(call echo,OPENSSL_BIN_DIR = $(OPENSSL_BIN_DIR))
#endif
