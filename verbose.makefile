ifneq (,$(VERBOSE))
    override VERBOSE:=
else
    override VERBOSE:=@
endif
