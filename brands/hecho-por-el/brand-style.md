---
brand: Hecho Por Él
slug: hecho-por-el
website: N/A — marca editorial de contenido de fe (redes/eventos)
extracted_via: manual
---

# Hecho Por Él — Brand Style

## Visual Theme & Atmosphere
Editorial-orgánica: humana, reflexiva, con un propósito claro pero un acabado de diseño limpio y muy actual. El lenguaje visual de marca es **ilustración tipo "sticker sheet"**: doodles de línea negra con relleno plano (sin degradados, sin sombras), motivos recurrentes de fe y naturaleza — sol/luna, cruces, paloma, arcoíris, montañas, olas, animales (osos, ballena, oveja), hojas/uvas, fuego, trigo, corona, manos entrelazadas. El wordmark usa bloques tipo "sticker recortado" con bordes irregulares/rasgados, nunca esquinas redondeadas limpias. Ver `reference-illustration.png` como mood-board de estilo (no se usa como logo, solo referencia de paleta e iconografía).

**Patrón narrativo de sección (añadido):** cada sección de un deck multi-parte abre con un numeral grande + nombre de rol/tema + una frase-manifiesto, sigue con una **tarjeta de ilustración completa** (formalización reusable del panel de papel rasgado de `reference-illustration.png`) y cierra con **fichas de color plano y vivo** que desarrollan el tema con tips, datos o citas — préstamo directo de las story-tiles de `brands/theverge/brand-style.md`. Spec completo en `## Patrones de Sección` más abajo.

## Colors
| Role | Hex | Notes |
|---|---|---|
| Background (modo oscuro) | `#000000` | Modo por defecto — el key art original vive sobre negro |
| Background (modo claro) | `#FFFFFF` | Modo alterno — usar uno u otro por deck, nunca mezclar (Regla #20) |
| Primary / Accent (único) | `#FFED00` | Amarillo vibrante — libro, manos, elementos destacados. Es el ÚNICO acento permitido por slide (Regla #13) |
| Text Primary (sobre negro) | `#FFFFFF` | |
| Text Primary (sobre blanco) | `#000000` | |
| Text Muted | `#9A9A9A` | Derivado — gris medio, uso en captions/metadata |
| Border | `#2A2A2A` (oscuro) / `#E5E5E5` (claro) | Derivado |
| Paper / Tarjeta-papel | `#F4EFE2` | Superficie cálida tipo "papel" — única superficie no-neutra del sistema, exclusiva de la Tarjeta de Ilustración Completa (ver Patrones de Sección). Nunca usar como fondo de slide. |

**Color scheme:** dual — light y dark son ambos válidos, igual de "nativos" a la marca. Elegir uno por deck y mantenerlo (Regla #20).
**Accent rule:** `#FFED00` es el único acento de UI/texto. Nunca combinar con otro color como acento en el mismo elemento.

**Paleta de soporte (solo para ilustraciones decorativas, NO como acento de UI):**
| Color | Hex | Uso en key art |
|---|---|---|
| Celeste/Turquesa | `#7ACCC8` | Ola, arcoíris, montaña |
| Verde | `#65B32E` | Hoja, detalles botánicos |
| Naranja Rojizo | `#F26646` | Centro del arcoíris, árbol, osos, cruces |

Estos 3 tonos son para ilustraciones tipo key-art (multi-color, fuera de la regla de un-solo-acento que aplica a slides de texto/datos). No usarlos como color de botón, link o highlight de texto — eso es trabajo exclusivo de `#FFED00`.

**Excepción de acento — Fichas (ver Patrones de Sección):** la regla de un-solo-acento sigue rigiendo texto, links y CTAs en slides estándar. Las **fichas** son la única excepción documentada: cada ficha individual puede usar como relleno plano uno de los 4 colores vivos (`#FFED00`, `#7ACCC8`, `#65B32E`, `#F26646`) — uno por ficha, nunca dos en la misma. Varias fichas de colores distintos pueden convivir en la misma sección (préstamo directo del patrón StoryStream de The Verge: cada tile es monocromático, el feed combina varios). Texto sobre las 4: siempre `#000000`.

| Fondo de ficha | Hex | Contraste vs. texto negro | Nivel WCAG |
|---|---|---|---|
| Amarillo | `#FFED00` | ~17.4:1 | AAA |
| Turquesa | `#7ACCC8` | ~11.3:1 | AAA |
| Verde | `#65B32E` | ~8.0:1 | AAA |
| Naranja Rojizo | `#F26646` | ~6.8:1 | AA (cerca de AAA) |

## Typography
- **Display (headlines grandes/wordmark):** ZingRustDemo-Base — licencia comercial (Hoefler&Co). Archivo: `fonts/ZingRustDemo-Base.otf`. Fallback libre: **Anton** o **Bebas Neue** (Google Fonts)
- **Heading / subheads:** Gotham-Medium — licencia comercial. Archivo: `fonts/Gotham-Medium.otf`. Fallback libre: **Montserrat SemiBold** (Google Fonts)
- **Body:** Gotham-Book — licencia comercial. Archivo: `fonts/Gotham-Book.otf`. Fallback libre: **Montserrat Regular**
- **Caption / referencias bíblicas (ej. "JN. 1:3"):** MyriadPro-Regular — licencia comercial. Archivo: `fonts/MyriadPro-Regular.otf`. Fallback libre: **PT Sans** o **Noto Sans**
- **Label / Eyebrow (mono, trackeado — préstamo de The Verge):** no nativo de la marca original, añadido para eyebrows de sección, tags de ficha y pills ("SECCIÓN 01 · ...", "TIP", "CITA"). Fallback libre: **Space Mono** o **JetBrains Mono**. Siempre UPPERCASE, +0.08em a +0.12em de tracking — nunca minúsculas (igual que PolySans Mono en The Verge).

| Role | Size |
|---|---|
| Numeral de sección (display XL) | 120px |
| H1 (display) | 96px |
| H2 | 56px |
| Body | 28px |
| Caption / Label (mono eyebrow) | 18px |

> El Label/Eyebrow reutiliza el tamaño de Caption (18px) — es el piso permitido por la Regla #8 del skill (caption ≥18px); nunca bajar de ahí, aunque The Verge use mono a 10–11px.

**Uso de cursiva (nuevo):** la frase-manifiesto bajo el título de sección y el caption bajo la Tarjeta de Ilustración Completa usan Gotham-Book en cursiva, color `--muted` — la marca no usaba cursiva antes; se reserva exclusivamente para estos dos momentos "de cita/reflexión", nunca para body copy normal.

> Los `.otf` están en `fonts/` (local, gitignored — no se redistribuyen por licencia). Para incrustarlos en un deck HTML autocontenido, conviértelos a base64 y úsalos vía `@font-face` con `src: url(data:font/otf;base64,...)`. Si no quieres inflar el HTML, usa los fallbacks libres de Google Fonts — visualmente muy cercanos.

## Spacing & Shape
- Base grid: 8px (Regla #15)
- Border radius: **0px** — la marca usa formas de "sticker recortado" con bordes irregulares/rasgados, nunca rectángulos redondeados limpios. Para esquinas, usar `clip-path` con un polígono ligeramente irregular en vez de `border-radius`.
- Dos niveles de recorte (ambos vía `clip-path`, nunca `border-radius`):
  - **Recorte pronunciado** — logo, numeral de sección, Tarjeta de Ilustración Completa. Polígono irregular con 2–3 muescas visibles, igual de marcado que el wordmark.
  - **Recorte sutil** — fichas, pills, chips pequeños. Una sola muesca de 1–2px en una esquina — se lee como "sticker" sin sacrificar legibilidad a tamaño pequeño.
- Shadows: no — flat, consistente con el estilo doodle/data-ink
- Framework hint: custom (HTML/CSS plano, sin librerías)

## Patrones de Sección — Numeral + Imagen Completa + Fichas

> Inspirado en dos referencias: (1) decks tipo "manifiesto" que abren cada sección con un numeral grande seguido de una imagen-concepto a página completa, y (2) las story-tiles de color plano de `brands/theverge/brand-style.md`. Usar para decks de varias secciones (series, "los N pasos de...", comparativas tema-por-tema, devocionales por día). Funciona tanto como **scrollytelling continuo** (una página, scroll vertical — formato más fiel a la referencia) como en **slides discretos** (numeral+manifiesto = slide N, tarjeta de ilustración = slide N+1, fichas = slide N+2).

### 1. Marcador de Sección (numeral + manifiesto)
Abre cada sección, de arriba a abajo:
1. **Eyebrow** — `SECCIÓN 0X · [TEMA]` (o "Parte", "Capítulo", "Día", según el deck). Fuente Label/mono, 18px, UPPERCASE, tracking +0.08em, color `--muted`.
2. **Numeral** — "01", "02"… Fuente display (ZingRustDemo / fallback Anton-Bebas), 120px, color `--accent`. Sin cursiva, sin sombra.
3. **Título de rol/tema** — fuente Heading (Gotham-Medium), 56px. Primera palabra en `--fg`, palabra clave en `--accent`. Ej. "El **Mensajero**", "La **Promesa**".
4. **Frase-manifiesto** — una línea corta entrecomillada, cursiva (ver Uso de cursiva), 18px, color `--muted`. Ej. *"Hazlo tuyo."*
5. **Chip de desbloqueo** — recorte sutil, borde 1px `--border`, fondo `--bg` (el mismo del canvas, no un color nuevo). Glifo/icono + label mono "EL DESBLOQUEO" en `--accent`, seguido de una frase de 18px en `--fg` describiendo qué gana el lector al entender este concepto.

Reglas: numeral + título en la banda superior (Regla #19); whitespace ≥60% propio de section dividers (Regla #4); un solo acento (`--accent`) en todo el bloque (Regla #13).

### 2. Tarjeta de Ilustración Completa
El componente central del patrón — la imagen deja de ser adorno y se vuelve la explicación. Formaliza el panel de `reference-illustration.png` como componente reusable:

- **Superficie:** `--paper` (`#F4EFE2`) — nunca `--bg` puro. El contraste papel-cálido sobre canvas negro es lo que hace "saltar" la tarjeta, igual que el panel claro de `reference-illustration.png` sobre su fondo negro.
- **Borde:** recorte pronunciado — nunca `border-radius`.
- **Encabezado** (dentro de la tarjeta, arriba): tesis del concepto en una línea, MAYÚSCULAS, fuente Heading, 56px, texto negro (la tarjeta es clara). Ej. "UN CAMINO, NO UN ATAJO".
- **Ilustración** (cuerpo de la tarjeta): doodle de línea negra + relleno plano, **solo** con los 4 colores vivos (`#FFED00`, `#7ACCC8`, `#65B32E`, `#F26646`) — nunca degradados ni sombras, mismo lenguaje que `reference-illustration.png`. Un concepto, una escena — no un collage de íconos sueltos.
- **Caption** (debajo de la tarjeta, fuera del papel): cursiva, 18px, color `--muted`. Resume el punto en una frase. Ej. *"Que ore por el plan — no que lo reemplace."*

Esta tarjeta es el foco principal de la sección (≥25% del área visible) y la única superficie no-neutra permitida fuera de las fichas.

### 3. Fichas — desarrollo del tema en colores planos y vivos
Debajo de la tarjeta, 2–4 fichas (Regla #3: ideal 3–5 chunks) que aterrizan el concepto: un tip, un dato, una cita, un reto. Préstamo directo de las story-tiles de The Verge — jerarquía por color sólido, nunca por sombra.

| Tipo | Uso | Fondo | Texto | Estructura interna |
|---|---|---|---|---|
| **Tip** | Consejo práctico y específico | `#7ACCC8` turquesa | `#000000` | Eyebrow mono "TIP" + frase de acción (Body 28px) |
| **Cita** | Citar a una persona (autor, pastor, versículo) | `#FFED00` amarillo | `#000000` | Comillas + cita (Body 28px) + atribución (Label mono 18px UPPERCASE) |
| **Dato** | Estadística o número que respalda el tema | `#65B32E` verde | `#000000` | Número grande (Heading 56px) + descriptor corto (Label mono 18px) |
| **Reto** | Pregunta de reflexión o llamado a actuar | `#F26646` naranja rojizo | `#000000` | Eyebrow mono "RETO" + pregunta directa (Body 28px) |

Reglas de las fichas:
- Una ficha = un color = un propósito. Nunca mezclar dos colores en la misma ficha.
- Recorte sutil — nunca `border-radius`.
- Texto siempre negro sobre las 4 (ver tabla de contraste en Colors).
- No repetir el mismo color en fichas adyacentes de la misma sección — evita que el ojo las lea como "la misma ficha" (Principio de Similitud).
- Máximo 4 fichas por sección (Regla #3); si hay más contenido, abrir otra sección con su propio numeral.

### Cuándo usar este patrón vs. el deck plano original
- **Patrones de Sección** → decks educativos/devocionales de varias partes donde cada parte introduce un concepto nuevo.
- **Deck plano original** (slide por slide, logo en cada slide, un acento) → piezas cortas de una sola idea, anuncios, una sola pantalla.
- Ambos comparten paleta, tipografía y reglas de marca — lo que cambia es la estructura, no los tokens.

---

## Voice & Personality
- Tono: editorial-orgánica — humana, reflexiva, propósito claro, estética actual y limpia
- Energía: media-cálida — reflexiva en el mensaje, vibrante en el color
- Audiencia: jóvenes-adultos interesados en contenido de fe con estándar estético alto; valoran diseño gráfico, profundidad del mensaje y autenticidad

## Voice samples (real copy from the brand)
- "Diseño y fe, entrelazados desde el origen."
- "Hecho Por Él: Una mirada creativa a lo que nos define."

## Quick Reference (for Claude)
```css
/* Modo oscuro (default) */
:root {
  --bg: #000000;
  --fg: #FFFFFF;
  --accent: #FFED00;
  --muted: #9A9A9A;
  --border: #2A2A2A;
  --paper: #F4EFE2;
  --radius: 0px;
}

/* Modo claro (alterno — usar uno u otro, nunca mezclar) */
:root[data-theme="light"] {
  --bg: #FFFFFF;
  --fg: #000000;
  --accent: #FFED00;
  --muted: #9A9A9A;
  --border: #E5E5E5;
  --paper: #F4EFE2;
  --radius: 0px;
}

/* Colores de ficha — solo dentro del componente Ficha (ver Patrones de Sección),
   nunca como acento de UI estándar (texto/links/CTA siguen usando --accent) */
:root {
  --ficha-tip: #7ACCC8;
  --ficha-cita: #FFED00;
  --ficha-dato: #65B32E;
  --ficha-reto: #F26646;
  --ficha-text: #000000;
}
```

---

## Logo
- **Para fondos claros:** `logo-light.png` — bloques negros tipo sticker, letras blancas en negativo
- **Para fondos oscuros:** `logo-dark.png` — blob blanco tipo sticker, letras negras, fondo transparente (diseñado para fundirse con negro)
- Colocación default (Regla #21): wordmark pequeño, esquina inferior izquierda, ~24px de alto, dentro del safe-zone del 5%. Mantener proporción (ratio ~2.8:1) — a 24px de alto, ancho ≈ 67px.
- Referencia de estilo (no usar como logo embebido): `reference-illustration.png`

## Reference
**Website:** N/A — confirmar si existe sitio/landing para extracción futura vía Firecrawl.
