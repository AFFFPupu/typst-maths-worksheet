// ===========================================================================
// MATH WORKSHEET - Oxbridge Math Practice
// Edit this file to change the worksheet problems.
// Template logic is in worksheet.typ
// ===========================================================================

#import "/worksheet.typ": *

#show: worksheet.with(
  title: "Oxbridge Mathematics Practice",
  class: "Advanced Mathematics",
  show-date-field: true,
  show-name-field: true,
  show-answers: false,  // Set to true to generate answer key
)

#instructions[Show all your work. Justify your answers with clear reasoning.]

= Analysis and Calculus

#problem[Which is bigger: $2^x$ or $x^2$? Discuss for different values of $x$.]

#problem(points: 3)[Sketch $y = A(1 - e^(-B x))^2$ where $A, B > 0$.]

#problem(points: 4)[Differentiate $y = x^(sin x)$.]

#answer[Using logarithmic differentiation: $y' = x^(sin x)(cos x ln x + (sin x)/x)$]

#problem[Find an approximation to $1^4 + 2^4 + 3^4 + dots.c + 100^4$.]

#problem(points: 5)[
  Evaluate the following integrals:
]
#subproblem(points: 2)[$integral_0^1 x e^x d x$]
#subproblem(points: 3)[$integral_0^(pi/2) sin^3 x d x$]

#problem[
  If $f(x) = x^3 - 3x + 1$, find all values of $x$ where $f(x) = f'(x)$.
]

= Algebra

#problem[Solve for $x$: $sqrt(x + 5) = 7$]

#answer[$x = 44$]

#problem[
  Factor completely: $x^4 - 16$
]

#problem(points: 4)[
  The polynomial $p(x) = x^3 + a x^2 + b x + c$ has roots $alpha$, $beta$, $gamma$.
]
#subproblem[Express $alpha^2 + beta^2 + gamma^2$ in terms of $a$, $b$, $c$.]
#subproblem[If $alpha + beta + gamma = 0$ and $alpha beta + beta gamma + gamma alpha = -3$, find $alpha^2 + beta^2 + gamma^2$.]

#problem[
  Solve the system:
  $ x + y + z &= 6 \
    x y + y z + z x &= 11 \
    x y z &= 6 $
]

#new-page(title: "Geometry and Combinatorics")

#problem[
  A circle passes through points $A(0, 0)$, $B(4, 0)$, and $C(0, 3)$. Find the radius of the circle.
]

#problem(points: 5)[
  In triangle $A B C$, $angle A = 60degree$, $b = 5$, and $c = 8$. Find side $a$.
]

#problem[
  How many ways can you arrange the letters in "MISSISSIPPI"?
]

#choices(
  [$11!$],
  [$(11!)/(4! 4! 2!)$],
  [$(11!)/(4! 4!)$],
  [$11! / 2$],
  correct: "B",
)

#problem[
  A regular hexagon has side length 2. Find its area.
]

#box-workspace(height: 4cm)

= Number Theory

#problem[
  Find the last two digits of $7^(2024)$.
]

#problem(points: 4)[
  Prove that $n^5 - n$ is divisible by 30 for all positive integers $n$.
]

#lined-workspace(lines: 5)

#problem[
  Find all integer solutions to $x^2 + y^2 = z^2$ where $gcd(x, y, z) = 1$ and $x < y < z < 100$.
]

= Probability

#problem[
  Two dice are rolled. What is the probability that the sum is 7, given that at least one die shows a 4?
]

#answer[$2/11$]

#problem(points: 5)[
  A bag contains 5 red balls and 3 blue balls. Three balls are drawn without replacement.
]
#subproblem[What is the probability that all three are red?]
#subproblem[What is the probability that exactly two are red?]
#subproblem[What is the expected number of red balls drawn?]

= Challenge Problems

#problem(points: 10)[
  Let $f: RR -> RR$ be a function such that $f(x + y) = f(x) + f(y)$ for all $x, y in RR$.
  If $f$ is continuous at $x = 0$, prove that $f(x) = c x$ for some constant $c$.
]

#lined-workspace(lines: 8)

#problem(points: 10)[
  Evaluate: $ sum_(n=1)^oo 1/(n(n+1)(n+2)) $
]
