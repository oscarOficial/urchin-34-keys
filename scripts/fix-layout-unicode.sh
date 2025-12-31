#!/bin/bash
# Script to convert Unicode codes to Spanish symbols in layout.yaml
# Runs automatically before each commit (pre-commit hook)

LAYOUT_FILE="layout.yaml"
TEMP_FILE=$(mktemp)

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Checking Unicode codes in layout.yaml...${NC}"
echo "============================================================"

# Verify file exists
if [ ! -f "$LAYOUT_FILE" ]; then
    echo -e "${YELLOW}❌ Error: $LAYOUT_FILE not found${NC}"
    exit 1
fi

# Copy original file
cp "$LAYOUT_FILE" "$TEMP_FILE"

# Changes counter
CHANGES=0

# Apply replacements using sed
sed -i.bak \
    -e "s/'&uc 0xE1 0xC1'/'á\/Á'/g" \
    -e "s/'&uc 0xE9 0xC9'/'é\/É'/g" \
    -e "s/'&uc 0xED 0xCD'/'í\/Í'/g" \
    -e "s/'&uc 0xF3 0xD3'/'ó\/Ó'/g" \
    -e "s/'&uc 0xFA 0xDA'/'ú\/Ú'/g" \
    -e "s/'&uc 0xF1 0xD1'/'ñ\/Ñ'/g" \
    "$LAYOUT_FILE"

# Check if there were changes
if ! diff -q "$LAYOUT_FILE" "$TEMP_FILE" > /dev/null 2>&1; then
    # Count how many changes were made
    CHANGES=$(diff "$TEMP_FILE" "$LAYOUT_FILE" | grep -c "^<" || true)

    echo -e "${GREEN}✓ Converted $CHANGES Unicode codes → Spanish symbols${NC}"
    echo ""
    echo -e "${GREEN}✅ File $LAYOUT_FILE updated${NC}"
    echo "============================================================"
    echo -e "${YELLOW}💡 Changes saved automatically.${NC}"
    echo "   File is ready for commit."

    # Clean up temporary files
    rm -f "$TEMP_FILE" "${LAYOUT_FILE}.bak"
else
    echo -e "${BLUE}ℹ️  No Unicode codes found to convert${NC}"
    echo "============================================================"
    rm -f "$TEMP_FILE" "${LAYOUT_FILE}.bak"
fi

exit 0
