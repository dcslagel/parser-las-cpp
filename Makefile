# ------------------------------------------------------------------------------
# Clang Compiler
# ------------------------------------------------------------------------------
# CXX    = /Library/Developer/CommandLineTools/usr/bin/clang++
# CXXFLAGS = -std=c++14 -Wall -Wextra -Weverything -Wno-c++98-compat

# ------------------------------------------------------------------------------
# GCC Compiler
# ------------------------------------------------------------------------------
GNU_VER = 9
CXX     := /usr/local/opt/gcc/bin/g++-$(GNU_VER)
# CXX   = /usr/local/opt/gcc/bin/c++-$(GNU_VER)
CXXFLAGS := -std=c++14 -Wall -Wextra -Wpedantic -pedantic-errors
# GCC compiler ------------------------------------------------#

# ------------------------------------------------------------------------------
# Compiler variables
# ------------------------------------------------------------------------------
DEBUG  = -g -O0

# ------------------------------------------------------------------------------
# Tool variables
# ------------------------------------------------------------------------------
# f: force removal, v: verbose (list files removed)
RM     = /bin/rm -fv

# ------------------------------------------------------------------------------
# Project variables
# ------------------------------------------------------------------------------
PRG      = lasUtil
LAS_FILE = sample_2.0.las

SRCS     = $(wildcard $(DIR_SRC)/*.cpp)
OBJS     = $(subst .cpp,.o,($SRCS)

# ------------------------------------------------------------------------------
#  Directory variables
# ------------------------------------------------------------------------------
DIR_DATA = examples
DIR_REL  = build/rel
DIR_SRC  = src

# ------------------------------------------------------------------------------
#  vpaths
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Make release targets
# ------------------------------------------------------------------------------
all: $(PRG)

$(PRG): $(DIR_REL)/$(PRG)

$(DIR_REL)/$(PRG): $(SRCS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $^ -o $(DIR_REL)/$(PRG)

run_rel:
	@echo "#----------------------------------------#"
	@echo "LAS_FILE: [$(LAS_FILE)]"
	@echo "#----------------------------------------#"
	./$(DIR_REL)/$(PRG) -f $(DIR_DATA)/$(LAS_FILE)

clean_rel:
	$(RM) $(DIR_REL)/$(PRG)


# ------------------------------------------------------------------------------
# General project maintenance targets
# ------------------------------------------------------------------------------
.PHONEY: clean
clean:
	$(RM) -r $(DIR_REL)


# ------------------------------------------------------------------------------
#  Help
# ------------------------------------------------------------------------------
AWK = /usr/bin/awk
SORT = /usr/bin/sort

.PHONEY: help
help:
	@$(MAKE) --print-data-base --question | \
		$(AWK) '/^[^.%][-A-Za-z0-9_]*:/ {print substr($$1, 1, length($$1)-1)}' | \
		$(SORT)
