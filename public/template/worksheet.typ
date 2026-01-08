// ===========================================================================
// MATH WORKSHEET TEMPLATE
// This file contains the template logic. Import it in main.typ and demo.typ.
// ===========================================================================

// ---------------------------------------------------------------------------
// STATE: Counters and answer key toggle
// ---------------------------------------------------------------------------

#let problem-counter = counter("problem")
#let subproblem-counter = counter("subproblem")
#let _show-answers = state("show-answers", false)

// ---------------------------------------------------------------------------
// MAIN TEMPLATE FUNCTION
// ---------------------------------------------------------------------------

#let worksheet(
  title: "Math Worksheet",
  class: "Mathematics",
  date: datetime.today(),
  show-date-field: true,
  show-name-field: true,
  show-answers: false,
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  font: "Noto Sans",
  font-size: 11pt,
  doc,
) = {
  // Initialize answer key state
  _show-answers.update(show-answers)

  // Document metadata
  set document(title: title)

  // Page setup
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
    footer: context {
      let current = counter(page).get().first()
      let total = counter(page).final().first()
      if total > 1 {
        align(center, text(size: 9pt, fill: gray)[Page #current of #total])
      }
    },
  )

  // Text and paragraph setup
  set text(font: font, size: font-size)
  set par(justify: false, leading: 0.8em)

  // Center block math equations
  show math.equation.where(block: true): it => {
    block(width: 100%, align(center, it))
  }

  // Heading styles for sections - also resets problem counter
  show heading.where(level: 1): it => {
    problem-counter.update(0)
    v(1.5em)
    text(size: 14pt, weight: "bold")[#it.body]
    v(0.8em)
  }

  show heading.where(level: 2): it => {
    v(1.2em)
    text(size: 12pt, weight: "semibold")[#it.body]
    v(0.5em)
  }

  // Enum styling for inline lists
  set enum(
    numbering: "1.",
    body-indent: 0.5em,
    spacing: 1.5em,
  )

  // ---------------------------------------------------------------------------
  // HEADER SECTION
  // ---------------------------------------------------------------------------

  // Title
  align(center)[
    #text(size: 20pt, weight: "bold")[#title]
    #v(0.3em)
    #text(size: 12pt, fill: gray)[#class]
    #context {
      if _show-answers.get() {
        v(0.3em)
        text(size: 12pt, weight: "bold", fill: red)[— ANSWER KEY —]
      }
    }
  ]

  v(1.2em)

  // Fill-in fields
  {
    let field-line = box(
      width: 4cm,
      stroke: (bottom: 0.5pt + black),
      inset: (bottom: 2pt),
      []
    )

    grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      align: (left, right),
      if show-name-field [*Name:* #field-line],
      if show-date-field [*Date:* #field-line],
    )
  }

  v(1em)
  line(length: 100%, stroke: 1.5pt)
  v(1.5em)

  // Document body
  doc
}

// ===========================================================================
// PROBLEM FUNCTIONS
// ===========================================================================

// Main problem with automatic numbering
// Usage: #problem[What is 2 + 2?]
// Usage: #problem(points: 5)[What is 2 + 2?]
// Usage: #problem(space: 5cm)[What is 2 + 2?]
#let problem(
  body,
  points: none,
  space: 2.5em,
  number: auto,
) = {
  problem-counter.step()
  subproblem-counter.update(0)

  context {
    let num = if number == auto {
      problem-counter.get().first()
    } else {
      number
    }

    let points-display = if points != none {
      h(0.5em) + text(size: 9pt, fill: gray)[(#points pts)]
    }

    block(spacing: 0.8em)[
      *#num.* #body #points-display
    ]
  }

  v(space)
}

// Sub-problem with (a), (b), (c) numbering
// Usage: #subproblem[Find x]
#let subproblem(
  body,
  points: none,
  space: 1.5em,
) = {
  subproblem-counter.step()

  context {
    let num = subproblem-counter.get().first()
    let letter = "abcdefghijklmnopqrstuvwxyz".at(num - 1)

    let points-display = if points != none {
      h(0.5em) + text(size: 9pt, fill: gray)[(#points pts)]
    }

    block(spacing: 0.6em, inset: (left: 1.5em))[
      *(#letter)* #body #points-display
    ]
  }

  v(space)
}

// Reset problem counter (useful for new sections without headings)
#let reset-problems() = {
  problem-counter.update(0)
}

// Continue problem numbering (prevents reset on next heading)
#let continue-numbering() = {
  // This is a marker - actual implementation would need show rule modification
}

// ===========================================================================
// WORKSPACE FUNCTIONS
// ===========================================================================

// Basic workspace - adds vertical space
#let workspace(height: 4cm) = {
  v(height)
}

// Lined workspace for written answers
#let lined-workspace(lines: 4, line-height: 1cm) = {
  v(0.5em)
  for i in range(lines) {
    line(length: 100%, stroke: 0.5pt + gray.lighten(40%))
    v(line-height)
  }
}

// Grid workspace for graphs or geometric work
#let grid-workspace(
  width: 100%,
  height: 5cm,
  cell-size: 0.5cm,
) = {
  v(0.5em)
  box(
    width: width,
    height: height,
    stroke: 0.5pt + gray,
    {
      // Vertical lines
      let cols = int(100% / cell-size)
      for i in range(1, 20) {
        place(
          dx: cell-size * i,
          line(start: (0pt, 0pt), end: (0pt, height), stroke: 0.3pt + gray.lighten(50%))
        )
      }
      // Horizontal lines
      for i in range(1, int(height / cell-size)) {
        place(
          dy: cell-size * i,
          line(start: (0pt, 0pt), end: (100%, 0pt), stroke: 0.3pt + gray.lighten(50%))
        )
      }
    }
  )
  v(0.5em)
}

// Box workspace - bordered area for work
#let box-workspace(height: 4cm) = {
  v(0.3em)
  rect(
    width: 100%,
    height: height,
    stroke: 0.5pt + gray,
    fill: none,
  )
  v(0.3em)
}

// ===========================================================================
// ANSWER FUNCTIONS
// ===========================================================================

// Answer that shows only in answer key mode
// Usage: #answer[42]
#let answer(body) = {
  context {
    if _show-answers.get() {
      text(fill: red, weight: "bold")[#body]
    }
  }
}

// Answer line with optional answer
// Usage: #answer-line[] or #answer-line[42]
#let answer-line(body: none, width: 3cm) = {
  box(
    width: width,
    stroke: (bottom: 0.5pt + black),
    inset: (bottom: 2pt, x: 4pt),
    baseline: 2pt,
  )[
    #context {
      if body != none and _show-answers.get() {
        text(fill: red, weight: "bold")[#body]
      }
    }
  ]
}

// Answer box for longer answers
#let answer-box(body: none, height: 2cm) = {
  rect(
    width: 100%,
    height: height,
    stroke: 0.5pt + gray,
    inset: 8pt,
  )[
    #context {
      if body != none and _show-answers.get() {
        text(fill: red)[#body]
      }
    }
  ]
}

// ===========================================================================
// MULTIPLE CHOICE
// ===========================================================================

// Multiple choice options - each option on its own line
// Usage: #choices([Option A], [Option B], [Option C], [Option D], correct: "C")
// Labels are auto-generated as A, B, C, D...
#let choices(
  ..options,
  correct: none,
  spacing: 1em,  // Adjust for taller content like fractions
) = {
  let items = options.pos()
  let labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  v(0.5em)
  for (i, item) in items.enumerate() {
    let label = labels.at(i)
    let is-correct = label == correct
    context {
      let show-answer = _show-answers.get() and is-correct
      if show-answer {
        block(above: spacing, below: spacing)[#text(fill: red, weight: "bold")[*(#label)* #item]]
      } else {
        block(above: spacing, below: spacing)[*(#label)* #item]
      }
    }
  }
  v(0.5em)
}

// Multiple choice in a single horizontal row (for short options)
// Usage: #choices-row([3], [9], [27], [81], correct: "B")
#let choices-row(
  ..options,
  correct: none,
) = {
  let items = options.pos()
  let labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  v(0.3em)
  grid(
    columns: (auto,) * items.len(),
    column-gutter: 3em,
    ..items.enumerate().map(((i, item)) => {
      let label = labels.at(i)
      let is-correct = label == correct
      context {
        let show-answer = _show-answers.get() and is-correct
        if show-answer {
          text(fill: red, weight: "bold")[*(#label)* #item]
        } else {
          [*(#label)* #item]
        }
      }
    })
  )
  v(0.8em)
}

// ===========================================================================
// LAYOUT HELPERS
// ===========================================================================

// Instructions box
#let instructions(body) = {
  v(0.5em)
  rect(
    width: 100%,
    fill: blue.lighten(90%),
    stroke: 1pt + blue,
    radius: 4pt,
    inset: 12pt,
  )[
    *Instructions:* #body
  ]
  v(0.8em)
}

// Section instructions (lighter style)
#let note(body) = {
  v(0.3em)
  text(size: 10pt, style: "italic", fill: gray.darken(20%))[#body]
  v(0.5em)
}

// Points display helper
#let points(pts) = {
  text(size: 9pt, fill: gray)[(#pts pts)]
}

// Two-column problem grid
#let problem-grid(problems, columns: 2) = {
  grid(
    columns: (1fr,) * columns,
    gutter: 2em,
    ..problems
  )
}

// Horizontal rule
#let divider() = {
  v(1em)
  line(length: 100%, stroke: 0.5pt + gray)
  v(1em)
}

// Page break with optional section title
#let new-page(title: none) = {
  pagebreak()
  if title != none {
    heading(level: 1, title)
  }
}

// ===========================================================================
// MATH HELPERS
// ===========================================================================

// Blank in equation (for fill-in-the-blank)
#let blank = box(
  width: 1.5em,
  stroke: (bottom: 1pt + black),
  inset: (bottom: 2pt),
  []
)

// Boxed answer (for showing answers in equations)
#let boxed(body) = {
  context {
    if _show-answers.get() {
      box(stroke: 1pt + red, inset: 3pt, text(fill: red)[#body])
    } else {
      box(
        width: 1.5em,
        stroke: (bottom: 1pt + black),
        inset: (bottom: 2pt),
        []
      )
    }
  }
}
