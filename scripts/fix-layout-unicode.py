#!/usr/bin/env python3
"""
Script para convertir códigos Unicode a símbolos españoles en layout.yaml
Se ejecuta automáticamente antes de cada commit (pre-commit hook)
"""

import re
import sys
from pathlib import Path

# Mapeo de códigos Unicode a símbolos españoles
UNICODE_MAP = {
    '0xE1 0xC1': 'á/Á',  # a con acento
    '0xE9 0xC9': 'é/É',  # e con acento
    '0xED 0xCD': 'í/Í',  # i con acento
    '0xF3 0xD3': 'ó/Ó',  # o con acento
    '0xFA 0xDA': 'ú/Ú',  # u con acento
    '0xF1 0xD1': 'ñ/Ñ',  # eñe
}

def fix_unicode_in_layout(file_path: Path) -> bool:
    """
    Convierte códigos Unicode a símbolos españoles en layout.yaml

    Args:
        file_path: Ruta al archivo layout.yaml

    Returns:
        True si se realizaron cambios, False si no
    """
    if not file_path.exists():
        print(f"❌ Error: No se encontró {file_path}")
        return False

    # Leer el contenido del archivo
    content = file_path.read_text(encoding='utf-8')
    original_content = content

    # Buscar y reemplazar códigos Unicode solo en la capa SpanFish
    in_spanfish = False
    lines = content.split('\n')
    modified = False

    for i, line in enumerate(lines):
        # Detectar inicio de capa SpanFish
        if line.strip().startswith('SpanFish:'):
            in_spanfish = True
            continue

        # Detectar fin de capa SpanFish (siguiente capa o combos)
        if in_spanfish and (line.strip().startswith('combos:') or
                           (line and not line.startswith(' ') and ':' in line)):
            in_spanfish = False
            continue

        # Reemplazar códigos Unicode solo dentro de SpanFish
        if in_spanfish and '&uc' in line:
            for unicode_code, symbol in UNICODE_MAP.items():
                pattern = f"'&uc {unicode_code}'"
                if pattern in line:
                    lines[i] = line.replace(pattern, f"'{symbol}'")
                    modified = True
                    print(f"✓ Convertido: {pattern} → '{symbol}'")

    if modified:
        # Guardar los cambios
        content = '\n'.join(lines)
        file_path.write_text(content, encoding='utf-8')
        print(f"\n✅ Archivo {file_path.name} actualizado con símbolos españoles")
        return True
    else:
        print(f"ℹ️  No se encontraron códigos Unicode para convertir en {file_path.name}")
        return False

def main():
    """Función principal"""
    # Obtener ruta del archivo layout.yaml
    script_dir = Path(__file__).parent
    project_dir = script_dir.parent
    layout_file = project_dir / 'layout.yaml'

    print("🔍 Verificando códigos Unicode en layout.yaml...")
    print("=" * 60)

    # Convertir códigos Unicode a símbolos
    modified = fix_unicode_in_layout(layout_file)

    print("=" * 60)

    if modified:
        print("\n💡 Los cambios se guardaron automáticamente.")
        print("   El archivo está listo para el commit.")
        return 0
    else:
        return 0

if __name__ == '__main__':
    sys.exit(main())
