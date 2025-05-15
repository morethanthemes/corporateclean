SRC_REPO = .
TARGET_REPO = ../corporateclean/
RSYNC_OPTIONS = -av --delete --exclude='.git' --exclude='Makefile'

.PHONY: help sync

help:
	@echo "Available Makefile tasks:"
	@echo "  sync   - Synchronize files from corporateclean-src/ to corporateplus/"
	@echo "  help   - Show this help message"

sync:
	@echo "Syncing from $(SRC_REPO) to $(TARGET_REPO)"
	@read -p "Are you sure you want to proceed? (y/yes): " confirm; \
	if [ "$$confirm" = "y" ] || [ "$$confirm" = "yes" ]; then \
		rsync $(RSYNC_OPTIONS) $(SRC_REPO)/ $(TARGET_REPO); \
	else \
		echo "Sync canceled."; \
	fi