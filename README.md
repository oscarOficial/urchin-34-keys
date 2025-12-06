# Urchin ZMK Firmware Configuration

<div align="center">

![ZMK](https://img.shields.io/badge/ZMK-Firmware-blue?style=for-the-badge)
![Keyboard](https://img.shields.io/badge/Keyboard-Urchin-orange?style=for-the-badge)
![Keys](https://img.shields.io/badge/Keys-34-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

**Configuración personalizada de ZMK para el teclado Urchin (34 teclas)**

*Optimizada para programación con Neovim y escritura en español*

[📥 Descargar](#-instalación) •
[📖 Documentación](#-características) •
[🎨 Layout Visual](docs/layout.pdf) •
[🚀 Guía Rápida](QUICK_REFERENCE.md)

</div>

---

## 🎯 Características

### Layout de 34 teclas
- 3x5 teclas principales por mano (30 total)
- 2 teclas de pulgar por mano (4 total)

### Capas
1. **BASE**: QWERTY español con home row mods
2. **LOWER**: Números y símbolos de programación
3. **RAISE**: Navegación y teclas de función
4. **ADJUST**: Configuración Bluetooth y media

### Home Row Mods
- **Mano izquierda**: A(Ctrl), S(Alt), D(GUI), F(Shift)
- **Mano derecha**: J(Shift), K(GUI), L(Alt), ;(Ctrl)

### Combos útiles

**Edición:**
- **J + K**: ESC (perfecto para salir de modo insertar en Vim)
- **W + E**: TAB
- **Ambos Shifts**: Caps Word

**Programación Web:**
- **C + V**: `<` (HTML tags, comparaciones)
- **, + .**: `>` (HTML tags, comparaciones)
- **X + C**: `_` (snake_case variables)
- **R + T**: `` ` `` (template literals JavaScript)
- **K + L**: `'` (comilla simple)
- **M + ,**: `"` (comilla doble)

**Español:**
- **L + ;**: Ñ

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
urchin-zmk-config/
├── .github/
│   └── workflows/
│       └── build.yml          # GitHub Actions para compilación automática
├── config/
│   ├── urchin.keymap          # Definición del layout y capas
│   ├── urchin.conf            # Configuración de ZMK
│   └── west.yml               # Dependencias de ZMK
├── docs/
│   └── layout.pdf             # Diagrama visual del layout
├── build.yaml                 # Configuración de compilación
└── README.md                  # Este archivo
```

## 🎨 Layout Visual

Consulta `docs/layout.pdf` para un diagrama visual completo del layout.

### Capa BASE
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│      Q      │      W      │      E      │      R      │      T      │   │      Y      │      U      │      I      │      O      │      P      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│   A (Ctrl)  │   S (Alt)   │   D (GUI)   │  F (Shift)  │      G      │   │      H      │  J (Shift)  │   K (GUI)   │   L (Alt)   │  ; (Ctrl)   │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      Z      │      X      │      C      │      V      │      B      │   │      N      │      M      │      ,      │      .      │      /      │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │  ESC(LOWER) │ BSPC (Ctrl) │   │  SPC(Shift) │  ENT(RAISE) │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯
```

### Capa LOWER (Números y Símbolos)
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│      !      │      @      │      #      │      $      │      %      │   │      ^      │      &      │      *      │      (      │      )      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      1      │      2      │      3      │      4      │      5      │   │      6      │      7      │      8      │      9      │      0      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│      `      │      ~      │      [      │      ]      │      {      │   │      }      │      |      │      \      │      -      │      =      │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │    ______   │     DEL     │   │    RALT     │   ADJUST    │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯
```

### Capa RAISE (Navegación)
```
╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮   ╭─────────────┬─────────────┬─────────────┬─────────────┬─────────────╮
│     TAB     │     F2      │     F3      │     F4      │     F5      │   │     F6      │     F7      │     F8      │     F9      │    F10      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│    Ctrl     │     Alt     │     GUI     │    Shift    │    F11      │   │   ← (H)     │   ↓ (J)     │   ↑ (K)     │   → (L)     │    F12      │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│  Undo(^Z)   │  Cut(^X)    │  Copy(^C)   │ Paste(^V)   │  Redo(^Y)   │   │    HOME     │   PG_DN     │   PG_UP     │     END     │    INS      │
╰─────────────┴─────────────┴─────────────┼─────────────┼─────────────┤   ├─────────────┼─────────────┼─────────────┴─────────────┴─────────────╯
                                           │   ADJUST    │    ______   │   │    RALT     │    ______   │
                                           ╰─────────────┴─────────────╯   ╰─────────────┴─────────────╯
```

### Capa ADJUST
```
CAPA ADJUST:
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
- **Backspace/Delete**: 200ms - respuesta más rápida para edición
- **Quick tap**: 175ms
- **Combos**: 50ms - activación instantánea
- **Prior idle**: 150ms - previene activaciones accidentales

## 💡 Consejos de Uso

### Para Programación Web
- **HTML/JSX**: Combos `<` (C+V) y `>` (,+.) para tags rápidos
- **JavaScript**: Template literals con `` ` `` (R+T), `_` (X+C) para variables
- **CSS/JSON**: Comillas `'` (K+L) y `"` (M+,) accesibles
- **Edición rápida**: Backspace optimizado (200ms) con Delete al mantener
- **Símbolos de código**: Todos los brackets, pipes en LOWER accesibles

### Para Neovim
- El combo **J+K** para ESC es extremadamente útil para salir del modo insertar
- La capa RAISE tiene navegación estilo Neovim (**HJKL**) en el home row
- TAB dedicado en RAISE (primera posición) y combo **W+E** en BASE
- Los atajos de copiar/pegar están en la capa RAISE fila inferior

### Para Español
- El combo **L+;** genera Ñ rápidamente
- **AltGr** disponible en capas LOWER y RAISE (pulgar derecho) para escribir Ñ con AltGr+N
- Los acentos se pueden escribir usando la tecla muerta ` en la capa LOWER

### Home Row Mods
- Los mods se activan manteniendo presionada la tecla (250ms)
- Timing optimizado para typing rápido en largas sesiones
- `hold-trigger-on-release` previene activaciones accidentales al escribir rápido
- Si necesitas más/menos tiempo, ajusta `tapping-term-ms` en el keymap

## 🔗 Enlaces Útiles

- [Documentación oficial de ZMK](https://zmk.dev/)
- [Repositorio oficial de Urchin](https://github.com/duckyb/urchin)
- [Comunidad de ZMK en Discord](https://zmk.dev/community/discord/invite)

## 📄 Licencia

MIT License - Ver archivo LICENSE para más detalles.

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si tienes mejoras para el layout o encuentras bugs, no dudes en abrir un issue o pull request.

---

**¡Feliz typing! ⌨️✨**
