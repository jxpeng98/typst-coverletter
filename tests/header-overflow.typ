// Run: typst compile --root . tests/header-overflow.typ /tmp/letter-header.pdf
// Optional --input keys: count, mode (stacked/inline/centered), icons (false/true/fontawesome),
// long (true/false), preset, width, height (minimum header height in mm), kind (letter/statement).
#import "../modernpro-coverletter-plus.typ": coverletter, statement, resolve-letter-config, letter-contact-display
#assert.eq(resolve-letter-config(layout: (header-style: "centered")).name-align, center)
#assert.eq(resolve-letter-config(layout: (header-style: "centered"), name-align: right).name-align, right)
#assert.eq(resolve-letter-config(layout: (header-style: "centered", name-align: left), name-align: right).name-align, left)
#let count = int(sys.inputs.at("count", default: "8"))
#let mode = sys.inputs.at("mode", default: "stacked")
#let minimum = float(sys.inputs.at("height", default: "17")) * 1mm
#set page(width: float(sys.inputs.at("width", default: "210")) * 1mm)
#let long = sys.inputs.at("long", default: "false") == "true"
#let contact-text(i) = if long {
  (
    "verylongacademicdepartmentaddress.with.extra.components@research.example.invalid",
    "https://research.example.invalid/people/extraordinarilylongresearchgroupidentifier/publications",
    "abcdefghij" * 12,
  ).at(calc.rem(i, 3))
} else { "Contact " + str(i) + ": candidate.invalid" }
// Real Font Awesome coverage is opt-in; it requires the Font Awesome 7 fonts.
#let icon-kind = sys.inputs.at("icons", default: "false")
#let contact-icon(i, ..edges) = {
  // Mix default and legacy metrics to catch font-dependent line-height drift.
  let options = if calc.rem(i, 2) == 0 { (:) } else { (top-edge: "baseline") }
  options += edges.named()
  if icon-kind == "fontawesome" {
    import "@preview/fontawesome:0.6.2": fa-icon
    fa-icon(("envelope", "globe", "id-badge", "linkedin", "phone", "location-dot").at(calc.rem(i, 6)), solid: true, ..options)
  } else {
    text(..options)[•]
  }
}
#let contacts = range(count).map(i => (
  icon: if icon-kind != "false" { [#box(width: 0pt, height: 0pt)[#metadata(i)<icon-start>]#contact-icon(i)] },
  text: [#box(width: 0pt, height: 0pt)[#metadata(i)<contact-start>]#contact-text(i)#box(width: 0pt, height: 0pt)[#metadata(i)<contact-end>]],
  link: "https://candidate.invalid/" + str(i),
))
#let render = if sys.inputs.at("kind", default: "letter") == "statement" { statement } else { coverletter }
#show: render.with(
  profile: (
    name: [#box(width: 0pt, height: 0pt)[#metadata(none)<name-start>]Dr. Nova Placeholder#box(width: 0pt, height: 0pt)[#metadata(none)<name-end>]],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: contacts,
  ),
  preset: sys.inputs.at("preset", default: "default"),
  layout: (
    contact-layout: mode,
    header-style: if mode == "centered" { "centered" } else { "split" },
    header-height: minimum,
  ),
)
#metadata(none)<body-start>
Body begins here.
#context {
  // An unbroken token must occupy multiple lines, not paint outside its box.
  for icon in (none, [•]) {
    let contact = (icon: icon, text: "abcdefghij" * 12)
    let wrapped = measure(block(width: 40mm, letter-contact-display((contact,), resolve-letter-config())))
    assert(wrapped.height > 3 * 8.8pt, message: "long contact does not wrap")
  }
  let start = query(<contact-start>).map(it => it.location().position())
  let end = query(<contact-end>).map(it => it.location().position())
  let body = query(<body-start>).first().location().position()
  let name = query(<name-start>).first().location().position()
  if count > 0 and ("stacked", "rail").contains(mode) and end.last().y - start.first().y > minimum {
    assert(name.y <= start.first().y + 18pt, message: "tall header pushes the name down")
  }
  let icons = query(<icon-start>).map(it => it.location().position())
  // Compare actual glyph centers with the first text line, not baselines:
  // different icon shapes/fonts need different baselines to look aligned.
  let label-top = measure(text(8.8pt, top-edge: "cap-height", bottom-edge: "baseline")[M]).height
  let label-bottom = measure(text(8.8pt, top-edge: "baseline", bottom-edge: "descender")[M]).height
  for (i, (icon, contact)) in icons.zip(start).enumerate() {
    let ink-top = measure(text(7.6pt, contact-icon(i, top-edge: "bounds", bottom-edge: "baseline"))).height
    let ink-bottom = measure(text(7.6pt, contact-icon(i, top-edge: "baseline", bottom-edge: "bounds"))).height
    let icon-center = icon.y + (ink-bottom - ink-top) / 2
    let line-center = contact.y + (label-bottom - label-top) / 2
    assert(calc.abs(icon-center - line-center) < 0.01pt, message: "icon is not centered on the first contact line")
  }
  if mode == "centered" {
    let name-end = query(<name-end>).first().location().position()
    assert(calc.abs((name.x + name-end.x) / 2 - page.width / 2) < 0.01pt, message: "name is not centered")
  }
  assert.eq(start.len(), count)
  assert.eq(end.len(), count)
  assert.eq(body.page, 1)
  assert(body.y >= 2cm + minimum)
  for i in range(count) {
    assert.eq(start.at(i).page, 1)
    assert.eq(end.at(i).page, 1)
    assert(start.at(i).y >= 2cm - 0.01pt)
    assert(end.at(i).y + 8pt < body.y)
    assert(start.at(i).x >= 2.2cm - 0.01pt)
    assert(end.at(i).x <= page.width - 2.2cm + 0.01pt)
    if i > 0 {
      let previous = start.at(i - 1)
      let current = start.at(i)
      assert(
        current.y >= previous.y + 8pt or (
          calc.abs(current.y - previous.y) < 0.01pt and current.x > previous.x
        ),
        message: "contact items overlap",
      )
    }
  }
}
