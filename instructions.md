# AI Instructions for Math Worksheet Template

This document tells you how to work with this Typst math worksheet template.

---

## File Structure

```
public/template/
├── main.typ        ← EDIT THIS (worksheet content)
├── worksheet.typ   ← DO NOT EDIT (template logic)
├── demo.typ        ← REFERENCE THIS (examples)
└── assets/         ← Place images here
```

---

## What to MODIFY

### `public/template/main.typ`

This is the **only file you should edit** for worksheet content. It contains:
- Worksheet title and settings
- Problem content organized by sections

---

## What to REFERENCE (Read-Only)

### `public/template/demo.typ`

Read this file to see working examples of all template features. Do not modify it.

### `public/template/worksheet.typ`

Contains template logic. Read to understand available functions, but do not modify unless explicitly asked to change template behavior.

### `SYNTAX.md` (project root)

Complete Typst syntax reference. Read when you need math syntax help.

---

## Template Usage

### Basic Structure

```typst
#import "/worksheet.typ": *

#show: worksheet.with(
  title: "Worksheet Title",
  class: "Class Name",
  show-answers: false,  // true = answer key mode
)

#instructions[Instructions text here.]

= Section Title

#problem[Problem text here.]
```

### Configuration Options

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | "Math Worksheet" | Worksheet title |
| `class` | "Mathematics" | Class/course name |
| `show-name-field` | true | Show Name field |
| `show-date-field` | true | Show Date field |
| `show-answers` | false | Show answers in red |
| `paper` | "a4" | Paper size |
| `font` | "Noto Sans" | Font family |

---

## Available Functions

### Problems

```typst
#problem[Question text]                    // Auto-numbered problem
#problem(points: 5)[Question]              // With point value
#problem(space: 4cm)[Question]             // Custom workspace height

#subproblem[Part text]                     // (a), (b), (c) sub-parts
#subproblem(points: 2)[Part]               // Sub-part with points
```

### Workspaces

```typst
#workspace(height: 4cm)                    // Blank space
#lined-workspace(lines: 5)                 // Lined writing area
#box-workspace(height: 3cm)                // Bordered box
#grid-workspace(height: 5cm)               // Graph paper
```

### Answer Key (only visible when show-answers: true)

```typst
#answer[Answer text]                       // Inline answer
#answer-line(body: [5])                    // Fill-in line with answer
#answer-box(body: [Long answer], height: 2cm)
#blank                                     // Blank in equations
#boxed[answer]                             // Blank that shows answer
```

### Multiple Choice

```typst
#choices(                                  // Vertical layout
  [Option A],
  [Option B],
  [Option C],
  [Option D],
  correct: "B",                            // Highlighted in answer key
  spacing: 1.5em,                          // For tall content like fractions
)

#choices-row([A], [B], [C], [D], correct: "A")  // Horizontal layout
```

### Layout

```typst
#instructions[Text]                        // Blue instruction box
#note[Text]                                // Italic note
#divider()                                 // Horizontal line
#new-page()                                // Page break
#new-page(title: "Part 2")                 // Page break with heading
#points(5)                                 // Display "(5 pts)"
```

---

## Math Syntax Quick Reference

```typst
$frac(a, b)$          // Fraction
$sqrt(x)$             // Square root
$x^2$                 // Superscript
$x_1$                 // Subscript
$times$ $div$         // × ÷
$pi$ $theta$          // Greek letters
$>=$ $<=$ $eq.not$    // Comparisons
$integral_0^1 f(x) d x$  // Integral

// Block equation (centered)
$ x = frac(-b plus.minus sqrt(b^2 - 4a c), 2a) $

// Aligned equations
$
3x + 2 &= 14 \
x &= 4
$

// System of equations
$ cases(x + y = 10, x - y = 4) $
```

---

## Key Behaviors

1. **Problem numbering resets** on each `= Section` heading
2. **Sub-problem letters reset** on each new `#problem`
3. **Answer key mode**: Set `show-answers: true` to reveal all answers in red
4. **Images**: Place in `assets/` folder, reference as `#image("/assets/name.png")`

---

## Common Tasks

### Create a new worksheet
1. Edit `main.typ`
2. Change `title` and `class` in `worksheet.with(...)`
3. Replace content after `#instructions[...]`

### Add problems with workspace
```typst
#problem[Solve for $x$: $2x + 5 = 13$]
// Problem has default 2.5em space, or use:
#problem(space: 4cm)[Problem needing more space]
```

### Add multiple choice question
```typst
#problem(space: 0em)[What is $3^2$?]
#choices([3], [6], [9], [12], correct: "C")
```

### Create answer key version
Change `show-answers: false` to `show-answers: true`

### Add multi-part problem
```typst
#problem[Consider the function $f(x) = x^2$.]
#subproblem[Find $f(3)$.]
#subproblem[Find $f(-2)$.]
```

---

## Do NOT

- Modify `worksheet.typ` unless asked to change template behavior
- Modify files outside `public/template/`
- Use relative imports (always use `/worksheet.typ` not `worksheet.typ`)
