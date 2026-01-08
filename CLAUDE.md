# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Math Worksheet Template

This is a **Math Worksheet Builder** template for creating printable math worksheets with Typst.

### Template Files

```
public/template/
├── worksheet.typ     # Template logic (DO NOT modify unless advanced)
├── main.typ          # Worksheet content - EDIT THIS
├── demo.typ          # Examples and reference - CUSTOMIZE for your needs
├── README.md         # Template-specific instructions
└── assets/           # Images (optional)
```

### Quick Start

Edit `main.typ` to change worksheet content:

```typst
#import "/worksheet.typ": worksheet, instructions, points

#show: worksheet.with(
  title: "Algebra Practice",
  class: "Grade 8 Math",
)

#instructions[Show all your work.]

= Solve for x

+ $2x + 5 = 13$

+ $3(x - 2) = 15$
```

### Configuration Options

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | "Math Worksheet" | Worksheet title |
| `class` | "Mathematics" | Class/course name |
| `show-name-field` | true | Show Name: _____ field |
| `show-date-field` | true | Show Date: _____ field |
| `paper` | "a4" | Paper size ("a4", "us-letter") |
| `margin` | 2cm | Page margins |
| `font` | "Noto Sans" | Font family |
| `font-size` | 11pt | Base font size |

### Helper Functions

```typst
#instructions[Text here]     // Blue instruction box
#points(5)                   // Show "(5 pts)"
#answer-line(width: 2cm)     // Underline for answers
#workspace(height: 3cm)      // Vertical space for work
```

### Math Syntax Quick Reference

```typst
$x^2$                        // Superscript
$x_1$                        // Subscript
$frac(a, b)$                 // Fraction
$sqrt(x)$                    // Square root
$times$, $div$               // Multiplication, division
$pi$, $theta$                // Greek letters
$>=, <=, eq.not$             // Comparisons
```

---

## For AI Agents (v0, Cursor, Claude)

### Files to MODIFY:
- **`public/template/main.typ`** - Worksheet content (primary file to edit)
- `public/template/demo.typ` - Template-specific examples
- `public/template/README.md` - Template-specific AI instructions

### Files to CUSTOMIZE (one-time setup):
- `components/editor/Toolbar.tsx` line 36 - App title (already set to "Maths Worksheet Builder")

### Reference Files (READ only):
- **`SYNTAX.md`** - Comprehensive Typst syntax guide
- **`public/template/worksheet.typ`** - Template logic (modify only for advanced changes)

### Files to NEVER MODIFY (lock these in v0):
- `hooks/` - Core compiler integration
- `lib/` - Infrastructure (typst-config, fonts, utils, template-loader)
- `app/api/` - API routes (template discovery)
- `components/ui/` - Base UI components
- `types/` - TypeScript declarations
- `next.config.ts`, `tsconfig.json` - Build configuration

### v0 File Locking
When uploading to v0, use the Platform API to lock infrastructure files:
```javascript
// Lock all files except public/template/
files.map(file => ({
  ...file,
  locked: !file.name.startsWith('public/template/')
}))
```
See: https://v0.app/docs/api/platform/guides/lock-files-from-ai-changes

### Template Architecture

**Content is separated from template logic:**
- `worksheet.typ` - Contains the `worksheet()` function and helper functions
- `main.typ` - Imports `worksheet.typ`, contains only problem content
- `demo.typ` - Imports `worksheet.typ`, contains example problems

**When editing content:**
1. Edit `main.typ` for the actual worksheet
2. Reference `demo.typ` for syntax examples
3. Don't modify `worksheet.typ` unless changing template behavior

### Local Template Imports
Use absolute paths (starting with `/`) for imports:
```typst
#import "/worksheet.typ": worksheet, instructions, points
```

### Local Images
Images in `public/template/assets/` are auto-loaded. Use absolute paths:
```typst
#image("/assets/diagram.png", width: 50%)
```

---

## Project Overview

A web-based Typst editor with live SVG preview and PDF export. Uses the typst.ts WebAssembly compiler loaded from CDN for client-side compilation.

## Commands

```bash
npm run dev      # Start dev server with Turbopack
npm run build    # Production build
npm run start    # Start production server
npm run lint     # Run ESLint
```

## Tech Stack

- Next.js 15 (App Router) with React 19
- TypeScript with strict mode
- Tailwind CSS v4 (uses `@theme` directive in globals.css)
- Radix UI primitives (tooltip, slot)
- react-resizable-panels for split view
- typst.ts loaded from CDN (not bundled)

## Architecture

### Typst Integration

The Typst compiler runs entirely in the browser via WebAssembly:
- `lib/typst-config.ts` - CDN URLs for typst.ts bundle and WASM modules
- `hooks/useTypst.ts` - Loads compiler script dynamically, exposes `compile()` for SVG output
- `hooks/useTypstPdf.ts` - PDF export via `$typst.pdf()`
- `types/typst.d.ts` - TypeScript declarations for the global `$typst` object

The global `$typst` object is injected by the CDN bundle and provides `svg()` and `pdf()` methods.

Local template files are auto-discovered via:
- `app/api/templates/route.ts` - API endpoint listing `.typ` files in `public/template/`
- `lib/template-loader.ts` - Fetches template files and registers them with `$typst.addSource()`

### Component Structure

```
components/
├── layout/
│   └── EditorLayout.tsx   # Main orchestrator - manages state, panels, compilation
├── editor/
│   ├── EditorPanel.tsx    # Textarea for Typst source input
│   ├── PreviewPanel.tsx   # SVG preview with zoom, page rendering
│   └── Toolbar.tsx        # Export PDF, app title
└── ui/                    # Reusable shadcn-style components
```

## Path Aliases

`@/*` maps to project root (configured in tsconfig.json)

## Fonts

Global fonts are preloaded from CDN (see `lib/fonts.ts`):
- Noto Sans/Serif (multilingual)
- Source Han Sans (CJK)
- Fira Code (monospace)
- Inter, Roboto (UI fonts)
