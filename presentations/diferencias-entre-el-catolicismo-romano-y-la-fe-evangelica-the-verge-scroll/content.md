---
topic: Diferencias entre el Catolicismo Romano y la Fe Evangélica - The Verge Scroll
slug: diferencias-entre-el-catolicismo-romano-y-la-fe-evangelica-the-verge-scroll
brand: theverge
created: 2026-06-17
format: scrollytelling (single continuous page, StoryStream timeline pattern)
---

# Diferencias entre el Catolicismo Romano y la Fe Evangélica — The Verge Edition

## Headline
7 diferencias clave entre el catolicismo romano y la fe evangélica, explicadas para jóvenes — cada tema incluye la enseñanza católica, la respuesta evangélica con base bíblica, y cómo defenderla con respeto.

## Audience
Jóvenes evangélicos que quieren entender su fe y poder explicarla con humildad y argumentos bíblicos, sin atacar a nadie — muchos tienen familia o amigos católicos.

## Por qué The Verge y por qué StoryStream
- `brands/theverge/brand-style.md` documenta un patrón nativo de scroll: el **StoryStream** — un feed vertical donde cada historia es una tarjeta de esquinas redondeadas (20–24px), sobre un riel vertical con timestamp en mono-uppercase a la izquierda. Es, literalmente, el patrón de scrollytelling propio de la marca.
- Cada uno de los 7 temas se mapea a un ítem del StoryStream — numerado como "episodio" en vez de timestamp real — alternando relleno saturado (mint, ultravioleta, amarillo, rosa, naranja) según la paleta de tiles que el brand-style permite, con `#131313` como canvas constante entre ítems (no hay modo claro: el canvas oscuro es el producto).
- Dentro de cada tarjeta: enseñanza católica (columna) | respuesta evangélica bíblica (columna) | cita textual con referencia | un párrafo breve de "cómo defenderlo con respeto" en voz de mono-label.
- Tipografía: Manuka (fallback Anton, gran display ≥60px, solo para hero y números de episodio) + PolySans (fallback Space Grotesk) para texto + PolySans Mono (fallback Space Mono) para todos los labels/kickers/timestamps en mayúsculas con tracking.
- Logo: el wordmark "THE VERGE" en Manuka/Anton dentro de un top-nav fijo con barra de progreso mint — siguiendo el mismo patrón que las ediciones Figma y Apple de este mismo guion, más idiomático para scroll continuo que repetir un wordmark pequeño en cada sección.

## Estructura (scrollytelling, una página)
1. Top-nav fijo (wordmark "THE VERGE" + eyebrow mono) + barra de progreso de scroll en mint
2. Hero (canvas negro) — título Manuka/Anton + intro
3. Sección de propósito/tono (canvas negro) — por qué este estudio y cómo acercarse con respeto
4. StoryStream — 7 ítems, riel vertical, cada uno con comparación Católico | Evangélico + cita + "cómo defenderlo":
   - 01 El Canon (66 vs 73 libros) — mint
   - 02 La Virgen María (veneración mariana vs honra bíblica) — ultravioleta
   - 03 Los Santos (intercesión vs sacerdocio de todo creyente) — amarillo
   - 04 La Autoridad (Tradición + Magisterio vs Sola Scriptura) — rosa
   - 05 La Salvación (fe + obras vs sola fide) — naranja
   - 06 La Eucaristía (transubstanciación vs memorial) — mint (reuso)
   - 07 El Purgatorio (purificación post-mortem vs "hoy estarás conmigo en el paraíso") — ultravioleta (reuso)
   - EXTRA (insertada tras 01, sin numerar como octava diferencia): "¿Por qué estos libros y no otros?" — tile slate (`#2d2d2d`), profundiza el canon: el Tanaj de tres bloques que cita Jesús en Lucas 24:44, el conteo judío 22/24 vs 39, los 5 criterios de canonicidad del NT (apostolicidad, antigüedad, ortodoxia, catolicidad, autoridad reconocida), ejemplos de libros excluidos (Tomás, Pedro, Pastor de Hermas) y una línea de tiempo 170–397 d.C. Incluye una ilustración generada vía Kie.ai (`assets/canon-criteria.png`, rollos antiguos sellados/descartados en flat hazard-tape) para romper la densidad de texto.
5. Resumen comparativo — tarjeta blanca/spotlight (única vez que aparece el tile blanco, "spotlight" según el brand)
6. Cómo dialogar con amor (conclusión) — canvas negro
7. Cierre / footer oscuro con cita final

## Key points
- Las 7 diferencias deben incluir explícitamente canon, la Virgen y los santos (pedido directo del usuario), más autoridad, salvación, eucaristía y purgatorio para completar el panorama doctrinal típico de la apologética evangélica frente al catolicismo romano.
- Cada respuesta evangélica debe ser bíblica (cita textual + referencia) y formulada en tono respetuoso — nunca despectivo hacia personas católicas, siempre hacia ideas/doctrinas.
- Incluir un bloque explícito de "cómo defenderlo con respeto" por tema: una frase de actitud (ej. "pregunta antes de afirmar", "honra la persona, cuestiona la doctrina") + el argumento bíblico central.

## Notes
- Tipografía: Manuka y PolySans son propietarias (Klim Type Foundry / PanGram Pangram) → fallbacks vía Google Fonts: Anton (display, +0.15 line-height vs el 0.80 nativo para evitar colisión de ascendentes/descendentes), Space Grotesk (UI/cuerpo), Space Mono (labels mono uppercase).
- Contraste: todo el texto de cuerpo sobre `#131313` usa blanco puro o `#e9e9e9`; los tiles de color usan texto negro (`#000000`) cuando el fondo es mint/amarillo/blanco, y blanco cuando el fondo es ultravioleta/naranja oscuro — verificado ≥4.5:1 en todos los casos, apuntando a AAA donde es posible.
- Cuarta variante de marca/formato sobre el mismo guion doctrinal (tras Hecho Por Él, Figma scrollytelling y Apple narrative-story) — convive como proyecto independiente en `presentations/`.
