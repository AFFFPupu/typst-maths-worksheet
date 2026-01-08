# AI Instructions for Math Worksheet Template

## Files

- `public/template/main.typ` - EDIT THIS (content)
- `public/template/worksheet.typ` - DO NOT EDIT (template)
- `public/template/demo.typ` - REFERENCE (examples)
- `SYNTAX.md` - REFERENCE (math syntax)

## Quick Start

1. Edit `main.typ` only
2. Set `title` and `class` in `worksheet.with(...)`
3. Use `= Section` for headings (resets numbering)
4. Use `#problem[...]` for numbered problems
5. Use `#subproblem[...]` for (a), (b), (c) parts
6. Set `show-answers: true` for answer key

## Functions

Problems: `#problem`, `#subproblem`
Workspaces: `#workspace`, `#lined-workspace`, `#box-workspace`, `#grid-workspace`
Answers: `#answer`, `#answer-line`, `#answer-box`, `#blank`, `#boxed`
Choices: `#choices`, `#choices-row`
Layout: `#instructions`, `#note`, `#divider`, `#new-page`

See `demo.typ` for examples. See `SYNTAX.md` for math syntax.

## Do NOT

- Modify `worksheet.typ`
- Use relative imports (use `/worksheet.typ`)
