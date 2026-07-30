# Changelog

## [1.0.0] - 2026-07-30

Visual redesign, plus a body-style bug fix that changed how every letter has
rendered since 0.0.x. The configuration API stays backward compatible: every
legacy parameter still resolves.

### Fixed

- **Body text styling never applied.** `apply-letter-body-style` set `text` and
  `par` rules inside a helper that produced no content, so Typst scoped them to
  that helper and discarded them. Letters therefore rendered at Typst's 11pt
  default with default leading and paragraph spacing, while the greeting and the
  signature — styled inline — rendered at the configured 10.8pt. `body-size`,
  `line-spacing`, `paragraph-spacing`, `justify`, `first-line-indent`, and
  `link-colour` were all inert. These rules now live in the template body.
- **Header lines overlapped.** Typst measures a line box down to the baseline, so
  the descenders of a 19pt name hung outside it and collided with the role line
  below. The identity block now extends its bottom edge.
- The statement title used a `heading`, so the level-1 show rule overrode its own
  spacing tokens. It is now a plain block.

### Changed

- Rebuilt the visual system to match modernpro-cv 2.0.0: a single serif family in
  two weights, a restrained academic size ladder, and four colours. Body text is
  10.8pt; page margins are 2.2cm left and right with a fixed 2cm top margin,
  identical to the CV.
- The first-page identity area now has an explicit height and isolated paragraph
  spacing, so the CV, cover letter, and statement place their header rule at the
  same vertical and horizontal coordinates.
- Research and teaching statements enable a compact continuation header by
  default. It includes the candidate name, document title, and page count.
- Contact rendering now mirrors modernpro-cv, including optional icons, so the
  same `profile` dictionary drives a CV, a cover letter, and a statement.
- Paragraph spacing is now clearly larger than line spacing, so paragraphs read
  as separate blocks.
- `resolve-letter-config` takes named arguments instead of 28 positional ones.
- Public examples now use explicitly fictional people, institutions, projects,
  claims, reserved domains, and placeholder identifiers.
- The README now covers document selection, a first-edit workflow, shared
  profiles, common recipes, continuation headers, and troubleshooting.
- The release workflow now validates the package version, compiles both
  document types, builds a complete archive, and publishes with the
  repository-scoped GitHub token.

### Added

- `preset: "compact" | "default" | "relaxed"` replaces `layout: (density: ...)`,
  which still works. `accent:` sets the document's one colour in one place.
- Each starter keeps its editable profile dictionary inline, so cover letters
  and statements are self-contained single-file documents.
- Added `header-height` and `page-numbering` layout controls for exceptional
  mastheads and continuation pages.

## [0.0.8] - 2025-12-10

### Added

- **Extensive Customization Options**: Added 20+ new parameters for fine-grained control over appearance and layout
  - **Colour Options**: `link-colour` for customizing hyperlink colors
  - **Font Size Options**: `cl-title-size`, `supplement-size` for cover letter title and supplement text
  - **Layout Options**: `line-spacing`, `paragraph-spacing`, `contact-separator` for text flow control
  - **Header Alignment**: `name-align`, `address-align`, `contact-align` for flexible header positioning
  - **Font Weight Options**: `name-weight`, `body-weight`, `salutation-weight`, `signature-weight` for typography control
  - **Date Format**: `date-format` parameter for customizing auto-generated date display
  - **Signature Spacing**: `closing-spacing`, `signature-spacing`, `supplement-spacing` for professional signature blocks

### Changed

- **Default Parameter Values**: Changed default values from empty strings to `none` for better semantic clarity
  - `font-type`, `name`, and all `recipient` fields now default to `none`
  - Improved condition checks to handle `none`, `[]`, and `""` consistently
- **Signature Block Layout**: Redesigned with improved spacing defaults optimized for electronic documents
  - `closing-spacing`: `0.8em` (space before salutation)
  - `signature-spacing`: `0.3em` (space for signature, increase to 2em+ for printed versions)
  - `supplement-spacing`: `0.8em` (space before enclosures/attachments)
- **Header Display Logic**: Name, address, and contacts now only display when provided (not empty)

### Fixed

- **Supplements Display Bug**: Fixed issue where `supplements` parameter was displaying raw code instead of rendered content
  - Changed type checking from string comparison to proper type objects (`type(supplements) == array`)
- **Contact Display**: Now properly uses `contact-separator` parameter and `link-colour` if specified

### Improved

- **Documentation**: Comprehensive README update with categorized parameter tables
- **Examples**: Updated all example and template files with commented customization options
- **Flexibility**: Templates now support both electronic and print versions with adjustable spacing

## [0.0.7] - Previous

### Added

- Allow both `coverletter` and `statement` templates to accept a `margin` argument for configurable page layouts.
