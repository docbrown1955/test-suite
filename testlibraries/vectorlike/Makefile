INSTALLDIR=/home/uhlrich/.local

CC = gcc-7
CXX = g++-7
FC = gfortran-7
VERSION=1.0

CXXDEBUG  = $(CXX) -g -D DEBUG
CXXFLAGS  = -Wall -Wextra -Wpedantic -Wfatal-errors -std=c++17 -O3 -fPIC

SRCDIR     = src
HEADDIR    = include
OBJDIR     = obj
BINDIR     = bin
PROGDIR    = scripts
PROGOBJDIR = scripts/obj
MAKE       = /usr/bin/make

IPATH      = -I./$(HEADDIR) -I$(JSONDIR)/$(HEADDIR)
LIBS       = -lmarty
 
SRC      = $(wildcard $(SRCDIR)/*.cpp)
PROG     = $(wildcard $(PROGDIR)/*.cpp)
OBJ      = $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o) 
OBJDEBUG = $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%_debug.o) 
	
BIN      = $(subst .cpp,.x,$(subst $(PROGDIR)/,,$(PROG)))
BINDEBUG = $(subst .x,_debug.x,$(BIN))

.PHONY: install clean

.PRECIOUS: $(OBJDIR)/%.o
.PRECIOUS: $(PROGOBJDIR)/%.o
.PRECIOUS: $(OBJDIR)/%_debug.o
.PRECIOUS: $(PROGOBJDIR)/%_debug.o

all: $(BIN) $(BINDEBUG)

# Création des différents *.o à partir des *.cpp
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $< $(IPATH)

# Compilation des différents programmes main
$(PROGOBJDIR)/%.o: $(PROGDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $< $(IPATH)

%.x: $(PROGOBJDIR)/%.o $(OBJ) 
	$(CXX) $(CXXFLAGS) -o $(BINDIR)/$@ $(jsonOBJ) $^ $(IPATH) $(LIBS)


# Version avec deboggage 
$(OBJDIR)/%_debug.o: $(SRCDIR)/%.cpp
	$(CXXDEBUG) $(CXXFLAGS) -o $@ -c $< $(IPATH)

$(PROGOBJDIR)/%_debug.o: $(PROGDIR)/%.cpp
	$(CXXDEBUG) $(CXXFLAGS) -o $@ -c $< $(IPATH)
 
%_debug.x:$(PROGOBJDIR)/%_debug.o  $(OBJDEBUG)
	$(CXXDEBUG) $(CXXFLAGS) -o $(BINDIR)/$@ $(jsonOBJDEBUG) $^ $(IPATH) $(LIBS)

clean:
	-rm -f $(OBJDIR)/*.o;
	-rm -f $(PROGOBJDIR)/*.o;
	-rm -f $(BINDIR)/*.x;
