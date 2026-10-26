#import "@preview/modernpro-coverletter-plus:1.0.0": *

// Edit identity and contacts here. Keeping them beside the letter content
// makes this starter a self-contained document with no personal-data imports.
#let profile = (
  name: [Your Name],
  // Shown under your contacts, one part per line. Plain content also works:
  //   education: [Degree, University]
  // Add `gpa: [0.00]` if you want it listed.
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

// Formal cover letter. Everything below `profile` and `recipient` is optional:
//   preset: "compact" | "default" | "relaxed"   vertical rhythm
//   accent: rgb("#1e3a5f")                      the one colour in the document
//   layout: (date-position: "top")              date above the recipient, as in a business letter
//   layout: (auto-greeting: false)              turn off the automatic greeting
#show: coverletter.with(
  profile: profile,
  layout: (date-position: "top"),
  recipient: (
    name: [Recipient Name],
    role: [Recipient Title],
    department: [Department],
    organization: [Company or Institution],
    address: ([Street Address], [City, State ZIP]),
    // The subject line is built as "Re: Position Title (Ref. Job ID)".
    // Delete `reference` if there is no job ID, or write `subject: [...]` to override.
    application: [Position Title],
    reference: [Job ID],
    // The date fills in automatically; uncomment to set it yourself.
    // date: [1 January 2026],
    // The greeting defaults to "Dear <name>," or "Dear Hiring Manager," without a name.
    // greeting: [Dear Members of the Committee,],
  ),
  salutation: "Sincerely,",
  // Printed as "Enclosure: ..." (or "Enclosures: ..." with more than one).
  enclosures: ([Resume],),
  // cc: ([Name],),
  // signature: image("signature.png", height: 1.2cm),
)

State the position you are applying for, your school and year, and why the role
and company interest you.

Describe your most relevant project, coursework, or experience: what you built or
did, the skills you used, and the result.

Explain what you want to learn from the role and what you would contribute, then
close by thanking the reader and saying you would welcome the chance to talk.
