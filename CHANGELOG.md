# Changelog

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
