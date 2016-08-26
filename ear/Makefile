ifneq ($(V),1)
.SILENT:
endif
.PHONY: all nores cleantarget clean realclean distclean

_CF_DIR = ../

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

all:
	@$(call echo,Building self-extract tool...)
	$(call mkdir,extract)
	+$(call cdmake,extract,)
	@$(call echo,Building eAR command line tool...)
	$(call mkdir,cmd)
	+$(call cdmake,cmd,)

nores:
	@$(call echo,Building eAR command line tool...)
	$(call mkdir,cmd)
	+$(call cdmake,cmd,nores)

cleantarget:
	$(call mkdir,extract)
	+$(call cdmake,extract,cleantarget)
	$(call mkdir,cmd)
	+$(call cdmake,cmd,cleantarget)

clean:
	$(call mkdir,extract)
	+$(call cdmake,extract,clean)
	$(call mkdir,cmd)
	+$(call cdmake,cmd,clean)

realclean:
	$(call mkdir,extract)
	+$(call cdmake,extract,realclean)
	$(call mkdir,cmd)
	+$(call cdmake,cmd,realclean)

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
