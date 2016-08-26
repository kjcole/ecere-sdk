.PHONY: all bootstrap cleantarget clean realclean distclean libec ecp ecc ecs
ifneq ($(V),1)
.SILENT:
endif

CONFIG := release

_CF_DIR = ../

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

all: ecp ecc ecs

libec:
	@$(call echo,Building 2nd stage libec...)
	$(call mkdir,libec)
	+$(call cdmake,libec,)

ecp: libec
	@$(call echo,Building 2nd stage ecp...)
	$(call mkdir,ecp)
	+$(call cdmake,ecp,)

ecc: libec
	@$(call echo,Building 2nd stage ecc...)
	$(call mkdir,ecc)
	+$(call cdmake,ecc,)

ecs: libec
	@$(call echo,Building 2nd stage ecs...)
	$(call mkdir,ecs)
	+$(call cdmake,ecs,)

bootstrap:
	@$(call echo,Bootstrapping eC compiling tools...)
	$(call mkdir,bootstrap)
	+$(call cdmake,bootstrap,)

cleantarget:
	+$(call cdmake,bootstrap,cleantarget)
	+$(call cdmake,libec,cleantarget)
	+$(call cdmake,ecp,cleantarget)
	+$(call cdmake,ecc,cleantarget)
	+$(call cdmake,ecs,cleantarget)

clean:
	+$(call cdmake,bootstrap,clean)
	+$(call cdmake,libec,clean)
	+$(call cdmake,ecp,clean)
	+$(call cdmake,ecc,clean)
	+$(call cdmake,ecs,clean)

realclean:
	+$(call cdmake,bootstrap,realclean)
	+$(call cdmake,libec,realclean)
	+$(call cdmake,ecp,realclean)
	+$(call cdmake,ecc,realclean)
	+$(call cdmake,ecs,realclean)

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
