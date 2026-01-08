// ===========================================================================
// MATH WORKSHEET TEMPLATE
// This file contains the template logic. Import it in main.typ and demo.typ.
// ===========================================================================

#let worksheet(
  title: "Math Worksheet",
  class: "Mathematics",
  date: datetime.today(),
  show-date-field: true,
  show-name-field: true,
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  font: "Noto Sans",
  font-size: 11pt,
  doc,
) = {
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

  // Heading styles for sections
  show heading.where(level: 1): it => {
    v(1.5em)
    text(size: 14pt, weight: "bold")[#it.body]
    v(0.8em)
  }

  show heading.where(level: 2): it => {
    v(1.2em)
    text(size: 12pt, weight: "semibold")[#it.body]
    v(0.5em)
  }

  // Enum styling for problems - generous spacing for student work
  set enum(
    numbering: "1.",
    body-indent: 0.5em,
    spacing: 2.5em,
  )

  // ---------------------------------------------------------------------------
  // HEADER SECTION
  // ---------------------------------------------------------------------------

  // Title
  align(center)[
    #text(size: 20pt, weight: "bold")[#title]
    #v(0.3em)
    #text(size: 12pt, fill: gray)[#class]
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
// HELPER FUNCTIONS
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

// Work space - adds vertical space for student work
#let workspace(height: 4cm) = {
  v(height)
}

// Problem with points
#let points(pts) = {
  text(size: 9pt, fill: gray)[(#pts pts)]
}

// Answer line
#let answer-line(width: 2cm) = {
  box(
    width: width,
    stroke: (bottom: 0.5pt + black),
    inset: (bottom: 2pt),
    []
  )
}

// Grid for arithmetic problems
#let problem-grid(problems, columns: 2) = {
  grid(
    columns: (1fr,) * columns,
    gutter: 2em,
    ..problems
  )
}
