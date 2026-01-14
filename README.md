# Urchin ZMK Firmware Configuration

<div align="center">

![ZMK](https://img.shields.io/badge/ZMK-Firmware-blue?style=for-the-badge)
![Keyboard](https://img.shields.io/badge/Keyboard-Urchin-orange?style=for-the-badge)
![Keys](https://img.shields.io/badge/Keys-34-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

**Configuración personalizada de ZMK para el teclado Urchin (34 teclas)**

*Optimizada para programación con Neovim y escritura en español*

✨ **Con soporte Unicode nativo para acentos españoles** - Funciona con layout US estándar

[📥 Descargar](#-instalación) •
[📖 Documentación](#-características) •
[🎨 Layout Visual](layout.svg)

</div>

---

## 📸 Vista Previa

![Urchin Layout](layout.svg)

---

## 🎯 Características

### Layout de 34 teclas
- 3x5 teclas principales por mano (30 total)
- 2 teclas de pulgar por mano (4 total)

### Capas
1. **BASE**: QWERTY con home row mods (solo mano izquierda)
2. **LOWER**: Números y símbolos de programación (brackets simétricos)
3. **RAISE**: Gestión de ventanas y navegación (optimizado para Ubuntu/GNOME)
4. **ADJUST**: Configuración Bluetooth y controles multimedia
5. **SpanFish**: Acentos españoles + F1-F12 en home row (Unicode nativo)

### Home Row Mods
- **Mano izquierda**: A(Ctrl), S(Alt), D(GUI), F(Shift)
- **Mano derecha**: Sin modificadores (optimizado para Neovim - J/K/L libres)

### Combos útiles (Sistema organizado con simetría)

**🔧 Utilidades:**
- **J + K**: ESC (perfecto para salir de modo insertar en Vim)
- **W + E**: TAB
- **F + J** (ambos Shifts): Caps Word

**📝 Comillas (mano izquierda, posiciones análogas):**
- **A + S**: `'` (comilla simple)
- **Z + X**: `"` (comilla doble)

**🔺 Ángulos (mano derecha, posiciones análogas):**
- **K + L**: `<` (HTML tags, comparaciones)
- **, + .**: `>` (HTML tags, comparaciones)

**➖ Guiones (mano izquierda, posiciones análogas):**
- **S + D**: `-` (minus, kebab-case)
- **X + C**: `_` (underscore, snake_case)

**🎯 Símbolos de programación:**
- **D + F**: `=` (igual)
- **F + G**: `+` (más)
- **E + R**: `:` (dos puntos - JSON, CSS)
- **Q + W**: `~` (tilde - regex, paths)
- **R + T**: `` ` `` (backtick - template literals)

**✏️ Atajos de edición:**
- **L + ;**: Ctrl+A (seleccionar todo - combo mano derecha)

**🌐 Español + F-keys (Unicode nativo - funciona con layout US estándar):**
- Activa la capa SpanFish manteniendo el pulgar derecho desde LOWER o RAISE
- **Vocales acentuadas minúsculas:**
  - **SpanFish + A**: á
  - **SpanFish + E**: é
  - **SpanFish + U**: ú
  - **SpanFish + I**: í
  - **SpanFish + O**: ó
- **Vocales acentuadas mayúsculas:**
  - **SpanFish + Shift + A**: Á
  - **SpanFish + Shift + E**: É
  - **SpanFish + Shift + U**: Ú
  - **SpanFish + Shift + I**: Í
  - **SpanFish + Shift + O**: Ó
- **Ñ / ñ:**
  - **SpanFish + N**: ñ
  - **SpanFish + Shift + N**: Ñ
- **F-keys (F1-F12):**
  - **F1**: Posición Q (fila superior)
  - **F2-F10**: Home row (S, D, F, G, H, J, K, L, ;)
  - **F11-F12**: Fila inferior (Z, X)

## 🚀 Instalación

### 1. Fork este repositorio

Haz fork de este repo en tu cuenta de GitHub.

### 2. Habilita GitHub Actions

Ve a la pestaña "Actions" y habilita los workflows.

### 3. Compila el firmware

El firmware se compilará automáticamente con cada push a `main`. Los archivos `.uf2` estarán disponibles en los artifacts de la acción.

### 4. Flashea el teclado

1. Descarga los archivos `.uf2` de los artifacts
2. Conecta cada mitad del teclado en modo bootloader (doble tap en reset)
3. Arrastra el archivo correspondiente al almacenamiento USB que aparece:
   - `urchin_left_nice_view.uf2` → Mitad izquierda
   - `urchin_right_nice_view.uf2` → Mitad derecha

### 5. Reset de configuración (si es necesario)

Si necesitas resetear la configuración Bluetooth:
1. Flashea `settings_reset.uf2` en ambas mitades
2. Vuelve a flashear el firmware normal

## 📝 Estructura del Proyecto

```

urchin-34-keys/
├── .github/
│   └── workflows/
│       └── build.yml                # GitHub Actions para compilación automática
├── config/
│   ├── urchin.keymap                # Definición del layout y capas
│   ├── urchin.conf                  # Configuración de ZMK
│   └── west.yml                     # Dependencias: ZMK + zmk-unicode
├── scripts/
│   ├── update-keymap-assets.sh      # Auto-actualiza layout.yaml y layout.svg
│   ├── fix-layout-unicode.sh        # Convierte códigos Unicode a símbolos españoles
│   └── README.md                    # Documentación de scripts
├── keymap-drawer.config.yaml        # Configuración generador visual (modo oscuro)
├── layout.yaml                      # Definición keymap (auto-generado)
├── layout.svg                       # Diagrama visual del layout (auto-generado, modo oscuro)
├── build.yaml                       # Configuración de compilación
└── README.md                        # Este archivo
```

### Flujo Automatizado

Este proyecto incluye un **pre-commit hook** que automáticamente:
1. Parsea `config/urchin.keymap` → `layout.yaml`
2. Convierte códigos Unicode a símbolos españoles (á é í ó ú ñ)
3. Genera `layout.svg` con estilo modo oscuro

¡Cuando modificas `config/urchin.keymap` y haces commit, todos los assets visuales se actualizan automáticamente!

### Módulos externos utilizados

Este proyecto incluye las siguientes dependencias en `config/west.yml`:

- **zmk** (v0.3.0) - Firmware base de ZMK
- **urchin-zmk-module** - Módulo específico del hardware Urchin
- **nice-view-gem** - Soporte para displays nice!view
- **zmk-unicode** (v0.3) - Soporte Unicode nativo para acentos españoles

## 🎨 Layout por capas

### Capa BASE
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│      Q      │      W      │      E      │      R      │      T      │   │      Y      │      U      │      I      │      O      │      P      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│   A (Ctrl)  │   S (Alt)   │   D (GUI)   │  F (Shift)  │      G      │   │      H      │      J      │      K      │      L      │      ;      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      Z      │      X      │      C      │      V      │      B      │   │      N      │      M      │      ,      │      .      │      /      │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │  ESC(LOWER) │     BSPC    │   │ RET (Shift) │ SPC (RAISE) │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯
```

### Capa LOWER (Números y Símbolos - Brackets Simétricos)
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│      1      │      2      │      3      │      4      │      5      │   │      6      │      7      │      8      │      9      │      0      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      $      │      (      │      {      │      [      │      %      │   │      ^      │      ]      │      }      │      )      │      !      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      `      │      ~      │      @      │      #      │      -      │   │      =      │      *      │      &      │      \      │      |      │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │    ______   │     DEL     │   │  SpanFish   │   ADJUST    │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯

Brackets simétricos: Izquierda abre ( { [ | Derecha cierra ] } )
Brackets en anular/medio/índice (más ergonómico - libera el meñique)
```

### Capa RAISE (Gestión de Ventanas y Navegación)
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│   Alt+F4    │   Alt+Tab   │ Alt+Sft+Tab │  Super+Tab  │  Super+D    │   │     WS←     │    Tile←    │     Max     │    Tile→    │     WS→     │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│    MON←     │    Shift    │     GUI     │    MON→     │     Min     │   │      ←      │      ↓      │      ↑      │      →      │   PSCRN     │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│  Undo(^Z)   │  Cut(^X)    │ Copy+(^S^C) │Paste+(^S^V) │  Redo(^Y)   │   │    HOME     │   PG_DN     │   PG_UP     │     END     │    INS      │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │   ADJUST    │     DEL     │   │  SpanFish   │    ______   │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯

Gestión de Ventanas (Ubuntu/GNOME):
- Alt+Tab / Alt+Shift+Tab: Cambiar entre aplicaciones (adelante/atrás)
- Super+Tab: Mostrar todas las apps | Super+D: Mostrar escritorio
- Tile←/Tile→/Max: Super+Izq/Der/Arriba (tiling de ventanas)
- Min: Super+H (minimizar) | Alt+F4: Cerrar ventana (Q)
- MON←/MON→: Super+Shift+Izq/Der (mover ventana entre monitores A/F)
- WS←/WS→: Ctrl+Alt+Izq/Der (cambiar workspaces)
- Shift (S): Para selección de texto con flechas
- Navegación: Flechas estilo Vim (HJKL) en home row derecha
- Copy/Paste: Ctrl+Shift+C/V (compatible con terminal/portapapeles sistema)
- F1-F12: Disponibles en capa SpanFish (acceso ergonómico home row)
```

### Capa ADJUST (Bluetooth y Media)
```
╭─────┬─────┬─────┬─────┬─────╮   ╭─────┬─────┬─────┬─────┬─────╮
│ BT0 │ BT1 │ BT2 │ BT3 │ BT4 │   │BTCLR│     │     │     │     │
├─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┤
│BOOT │     │     │     │ OUT │   │ VOL-│ VOL+│ PREV│ NEXT│ PLAY│
├─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┤
│     │     │     │     │     │   │ MUTE│ BRI-│ BRI+│     │     │
╰─────┴─────┴─────┼─────┼─────┤   ├─────┼─────┼─────┴─────┴─────╯
                  │ __  │ __  │   │ __  │ __  │
                  ╰─────┴─────╯   ╰─────┴─────╯
```

### Capa SpanFish (Español + F-keys)
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│     F1      │             │      é      │             │             │   │             │      ú      │      í      │      ó      │             │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      á      │     F2      │     F3      │     F4      │     F5      │   │     F6      │     F7      │     F8      │     F9      │    F10      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│     F11     │     F12     │             │             │             │   │      ñ      │             │             │             │             │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │             │             │   │   [HELD]    │             │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯

Diseño ergonómico: F1-F12 + caracteres acentuados españoles
F1 en Q, F2-F10 en home row (S-;), F11-F12 en Z-X
Acentos en posiciones naturales: A(á), E(é), U(ú), I(í), O(ó), N(ñ)
Con Shift: Á É Í Ó Ú Ñ (mayúsculas automáticas)
Unicode nativo - Funciona con layout US estándar
Requiere IBus en Linux (incluido por defecto en Ubuntu)
```


## 🔧 Personalización

Para personalizar el layout:

1. Edita `config/urchin.keymap`
2. Haz commit y push a tu repositorio
3. GitHub Actions compilará automáticamente el nuevo firmware
4. Descarga los archivos `.uf2` de los artifacts y flashea

### Ajustes optimizados para programación

**Configuración actual (`config/urchin.conf`):**
- **Sleep timeout**: 30 minutos (1800000ms) - ideal para largas sesiones
- **Debounce press**: 3ms - balance entre velocidad y estabilidad
- **Debounce release**: 5ms
- **Logging USB**: Desactivado para mayor batería

**Timings del keymap (`config/urchin.keymap`):**
- **Home row mods**: 250ms - balance óptimo para typing rápido
- **Quick tap**: 175ms
- **Combos**: 50ms - activación instantánea
- **Prior idle**: 150ms - previene activaciones accidentales

## 💡 Consejos de Uso

### Para Programación Web
- **HTML/JSX**: Combos `<` (K+L) y `>` (,+.) para tags rápidos
- **JavaScript**:
  - Template literals `` ` `` (R+T)
  - Variables snake_case `_` (X+C) y kebab-case `-` (S+D)
  - Operadores `=` (D+F), `+` (F+G)
- **CSS/JSON**:
  - Comillas `'` (A+S) y `"` (Z+X) accesibles
  - Dos puntos `:` (E+R) para propiedades
- **Brackets simétricos**: Mano izquierda abre `( { [`, mano derecha cierra `] } )`
- **Símbolos de código**: Todos los símbolos necesarios en LOWER con layout ergonómico

### Para Neovim
- El combo **J+K** para ESC es extremadamente útil para salir del modo insertar
- La capa RAISE tiene navegación estilo Vim (**HJKL**) en el home row
- **Selección de texto**: **RAISE+S** (Shift) + flechas para seleccionar
- **Navegación Ubuntu/GNOME**:
  - **Alt+F4** (RAISE+Q): Cerrar ventana
  - **Alt+Tab** (RAISE+W): Cambiar aplicaciones
  - **Mover entre monitores** (RAISE+A/F): Izquierda/Derecha
  - **Tiling de ventanas** (RAISE+U/I/O): Izquierda/Maximizar/Derecha
  - **Cambiar workspaces** (RAISE+Y/P): Izquierda/Derecha
- **Portapapeles del sistema**: **Ctrl+Shift+C** (RAISE+C) y **Ctrl+Shift+V** (RAISE+V) - perfecto para copiar/pegar entre Neovim y otras aplicaciones
- **Seleccionar todo**: **Ctrl+A** (combo L+; en capa BASE)
- TAB disponible con combo **W+E** en BASE
- Undo/Redo: **Ctrl+Z** (RAISE+Z) y **Ctrl+Y** (RAISE+B)
- **Delete**: RAISE + pulgar izquierdo (2ª tecla)
- **F-keys**: F1-F12 completas en capa SpanFish (acceso ergonómico home row)

### Para Español

**Configuración del sistema operativo:**

Este teclado usa **Unicode nativo** para generar acentos españoles, lo que significa que funciona con el layout **US estándar** (sin necesidad de US-International).

**Requisitos:**
- **Linux (Ubuntu)**: IBus viene habilitado por defecto ✅
- **Prueba de funcionamiento**: Abre un editor y presiona `Ctrl+Shift+U`, escribe `E1`, presiona `Espacio` → debería aparecer **á**

**Layout recomendado:**
```bash
# Ubuntu/GNOME - Layout US estándar (sin dead keys)
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"
setxkbmap -layout us
```

**Cómo escribir acentos:**
1. Mantén presionado **ESC** (activa LOWER) o **SPACE** (activa RAISE)
2. Mantén presionado el **pulgar derecho** (activa SpanFish)
3. Presiona la **letra** correspondiente
4. Para mayúsculas: agrega **Shift**

**Ejemplos:**
- **á**: LOWER + SpanFish + A
- **Ñ**: RAISE + SpanFish + Shift + N
- **ó**: LOWER + SpanFish + O
- **F1**: LOWER/RAISE + SpanFish + Q

**Ventajas:**
- ✅ Sin dead keys - Los símbolos `` ` ~ ' " `` aparecen inmediatamente
- ✅ Funciona con layout US estándar
- ✅ Mayúsculas automáticas con Shift
- ✅ No interfiere con la programación

### Home Row Mods
- **Solo mano izquierda** tiene modificadores: A(Ctrl), S(Alt), D(GUI), F(Shift)
- **Mano derecha** sin mods (J/K/L libres para Neovim)
- Los mods se activan manteniendo presionada la tecla (250ms)
- Timing optimizado para typing rápido en largas sesiones
- `hold-trigger-on-release` previene activaciones accidentales al escribir rápido
- Si necesitas más/menos tiempo, ajusta `tapping-term-ms` en el keymap

## 🔗 Enlaces Útiles

### Documentación oficial
- [Documentación oficial de ZMK](https://zmk.dev/)
- [Repositorio oficial de Urchin](https://github.com/duckyb/urchin)
- [Comunidad de ZMK en Discord](https://zmk.dev/community/discord/invite)

### Módulos utilizados
- [zmk-unicode - Soporte Unicode nativo](https://github.com/urob/zmk-unicode)
- [zmk-unicode - Guía de uso](https://anirudh.fi/zmk-unicode)
- [nice-view-gem - Display support](https://github.com/M165437/nice-view-gem)

## 📄 Licencia

MIT License - Ver archivo LICENSE para más detalles.

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si tienes mejoras para el layout o encuentras bugs, no dudes en abrir un issue o pull request.

---

**¡Feliz typing! ⌨️✨**
