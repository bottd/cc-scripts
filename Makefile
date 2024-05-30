SRC_DIR := .
OUT_DIR := build
FENNEL := fennel

# List all Fennel files in the source directory and its subdirectories
FENNEL_FILES := $(shell find $(SRC_DIR) -type f -name '*.fnl')

# Transform Fennel files into Lua files in the output directory
LUA_FILES := $(patsubst $(SRC_DIR)/%.fnl,$(OUT_DIR)/%.lua,$(FENNEL_FILES))

# Define the default target to convert Fennel files to Lua files
.PHONY: all
all: $(LUA_FILES)


# Rule to convert a Fennel file to a Lua file
$(OUT_DIR)/%.lua: $(SRC_DIR)/%.fnl
	@mkdir -p $(dir $@)
	$(FENNEL) --compile $< > $@

# Clean up generated Lua files
.PHONY: clean
clean:
	rm -rf $(OUT_DIR)
