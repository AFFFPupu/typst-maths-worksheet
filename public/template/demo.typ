// ============================================================================
// MATH WORKSHEET DEMO
// This file demonstrates all features of the math worksheet template.
// Use this as a reference when creating your worksheets.
// ============================================================================

#import "/worksheet.typ": worksheet, instructions, workspace, points, answer-line, problem-grid

#show: worksheet.with(
  title: "Math Worksheet Feature Demo",
  class: "Template Reference",
  show-date-field: true,
  show-name-field: true,
)

// ============================================================================
// SECTION 1: BASIC PROBLEM FORMATS
// ============================================================================

= Basic Problem Formats

== Simple Numbered Problems

Use `+` to create automatically numbered problems:

+ What is $5 + 7$?

+ Calculate $12 times 8$.

+ Simplify $frac(24, 6)$.

== Problems with Point Values

Use `#points(n)` to show point values:

+ #points(2) Solve: $x + 5 = 12$

+ #points(3) Factor: $x^2 - 9$

+ #points(5) Solve the system:
  $
  2x + y &= 7 \
  x - y &= 2
  $

// ============================================================================
// SECTION 2: MATH EXPRESSIONS
// ============================================================================

= Math Expressions

== Inline Math

Use single `$` for inline: The area formula is $A = pi r^2$.

== Block Math

Use `$ ... $` with spaces for centered equations:

$ x = frac(-b plus.minus sqrt(b^2 - 4a c), 2a) $

== Common Operations

*Fractions:*
$ frac(1, 2) + frac(1, 3) = frac(5, 6) $

*Square roots:*
$ sqrt(16) = 4 quad sqrt(x^2 + y^2) $

*Exponents:*
$ 2^3 = 8 quad x^(n+1) $

*Subscripts:*
$ x_1, x_2, x_3 quad a_(i+1) $

== Greek Letters

$ alpha, beta, gamma, delta, theta, pi, sigma, omega $

== Aligned Equations

$
3x + 2 &= 14 \
3x &= 12 \
x &= 4
$

== Systems of Equations

$
cases(
  x + y = 10,
  x - y = 4
)
$

// ============================================================================
// SECTION 3: PROBLEM LAYOUTS
// ============================================================================

= Problem Layouts

== Two-Column Grid

Use grids for side-by-side problems:

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    + $15 + 27 =$
    + $48 - 19 =$
    + $6 times 7 =$
  ],
  [
    + $56 div 8 =$
    + $3^4 =$
    + $sqrt(81) =$
  ],
)

== Problem with Work Space

Add space for student work using `#v(height)`:

+ Solve for $x$: $quad 2x + 7 = 15$

#v(2.5cm)

+ Find the area of a triangle with base $10$ cm and height $6$ cm.

#v(2.5cm)

// ============================================================================
// SECTION 4: SPECIAL ELEMENTS
// ============================================================================

= Special Elements

== Instructions Box

#instructions[
  Show all your work. Circle your final answers. No calculators allowed.
]

== Answer Lines

Fill in the blank: The value of $pi$ is approximately #answer-line(width: 1.5cm).

The solution to $x + 5 = 12$ is $x =$ #answer-line().

== Tables for Data

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [*$x$*], [*$x^2$*], [*$2x$*], [*$x^2 + 2x$*],
  [$1$], [$1$], [$2$], [$3$],
  [$2$], [$4$], [$4$], [$8$],
  [$3$], [$9$], [$6$], [$15$],
  [$4$], [], [], [],
  [$5$], [], [], [],
)

Complete the table above.

// ============================================================================
// SECTION 5: GEOMETRY
// ============================================================================

= Geometry Problems

== Formulas Reference

#rect(
  width: 100%,
  fill: gray.lighten(90%),
  stroke: 0.5pt,
  inset: 10pt,
  radius: 4pt,
)[
  *Formulas:*
  - Rectangle: $A = l times w$, $P = 2l + 2w$
  - Circle: $A = pi r^2$, $C = 2 pi r$
  - Triangle: $A = frac(1, 2) b h$
]

#v(0.5em)

+ A rectangle has length $8$ cm and width $5$ cm. Find its area and perimeter.

+ A circle has diameter $14$ cm. Find its circumference. (Use $pi = frac(22, 7)$)

// ============================================================================
// SECTION 6: WORD PROBLEMS
// ============================================================================

= Word Problems

+ Maria has \$50. She buys 3 books at \$8 each and 2 pens at \$2 each. How much money does she have left?

#v(2cm)

+ A train leaves Station A at 9:00 AM traveling at 60 km/h. Another train leaves Station B at 10:00 AM traveling toward Station A at 80 km/h. If the stations are 280 km apart, at what time will they meet?

#v(2cm)

// ============================================================================
// SECTION 7: MULTIPLE CHOICE
// ============================================================================

= Multiple Choice

+ What is the value of $3^2 + 4^2$?

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    [(A) 7], [(B) 12], [(C) 25], [(D) 49]
  )

+ Which expression is equivalent to $2(x + 3)$?

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [(A) $2x + 3$], [(B) $2x + 6$],
    [(C) $x + 6$], [(D) $2x + 5$]
  )

// ============================================================================
// SECTION 8: CHALLENGE SECTION
// ============================================================================

= Challenge Problems

#rect(
  width: 100%,
  fill: yellow.lighten(85%),
  stroke: 1pt + orange,
  inset: 10pt,
  radius: 4pt,
)[
  *Bonus:* These problems are worth extra credit.
]

+ #points(10) Prove that the sum of any three consecutive integers is divisible by 3.

#v(3cm)

+ #points(10) If $f(x) = x^2 - 4x + 3$, find all values of $x$ where $f(x) = 0$.

#v(3cm)

// ============================================================================
// SECTION 9: CONFIGURATION OPTIONS
// ============================================================================

#pagebreak()

= Template Configuration Reference

This section shows the available configuration options for the worksheet template.

== Basic Configuration

```typst
#import "/worksheet.typ": worksheet

#show: worksheet.with(
  title: "My Worksheet",      // Worksheet title
  class: "Grade 8 Math",      // Class/course name
  show-date-field: true,      // Show Date: _____ field
  show-name-field: true,      // Show Name: _____ field
)
```

== All Options

```typst
#show: worksheet.with(
  title: "Algebra Test",
  class: "Math 101",
  date: datetime.today(),
  show-date-field: true,
  show-name-field: true,
  paper: "a4",                // or "us-letter"
  margin: (x: 2cm, y: 2cm),
  font: "Noto Sans",
  font-size: 11pt,
)
```

== Helper Functions

The template provides these helper functions:

- `#instructions[...]` - Blue instruction box
- `#points(n)` - Show point value like "(5 pts)"
- `#answer-line(width: 2cm)` - Underline for answers
- `#workspace(height: 3cm)` - Add space for work

== Math Syntax Quick Reference

#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  inset: 8pt,
  [*Syntax*], [*Result*],
  [`$x^2$`], [$x^2$],
  [`$x_1$`], [$x_1$],
  [`$frac(a, b)$`], [$frac(a, b)$],
  [`$sqrt(x)$`], [$sqrt(x)$],
  [`$times$`], [$times$],
  [`$div$`], [$div$],
  [`$plus.minus$`], [$plus.minus$],
  [`$pi$`], [$pi$],
  [`$theta$`], [$theta$],
  [`$>=, <=, eq.not$`], [$>=, <=, eq.not$],
)

#v(1em)

#align(center)[
  #rect(
    fill: gray.lighten(90%),
    inset: 1em,
    radius: 4pt,
  )[
    *End of Demo* \
    See SYNTAX.md for complete Typst reference
  ]
]
