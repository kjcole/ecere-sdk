.PHONY: freetype jpeg png gif z curl ffi cleantarget clean realclean distclean
ifneq ($(V),1)
.SILENT:
endif

_CF_DIR = ../

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

ifdef WINDOWS_TARGET
all: freetype jpeg png gif ffi z curl
else
ifdef OSX_TARGET
all: jpeg gif
else
all: gif
endif
endif

freetype:
	@$(call echo,Building FreeType...)
	$(call mkdir,freetype-2.3.12)
	+$(call cdmake,freetype-2.3.12,)
	
jpeg:
	@$(call echo,Building libjpeg...)
	$(call mkdir,jpeg-9a)
	+$(call cdmake,jpeg-9a,)

png:
	@$(call echo,Building libpng...)
	$(call mkdir,libpng-1.6.12)
	+$(call cdmake,libpng-1.6.12,)

gif:
	@$(call echo,Building libungif...)
	$(call mkdir,libungif-4.1.1)
	+$(call cdmake,libungif-4.1.1,)

z:
	@$(call echo,Building zlib...)
	$(call mkdir,zlib-1.2.8)
	+$(call cdmake,zlib-1.2.8,)

curl:
	@$(call echo,Building libcurl...)
	+cd curl-7.51.0 && $(_MAKE)

ffi:
	@$(call echo,Building libffi...)
	$(call mkdir,libffi-3.0.11)
	+$(call cdmake,libffi-3.0.11,)

cleantarget:
	+$(call cdmake,freetype-2.3.12,cleantarget)
	+$(call cdmake,libpng-1.6.12,cleantarget)
	+$(call cdmake,zlib-1.2.8,cleantarget)
	+$(call cdmake,jpeg-9a,cleantarget)
	+$(call cdmake,libungif-4.1.1,cleantarget)
	+$(call cdmake,curl-7.51.0,cleantarget)
	+$(call cdmake,libffi-3.0.11,cleantarget)

clean:
	+$(call cdmake,freetype-2.3.12,clean)
	+$(call cdmake,libpng-1.6.12,clean)
	+$(call cdmake,zlib-1.2.8,clean)
	+$(call cdmake,jpeg-9a,clean)
	+$(call cdmake,libungif-4.1.1,clean)
	+$(call cdmake,curl-7.51.0,clean)
	+$(call cdmake,libffi-3.0.11,clean)

realclean:
	+$(call cdmake,freetype-2.3.12,realclean)
	+$(call cdmake,libpng-1.6.12,realclean)
	+$(call cdmake,zlib-1.2.8,realclean)
	+$(call cdmake,jpeg-9a,realclean)
	+$(call cdmake,libungif-4.1.1,realclean)
	+$(call cdmake,curl-7.51.0,realclean)
	+$(call cdmake,libffi-3.0.11,realclean)

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
