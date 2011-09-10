

dotfiles_git = $(wildcard _.*)
dotfiles     = $(subst _.,.,$(dotfiles_git))

PREFIX ?= $(HOME)

LN ?= ln

# Replace this with something that finds comonalities from $(PWD),$(PREFIX) and then ... bleh.
srcdir_from_prefix = $(PREFIX)/dotfiles

ifndef V
QUIET_LN = @echo "LN $@";
endif

$(PREFIX)/% : _%
	$(QUIET_LN)$(LN) -i -s $(srcdir_from_prefix)/$< $@

all: $(addprefix $(PREFIX)/,$(dotfiles))