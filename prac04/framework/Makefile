# For debugging purposes, set -O0 and -g.
# For production use, set -O3.
CXXFLAGS = -O3 -g -Wall -pedantic 
LDLIBS = 
CXX = g++
COMPILE.cc = ${CXX} ${CXXFLAGS} ${CPPFLAGS} -c

SOURCES := $(wildcard [^_]*.cc)
OBJECTS := ${SOURCES:.cc=.o}
BINARY = raytrace

all: $(OBJECTS)
	$(CXX) -o $(BINARY) $(OBJECTS) $(LDLIBS)

%.o: %.cc
	${COMPILE.cc} -o $@ $<

clean:
	$(RM) $(BINARY) $(OBJECTS)
