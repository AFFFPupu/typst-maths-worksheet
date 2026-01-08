# Math Worksheet Template

A student-friendly math worksheet template with fill-in fields for Name and Date, suitable for elementary through high school math classes.

---

## Files

| File | Purpose |
|------|---------|
| `public/template/worksheet.typ` | Template logic - styling, layout, helper functions |
| `public/template/main.typ` | **EDIT THIS** - Worksheet problem content |
| `public/template/demo.typ` | Examples and reference for all features |
| `public/template/assets/` | Store images here (PNG, JPG, SVG, WebP) |

**Full Syntax Guide**: See `SYNTAX.md` at project root.

---

## Quick Start

Edit `main.typ` to change worksheet content:

```typst
#import "/worksheet.typ": worksheet, instructions, points

#show: worksheet.with(
  title: "Algebra Practice",
  class: "Grade 8 Math",
)

#instructions[Show all your work.]

= Section Title

+ First problem: $2x + 5 = 13$

+ Second problem: $frac(24, 6) =$
```

---

## Configuration Options

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | string | "Math Worksheet" | Worksheet title |
| `class` | string | "Mathematics" | Class/course name |
| `show-name-field` | bool | true | Show "Name: _____" field |
| `show-date-field` | bool | true | Show "Date: _____" field |
| `paper` | string | "a4" | Paper size ("a4", "us-letter") |
| `margin` | length | 2cm | Page margins |
| `font` | string | "Noto Sans" | Font family |
| `font-size` | length | 11pt | Base font size |

---

## Helper Functions

The template provides these helper functions:

```typst
#import "/worksheet.typ": worksheet, instructions, points, answer-line, workspace

#instructions[Show all your work.]     // Blue instruction box

+ #points(5) Solve for x...            // Show point value

Fill in: x = #answer-line()            // Underline for answers

#workspace(height: 3cm)                // Add space for work
```

---

## Writing Problems

### Numbered Problems

Use `+` for automatically numbered problems:

```typst
+ Calculate: $5 times 8 =$

+ Solve for $x$: $2x + 3 = 11$
```

### Section Headings

Group problems by topic:

```typst
= Algebra

+ Problem 1...

= Geometry

+ Problem 2...
```

### Two-Column Layout

```typst
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [+ $15 + 27 =$],
  [+ $48 - 19 =$],
)
```

---

## Math Syntax Quick Reference

| Type | Syntax | Result |
|------|--------|--------|
| Fraction | `$frac(a, b)$` | a over b |
| Square root | `$sqrt(x)$` | Square root |
| Superscript | `$x^2$` | x squared |
| Subscript | `$x_1$` | x sub 1 |
| Multiplication | `$times$` | × |
| Division | `$div$` | ÷ |
| Greek | `$pi$`, `$theta$` | π, θ |

### Block Equations

```typst
$ x = frac(-b plus.minus sqrt(b^2 - 4a c), 2a) $
```

### Aligned Equations

```typst
$
3x + 2 &= 14 \
3x &= 12 \
x &= 4
$
```

### Systems of Equations

```typst
$
cases(
  x + y = 10,
  x - y = 4
)
$
```

---

## Grade Level Examples

### Elementary (Grades 3-5)

```typst
= Addition

+ $145 + 237 =$

+ $500 - 168 =$

= Multiplication

+ $12 times 7 =$
```

### Middle School (Grades 6-8)

```typst
= Fractions

+ Simplify: $frac(24, 36) =$

= Algebra

+ Solve: $3x - 5 = 16$
```

### High School (Grades 9-12)

```typst
= Quadratic Equations

+ Solve using the quadratic formula:
  $ x^2 - 5x + 6 = 0 $

= Trigonometry

+ Find $sin(30 degree)$ and $cos(60 degree)$.
```

---

## Layout Tips

### Adding an Instructions Box

```typst
#instructions[
  Show all your work. Circle your final answers.
]
```

### Adding Space for Work

```typst
+ Solve: $2x + 5 = 17$

#v(3cm)  // 3cm of vertical space
```

### Formula Reference Box

```typst
#rect(
  width: 100%,
  fill: gray.lighten(90%),
  stroke: 0.5pt,
  inset: 10pt,
  radius: 4pt,
)[
  *Formulas:*
  - Rectangle: $A = l times w$
  - Circle: $A = pi r^2$
]
```

### Multiple Choice

```typst
+ What is $3^2 + 4^2$?

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    [(A) 7], [(B) 12], [(C) 25], [(D) 49]
  )
```

---

## Available Fonts

```typst
font: "Noto Sans"        // Clean sans-serif (default)
font: "Noto Serif"       // Classic serif
font: "Inter"            // Modern UI
font: "Linux Libertine"  // Academic serif
```

---

## AI Instructions

When editing this template:

1. **Edit `public/template/main.typ`** for worksheet content
2. **Reference `public/template/demo.typ`** for syntax examples
3. **Don't modify `worksheet.typ`** unless changing template behavior
4. **Use absolute paths** for imports: `#import "/worksheet.typ": ...`

### What to Edit
- Problem content in `main.typ`
- Configuration in `worksheet.with(...)`

### What NOT to Edit
- `worksheet.typ` (template logic)
- Files outside `public/template/`

---

## Need Help?

1. Check `demo.typ` for working examples
2. See `SYNTAX.md` for complete reference
3. Visit https://typst.app/docs for official documentation
