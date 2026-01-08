// ============================================================================
// MATH WORKSHEET DEMO
// This file demonstrates all features of the math worksheet template.
// Use this as a reference when creating your worksheets.
// ============================================================================

#import "/worksheet.typ": *

#show: worksheet.with(
  title: "Math Worksheet Feature Demo",
  class: "Template Reference",
  show-date-field: true,
  show-name-field: true,
  show-answers: false,  // Set to true to see answer key
)

// ============================================================================
// SECTION 1: PROBLEM FUNCTION (RECOMMENDED)
// ============================================================================

= Problem Function

The `#problem` function provides automatic numbering that works with workspaces.

#problem[What is $5 + 7$?]

#problem[Calculate $12 times 8$.]

#problem[Simplify $frac(24, 6)$.]

== Problems with Points

#problem(points: 2)[Solve: $x + 5 = 12$]

#problem(points: 3)[Factor: $x^2 - 9$]

#answer[$(x+3)(x-3)$]

== Custom Workspace

#problem(space: 4cm)[Solve for $x$: $2x + 7 = 15$]

#problem(space: 3cm)[Find the area of a triangle with base $10$ cm and height $6$ cm.]

= Sub-Problems

Use `#subproblem` for multi-part questions with (a), (b), (c) numbering.

#problem(points: 6)[Evaluate the following:]
#subproblem(points: 2)[$3^4$]
#subproblem(points: 2)[$sqrt(144)$]
#subproblem(points: 2)[$frac(15!, 13!)$]

#problem[Consider the function $f(x) = x^2 - 4x + 3$.]
#subproblem[Find $f(0)$.]
#subproblem[Find all $x$ where $f(x) = 0$.]
#subproblem[Sketch the graph of $f(x)$.]

// ============================================================================
// SECTION 2: WORKSPACE VARIANTS
// ============================================================================

= Workspace Types

== Basic Workspace

Adds vertical space for student work:

#problem(space: 0em)[Solve the equation: $3x - 7 = 14$]
#workspace(height: 2cm)

== Lined Workspace

For written explanations:

#problem(space: 0em)[Explain why $0.999... = 1$.]
#lined-workspace(lines: 4)

== Box Workspace

Bordered area for neat work:

#problem(space: 0em)[Show your calculation for $125 div 5$.]
#box-workspace(height: 2.5cm)

== Grid Workspace

For graphs and geometric constructions:

#problem(space: 0em)[Plot the points $A(2, 3)$, $B(-1, 4)$, and $C(3, -2)$.]
#grid-workspace(height: 4cm)

// ============================================================================
// SECTION 3: ANSWER KEY FEATURES
// ============================================================================

= Answer Key Features

These features appear only when `show-answers: true` is set.

== Inline Answers

What is $7 times 8$? #answer[56]

The derivative of $x^3$ is #answer[$3x^2$].

== Answer Lines

Fill in the blank: $sqrt(64) =$ #answer-line(body: [8])

The value of $pi$ is approximately #answer-line(body: [3.14], width: 2cm).

== Answer Box

#problem(space: 0em)[Explain the Pythagorean theorem.]
#answer-box(body: [In a right triangle, $a^2 + b^2 = c^2$ where $c$ is the hypotenuse.], height: 2cm)

== Fill-in-the-Blank Math

Use `#blank` for blanks in equations:

$ 2 + #blank = 5 $

Use `#boxed` for blanks that show answers:

$ x^2 - 4 = (x + 2)(#boxed[$x - 2$]) $

// ============================================================================
// SECTION 4: MULTIPLE CHOICE
// ============================================================================

= Multiple Choice

#problem(space: 0em)[What is the value of $3^2 + 4^2$?]
#choices(
  [7],
  [12],
  [25],
  [49],
  correct: "C",
)

#problem(space: 0em)[Which expression equals $2(x + 3)$?]
#choices(
  [$2x + 3$],
  [$2x + 6$],
  [$x + 6$],
  [$2x + 5$],
  columns: 2,
  correct: "B",
)

#problem(space: 0em)[What is $sqrt(81)$?]
#choices-row(
  [3],
  [9],
  [27],
  [81],
  correct: "B",
)

// ============================================================================
// SECTION 5: LAYOUT HELPERS
// ============================================================================

#new-page(title: "Layout Helpers")

== Instructions Box

#instructions[
  Show all your work. Circle your final answers. No calculators allowed.
]

== Section Notes

#note[The following problems review material from Chapter 3.]

#problem[Simplify: $4a + 3b - 2a + 5b$]

== Divider

#divider()

== Problem Grid

Use grids for side-by-side problems (these use `+` enum style):

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
    + $5^3 =$
    + $sqrt(81) =$
  ],
)

// ============================================================================
// SECTION 6: MATH EXPRESSIONS REFERENCE
// ============================================================================

= Math Expressions

== Inline vs Block

Inline math: The area formula is $A = pi r^2$.

Block math (centered):
$ x = frac(-b plus.minus sqrt(b^2 - 4a c), 2a) $

== Common Operations

*Fractions:* $frac(1, 2) + frac(1, 3) = frac(5, 6)$

*Square roots:* $sqrt(16) = 4$, $sqrt(x^2 + y^2)$

*Exponents:* $2^3 = 8$, $x^(n+1)$

*Subscripts:* $x_1, x_2, x_3$, $a_(i+1)$

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
// SECTION 7: SPECIAL BOXES
// ============================================================================

= Special Content Boxes

== Formula Reference Box

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

== Challenge Box

#rect(
  width: 100%,
  fill: yellow.lighten(85%),
  stroke: 1pt + orange,
  inset: 10pt,
  radius: 4pt,
)[
  *Bonus:* These problems are worth extra credit.
]

== Tables

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

// ============================================================================
// SECTION 8: CONFIGURATION REFERENCE
// ============================================================================

#new-page(title: "Configuration Reference")

== Basic Setup

```typst
#import "/worksheet.typ": *

#show: worksheet.with(
  title: "My Worksheet",
  class: "Grade 8 Math",
  show-answers: false,
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
  show-answers: false,     // true for answer key
  paper: "a4",             // or "us-letter"
  margin: (x: 2cm, y: 2cm),
  font: "Noto Sans",
  font-size: 11pt,
)
```

== Available Functions

#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  inset: 8pt,
  [*Function*], [*Description*],
  [`#problem[...]`], [Numbered problem with auto counter],
  [`#subproblem[...]`], [Sub-problem (a), (b), (c)],
  [`#workspace(height: 4cm)`], [Blank vertical space],
  [`#lined-workspace(lines: 4)`], [Lined writing space],
  [`#box-workspace(height: 4cm)`], [Bordered workspace],
  [`#grid-workspace(height: 5cm)`], [Graph paper area],
  [`#answer[...]`], [Conditional answer (answer key only)],
  [`#answer-line(body: [...])`], [Fill-in line with answer],
  [`#answer-box(body: [...])`], [Answer box area],
  [`#choices([A], [B], ...)`], [Multiple choice (auto-labeled A, B, C...)],
  [`#instructions[...]`], [Blue instruction box],
  [`#note[...]`], [Italic section note],
  [`#divider()`], [Horizontal divider],
  [`#new-page(title: none)`], [Page break with optional heading],
  [`#blank`], [Blank in equations],
  [`#boxed[...]`], [Blank that shows answer],
)

== Math Syntax Quick Reference

#table(
  columns: (auto, auto, auto, auto),
  stroke: 0.5pt,
  inset: 8pt,
  [*Syntax*], [*Result*], [*Syntax*], [*Result*],
  [`$x^2$`], [$x^2$], [`$x_1$`], [$x_1$],
  [`$frac(a, b)$`], [$frac(a, b)$], [`$sqrt(x)$`], [$sqrt(x)$],
  [`$times$`], [$times$], [`$div$`], [$div$],
  [`$plus.minus$`], [$plus.minus$], [`$pi$`], [$pi$],
  [`$>=, <=, eq.not$`], [$>=, <=, eq.not$], [`$theta$`], [$theta$],
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
