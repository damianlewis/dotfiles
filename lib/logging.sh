#!/bin/bash
# Logging utilities for dotfiles scripts

# Ensure colors are available
SCRIPT_LIB_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_LIB_DIR/styles.sh"

# Log function
log() {
    echo -e "$@"
}

# Log a divider line
# Usage: divider [color]
divider() {
    local color="${1:-$CYAN}"
    log "${color}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Log a boxed header
# Usage: header "Title" [color]
header() {
    local title="$1"
    local color="${2:-$CYAN}"
    echo ""
    divider "$color"
    log "${color}${title}${NC}"
    divider "$color"
}

# Log a success message (green with ✓ icon)
# Usage: success "message" ["prefix"]
success() {
    local prefix="${2:-}"
    log "${prefix}${GREEN}✓ $1${NC}"
}

# Log a success message with a dimmed note
# Usage: success_with_note "message" "note" ["prefix"]
success_with_note() {
    local message="$1"
    local note="$2"
    local prefix="${3:-}"
    log "${prefix}${GREEN}✓ ${message}${NC} ${GREY}(${note})${NC}"
}

# Log a skipped message (yellow)
# Usage: skip "message" ["prefix"]
skip() {
    local prefix="${2:-}"
    log "${prefix}${YELLOW}- $1${NC}"
}

# Log a skip message with a dimmed note
# Usage: skip_with_note "message" "note" ["prefix"]
skip_with_note() {
    local message="$1"
    local note="$2"
    local prefix="${3:-}"
    log "${prefix}${YELLOW}- ${message}${NC} ${GREY}(${note})${NC}"
}

# Log a warning message (yellow with ⚠ icon)
# Usage: warn "message" ["prefix"]
warn() {
    local prefix="${2:-}"
    log "${prefix}${YELLOW}⚠ $1${NC}"
}

# Log an error message (red with ✗ icon)
# Usage: error "message" ["prefix"]
error() {
    local prefix="${2:-}"
    log "${prefix}${RED}✗ $1${NC}"
}

# Log a step message (no icon, for announcing a step in a process)
# Usage: step "message" ["prefix"]
step() {
    local prefix="${2:-}"
    log "${prefix}$1"
}

# Log an informational message (with - icon)
# Usage: info "message" ["prefix"]
info() {
    local prefix="${2:-}"
    log "${prefix}- $1"
}

# Log a detail message (dimmed, for secondary/contextual info)
# Usage: detail "message" [show_dash] ["prefix"]
detail() {
    local message="$1"
    local show_dash="${2:-false}"
    local prefix="${3:-}"
    if [ "$show_dash" = true ]; then
        log "${prefix}${GREY}- ${message}${NC}"
    else
        log "${prefix}${GREY}${message}${NC}"
    fi
}
