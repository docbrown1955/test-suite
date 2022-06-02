CC               = g++-7
CFLAGS 		 = -g -Wall -Wextra -Wpedantic -std=c++17 -fPIC #-Wfatal-errors# -DPRINT_PROG

BINDIR     = bin
PROGDIR    = scripts

MODELDIR   = models/include
 
INCPATH    = 
LIBPATH    = 
INCLIBPATH = $(INCPATH) $(LIBPATH)
LIBS       = -lmarty 
 
PROG     = $(wildcard $(PROGDIR)/*.cpp)
BIN      = $(subst .cpp,.x,      $(subst $(PROGDIR)/,,$(PROG)))

.PHONY: clean

all: $(BIN) 

%.x: $(PROGDIR)/%.cpp 
	$(CC) $(CFLAGS) $< -o $(BINDIR)/$@ $(INCPATH) $(LIBPATH) $(LIBS)

clean:
	rm $(PROGOBJDIR)/*.o;
	rm bin/*.x

