# Keymap Scripts

## Overview

This directory contains automation scripts for managing keymap assets.

## Scripts

### `update-keymap-assets.sh`

Automatically updates all keymap visualization files when `config/urchin.keymap` changes.

**Pipeline:**
1. Parse `config/urchin.keymap` → `layout.yaml` (using keymap-drawer)
2. Convert Unicode codes to Spanish symbols in SpanFish layer
3. Generate `layout.svg` from `layout.yaml` (dark mode)

**Usage:**
```bash
./scripts/update-keymap-assets.sh
```

### `fix-layout-unicode.sh`

Converts Unicode character codes to Spanish symbols in `layout.yaml`.

**Conversions:**
- `'&uc 0xE1 0xC1'` → `'á/Á'`
- `'&uc 0xE9 0xC9'` → `'é/É'`
- `'&uc 0xED 0xCD'` → `'í/Í'`
- `'&uc 0xF3 0xD3'` → `'ó/Ó'`
- `'&uc 0xFA 0xDA'` → `'ú/Ú'`
- `'&uc 0xF1 0xD1'` → `'ñ/Ñ'`

**Usage:**
```bash
./scripts/fix-layout-unicode.sh
```

## Pre-commit Hook

The pre-commit hook automatically runs when you commit changes:

- If `config/urchin.keymap` changed: runs complete update pipeline
- If `layout.yaml` changed manually: only fixes Unicode symbols

All generated files are automatically added to the commit.

## Requirements

- [keymap-drawer](https://github.com/caksoylar/keymap-drawer) - Install with: `pip install keymap-drawer`

## Configuration

Keymap drawing settings are in `keymap-drawer.config.yaml`:
- `dark_mode: true` - Uses dark theme
- `footer_text` - Custom footer text
- Other styling options

See [keymap-drawer documentation](https://github.com/caksoylar/keymap-drawer) for all available options.
