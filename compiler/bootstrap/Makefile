.PHONY: bindir ecere libec ecp ecc ecs cleantarget clean realclean distclean
ifneq ($(V),1)
.SILENT:
endif

OBJ = obj/bin.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

_CF_DIR = ../../

ifndef _CPLMK
_CPLMK := crossplatform.mk
endif
include $(srcdir)$(_CF_DIR)$(_CPLMK)
include $(srcdir)$(_CF_DIR)default.cf

all: bindir ecere libec ecp ecc ecs
	$(call cp,ecp/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecp$(E) ecc/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(E) ecs/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(E),$(OBJ))
	@$(call echo,All done!)

bindir:
	$(call mkdir,$(OBJ))

ecere:
	@$(call echo,Building ecere...)
	$(call mkdir,ecere)
	+$(call cdmake,ecere,)

libec:
	@$(call echo,Building ec...)
	$(call mkdir,libec)
	+$(call cdmake,libec,)

ecp: ecere libec
	@$(call echo,Building ecp...)
	$(call mkdir,ecp)
	+$(call cdmake,ecp,)

ecc: ecere libec
	@$(call echo,Building ecc...)
	$(call mkdir,ecc)
	+$(call cdmake,ecc,)

ecs: ecere libec
	@$(call echo,Building ecs...)
	$(call mkdir,ecs)
	+$(call cdmake,ecs,)

cleantarget:
	$(call rm,$(OBJ)ecp$(E) $(OBJ)ecc$(E) $(OBJ)ecs$(E))
ifdef WINDOWS_TARGET
	$(call rm,$(OBJ)$(LP)ecere$(SO) $(OBJ)$(LP)ec$(SO))
endif

clean: cleantarget
	+$(call cdmake,ecere,clean)
	+$(call cdmake,libec,clean)
	+$(call cdmake,ecp,clean)
	+$(call cdmake,ecc,clean)
	+$(call cdmake,ecs,clean)

realclean: cleantarget
	$(call rmr,$(OBJ))
	+$(call cdmake,ecere,realclean)
	+$(call cdmake,libec,realclean)
	+$(call cdmake,ecp,realclean)
	+$(call cdmake,ecc,realclean)
	+$(call cdmake,ecs,realclean)

distclean:
	$(_MAKE) -f $(srcdir)$(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
