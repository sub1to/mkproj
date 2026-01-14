BUILD_DIR := .projects/gmake

.PHONY: %
%:
	@$(MAKE) --no-print-directory -C $(BUILD_DIR) $@

all:
	@$(MAKE) --no-print-directory -C $(BUILD_DIR)
