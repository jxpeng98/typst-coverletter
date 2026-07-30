# modernpro-coverletter

An academic-first Typst package for cover letters and research, teaching, or
personal statements. It shares its design system and its `profile` dictionary
with [modernpro-cv](https://typst.app/universe/package/modernpro-cv), so a CV, a
letter, and a statement read as one application.

The default design is intentionally complete. Most users only need to provide
their profile, the recipient, and the letter text.

## Preview

### Academic cover letter

[![Academic cover letter](screenshots/coverletter.png)](screenshots/coverletter.png)

### Research statement

[![Research statement](screenshots/statement.png)](screenshots/statement.png)

## Quick start

Create a project with the Typst CLI:

```bash
typst init @preview/modernpro-coverletter
```

The generated project contains `profile.typ`, `coverletter.typ`, and
`statement.typ`. Compile either document with `typst compile`.

## Minimal academic cover letter

Keep your identity in `profile.typ` — the same file modernpro-cv takes — and
import it:

```typst
// profile.typ
#let profile = (
  name: [Dr. Maya Chen],
  role: [Lecturer in Computational Social Science],
  address: [Edinburgh, United Kingdom],
  contacts: (
    (text: [maya\@northbridge.example], link: "mailto:maya@northbridge.example"),
    (text: [maya.example.org], link: "https://maya.example.org"),
    (text: [ORCID~0000-0000-0000-0000], link: "https://orcid.org/0000-0000-0000-0000"),
  ),
)
```

```typst
#import "@preview/modernpro-coverletter:1.0.0": *
#import "profile.typ": profile

#show: coverletter.with(
  profile: profile,
  recipient: (
    name: [Professor Eleanor Hughes],
    role: [Chair, Faculty Search Committee],
    department: [School of Public Policy],
    organization: [Eastborough University],
    address: [London, United Kingdom],
    date: [9 July 2026],
    subject: [Application for Lecturer in Digital Governance],
    greeting: [Dear Professor Hughes and Members of the Committee,],
  ),
)

Write the opening paragraph here.

Write the research, teaching, or professional case in short block paragraphs.

Close by explaining the fit and thanking the committee.
```

The default closing is `Sincerely,` followed by the profile name. Override it
only when needed:

```typst
closing: (
  salutation: [Best regards,],
  supplements: ([Enclosure: Curriculum vitae],),
)
```

## The three settings

Everything beyond `profile` and `recipient` is optional:

| Setting | Values | Purpose |
| --- | --- | --- |
| `profile` | `name`, optional `role`, `address`, `contacts` | Who you are |
| `preset` | `"compact"`, `"default"`, `"relaxed"` | The whole vertical rhythm |
| `accent` | any colour | The one colour in the document |

```typst
#show: coverletter.with(
  profile: profile,
  recipient: (...),
  preset: "compact",
  accent: rgb("#1e3a5f"),
)
```

A preset coordinates header rows, recipient and subject spacing, title spacing,
heading-to-body gaps, line spacing, and paragraph spacing at once. Choose a
preset rather than tuning gaps individually.

## Recipient fields

The `recipient` group uses ordinary letter terminology:

| Field | Purpose |
| --- | --- |
| `name` | Recipient or committee chair |
| `role` | Role or position |
| `department` | Department, school, or unit |
| `organization` | University, company, or institution |
| `address` | City or postal address |
| `postcode` | Optional separate postcode line |
| `date` | Letter date; omit it to use today's date |
| `subject` | Sentence-case application subject |
| `greeting` | Opening greeting |

All fields except the date are optional. Empty optional fields do not leave
placeholder gaps.

## Statement template

`statement` uses the same profile, header, and visual identity. First- and
second-level Typst headings are styled automatically, so a research statement
stays easy to edit:

```typst
#import "@preview/modernpro-coverletter:1.0.0": *
#import "profile.typ": profile

#show: statement.with(
  profile: profile,
  title: [Research Statement],
)

= Research agenda
Introduce the question that connects your work.

= Current programme
Describe your strongest projects, methods, and contributions.

= Future work
Set out the next phase of the programme.
```

## Shared academic design

The CV, cover letter, and statement use the same tokens.

| | |
| --- | --- |
| Family | PT Serif, falling back to Libertinus Serif — one family, two weights |
| Sizes | 8.8pt captions · 9.8pt recipient and address · 10.8pt body · 15pt statement title · 18pt name |
| Colours | `#1f2933` ink · `#667085` muted · `#1e3a5f` accent · `#dde3ea` rules |
| Margins | 2.2cm left and right · fixed 2cm top, matching modernpro-cv |
| Header | Split grid: name, role, and location left; stacked contacts right; accent rule below |
| Paragraph style | Left aligned, no first-line indent, block paragraphs |

Because the left and right margins match the CV exactly, the header rule lands
at the same position in every document of the application.

Block paragraphs are easier to scan than justified text carrying both an indent
and a blank gap. The default starter also avoids decorative icons, keeping text
extraction and accessibility clean.

## Advanced configuration

Most documents never need this section. When you do need a specific override,
optional settings are grouped by purpose:

| Group | Use it for |
| --- | --- |
| `theme` | Fonts, semantic colours, sizes, and weights |
| `layout` | Margins, paragraph rhythm, header layout, and continuation behaviour |
| `closing` | Sign-off, signature spacing, and enclosures |

The semantic theme keys match modernpro-cv:

```typst
theme: (
  font: "PT Serif",
  text: rgb("#1f2933"),
  heading: rgb("#1f2933"),
  muted: rgb("#667085"),
  accent: rgb("#1e3a5f"),
  rule: rgb("#dde3ea"),
)
```

Common layout keys are:

| Key | Purpose | Default |
| --- | --- | --- |
| `preset` | Coordinated document rhythm: `"compact"`, `"default"`, or `"relaxed"` | `"default"` |
| `margin` | Page margins | Academic margins above |
| `first-line-indent` | Paragraph indent | `0em` |
| `line-spacing` | Typst paragraph leading | `0.72em` at the default preset |
| `paragraph-spacing` | Space between paragraphs | `1.35em` at the default preset |
| `justify` | Fully justify body text | `false` |
| `header-style` | `"split"` or `"centered"` | `"split"` |
| `contact-layout` | `"stacked"` or `"inline"` contacts in a split header | `"stacked"` |
| `repeat-header` | Add a compact continuation header from page 2 | cover letter: `false`; statement: `true` |
| `page-numbering` | Add current and total page count to continuation headers | `true` |
| `header-height` | First-page identity area height | `17mm` |
| `contact-separator` | Separator between contact items | `" · "` |
| `date-format` | Format for an automatic date | `[day] [month repr:long] [year]` |

The full identity header is always part of the first page's document flow. Its
position does not move when continuation behaviour changes. If `repeat-header`
is enabled, later pages receive only a compact name, document label, and page
count; contact details are not repeated or placed outside the accessible first
page structure. Statements enable this behaviour by default.

## Contacts

A contact may be linked, unlinked, or plain content, and may carry an optional
`icon` exactly as in modernpro-cv:

```typst
contacts: (
  (text: [you\@example.edu], link: "mailto:you@example.edu"),
  (text: [your-site.example], link: "https://your-site.example"),
  [ORCID 0000-0000-0000-0000],
)
```

Escape `@` as `\@` inside Typst content. Two or three concise academic contacts
usually fit best. FontAwesome remains usable as an opt-in content choice, but it
is not required by the package or starter.

## Legacy compatibility

Nothing was removed. The flat parameters `font-type`, `name`, `address`,
`contacts`, the colour parameters (`primary-colour`, `headings-colour`,
`subheadings-colour`, `date-colour`, `link-colour`), the type sizes, and the
spacing parameters all still resolve. `layout: (density: ...)` remains an
accepted spelling of `preset`.

The recipient aliases `start-title` and `cl-title` still map to `greeting` and
`subject`. `institution` remains an alias for `organization`, and `position`
remains an alias for `role`. The legacy `salutation` argument controls the
closing sign-off.

New documents should use `profile`, `recipient`, and the three settings shown in
the quick start.

## Upgrading from 0.0.x

Your existing documents keep compiling, and they will change more than a visual
redesign alone would explain. In 0.0.x the body style was applied inside a
helper function that produced no content, so Typst scoped the rules to that
helper and discarded them: letters rendered at Typst's 11pt default rather than
the configured `body-size`, and `line-spacing`, `paragraph-spacing`, `justify`,
`first-line-indent`, and `link-colour` had no effect at all. Those settings now
work. If you had compensated for the old behaviour with manual overrides,
remove them.

## Local development

Compile the repository examples against the working template:

```bash
typst compile example-coverletter.typ
typst compile example-statement.typ
```

All people, institutions, positions, projects, and claims in the examples are
fictional.

## License

This template is released under the MIT License. See [LICENSE](LICENSE).
