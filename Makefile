APP	     = hello		# Add app name here
SRCEXT 	 = cpp
SRCDIR	 = src
OBJDIR	 = obj
BINDIR	 = bin

SRCS   	:= $(shell find $(SRCDIR) -name '*.$(SRCEXT)')
SRCDIRS	:= $(shell find . -name '*.$(SRCEXT)' -exec dirname {} \; | uniq)
OBJS		:= $(patsubst %.$(SRCEXT),$(OBJDIR)/%.o,$(SRCS))

DEBUG		  = -g
INCLUDES  = -I./includes
CFLAGS	  = -c $(DEBUG) $(INCLUDES) -std=c++2a
LDFLAGS		=

ifeq ($(SRCEXT),cpp)
CC				= $(CXX)
else
CFLAGS	+= -std=c++2a
endif

.PHONY: all clean distclean

all: $(BINDIR)/$(APP)

$(BINDIR)/$(APP): buildrepo $(OBJS)
	@mkdir -p `dirname $@`
	@echo "Linking $@..."
	@$(CC) $(OBJS) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: %.$(SRCEXT)
	@echo "Generating dependencies for $<..."
	@$(call make-depend,$<,$@,$(subst .o,.d,$@))
	@echo "Compiling $<..."
	@$(CC) $(CFLAGS) $< -o $@

run:
	@./$(BINDIR)/$(APP)

clean:
	$(RM) -r $(OBJDIR)

distclean: clean
	$(RM) -r $(BINDIR)

buildrepo:
	@$(call make-repo)

define make-repo
	for dir in $(SRCDIRS); \
	do \
		mkdir -p $(OBJDIR)/$$dir; \
	done
endef

# usage: $(call make-depend, source-file, object-file, depend-file)
define make-depend
	$(CC) -MM				\
			  -MF $3		\
				-MP				\
				-MT $2		\
				$(CFLAGS)	\
				$1
endef
