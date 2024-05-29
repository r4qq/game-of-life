# Define the compiler
CXX = g++

# Define the flags for the compiler
CXXFLAGS = -Wall -Wextra -Iinclude

# Define the directories
SRCDIR = src
INCDIR = include
LIBDIR = lib
OBJDIR = obj
BINDIR = bin

# Define the target executable
TARGET = $(BINDIR)/game_of_life

# Find all source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# Generate object files from source files
OBJECTS = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SOURCES))

# Define libraries to link (if any)
LIBS = -L$(LIBDIR) 

# Default rule to build the target
all: $(TARGET)

# Rule to link the target executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

# Rule to compile source files into object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Create the bin directory if it doesn't exist
$(BINDIR):
	mkdir -p $(BINDIR)

# Create the obj directory if it doesn't exist
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Clean up build artifacts
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Print a message after successful build
.PHONY: all clean
all: $(TARGET)
	@echo "Build complete!"