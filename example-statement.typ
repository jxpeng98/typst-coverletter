#import "modernpro-coverletter-plus.typ": *

// Edit identity and contacts here. Keeping them beside the statement content
// makes this starter a self-contained document with no personal-data imports.
#let profile = (
  name: [Your Name],
  // Shown under your contacts, one part per line. Plain content also works.
  education: (
    degree: [Degree, Major],
    school: [University Name],
    graduation: [Expected Month Year],
  ),
  // One entry per line
  address: ([Street Address], [City, State ZIP]),
  contacts: (
    (text: [name\@candidate.invalid], link: "mailto:name@candidate.invalid"),
    (text: [+0 (000) 000-0000]),
    (text: [site.candidate.invalid], link: "https://site.candidate.invalid"),
  ),
)

// Personal, research, or scholarship statement. Shares the header, type scale,
// and colour of the cover letter and of modernpro-cv. A compact continuation
// header with page numbering appears automatically from page 2.
#show: statement.with(
  profile: profile,
  title: [Personal Statement],
)

= Background

Introduce the experience or question that led you to your field and explain why
it matters to you.

= Experience

Describe your strongest projects, coursework, and contributions, and what you
learned from each.

= Goals

Set out what you plan to do next and how this program or opportunity helps you
get there.
