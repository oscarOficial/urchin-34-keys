#!/bin/bash
# Script to update keymap assets (layout.yaml and layout.svg) from keymap changes
# Runs automatically in pre-commit hook when config/urchin.keymap changes

set -e

KEYMAP_FILE="config/urchin.keymap"
LAYOUT_YAML="layout.yaml"
LAYOUT_SVG="layout.svg"
CONFIG_FILE="keymap-drawer.config.yaml"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔄 Updating keymap assets...${NC}"
echo "============================================================"

# Verify keymap file exists
if [ ! -f "$KEYMAP_FILE" ]; then
    echo -e "${RED}❌ Error: $KEYMAP_FILE not found${NC}"
    exit 1
fi

# Step 1: Parse keymap to YAML
echo -e "${BLUE}📝 Step 1: Parsing $KEYMAP_FILE to $LAYOUT_YAML...${NC}"
if keymap -c "$CONFIG_FILE" parse -z "$KEYMAP_FILE" -o "$LAYOUT_YAML"; then
    echo -e "${GREEN}✓ Parsed keymap to YAML${NC}"
else
    echo -e "${RED}❌ Failed to parse keymap${NC}"
    exit 1
fi

# Step 2: Convert Unicode codes to Spanish symbols in SpanFish layer
echo ""
echo -e "${BLUE}🔤 Step 2: Converting Unicode codes to Spanish symbols...${NC}"
./scripts/fix-layout-unicode.sh | grep -v "^🔍" | grep -v "^===" || true
echo ""

# Step 3: Draw SVG from YAML
echo -e "${BLUE}🎨 Step 3: Drawing $LAYOUT_SVG from $LAYOUT_YAML...${NC}"
if keymap -c "$CONFIG_FILE" draw "$LAYOUT_YAML" -o "$LAYOUT_SVG"; then
    echo -e "${GREEN}✓ Generated SVG layout${NC}"
else
    echo -e "${RED}❌ Failed to generate SVG${NC}"
    exit 1
fi

echo ""
echo "============================================================"
echo -e "${GREEN}✅ Keymap assets updated successfully!${NC}"
echo ""
echo "   Updated files:"
echo "   - $LAYOUT_YAML (parsed from keymap)"
echo "   - $LAYOUT_SVG (visual representation)"
echo ""

exit 0
