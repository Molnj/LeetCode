# Define the source and object directories
SRC_DIR = src
OBJ_DIR = obj

# Get a list of all C source files in the src directory
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)

# Determine the target platform (default to LINUX)
TARGET_PLATFORM ?= LINUX

# Generate a list of corresponding ELF files in the obj directory
ELF_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.elf,$(SRC_FILES))

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -g

# Rule to build all ELF files
all: $(ELF_FILES)

# Rule to build ELF files from C source files
$(OBJ_DIR)/%.elf: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) $< -o $@

# Rule to create the obj directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Phony target to clean the build
.PHONY: clean
clean:
	rm -rf $(OBJ_DIR)
