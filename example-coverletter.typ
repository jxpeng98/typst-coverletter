#import "@preview/fontawesome:0.6.0": *
#import "modernpro-coverletter.typ": *

#show: coverletter.with(
  font-type: "PT Serif",
  name: [Example EE],
  address: [UK],
  salutation: [Best regards,],
  supplements: ([Enclosure: Resume], [Portfolio: example.com]),
  contacts: (
    (text: [#fa-icon("location-dot") UK]),
    (text: [#fa-icon("mobile") 123-456-789], link: "tel:123-456-789"),
    (text: [#fa-icon("link") example.com], link: "https://www.example.com"),
    (text: [#fa-icon("github") github], link: "https://github.com/"),
    (text: [#fa-icon("envelope") example\@example.com], link: "mailto:example@example.com"),
  ),
  recipient: (
    start-title: [Dear Committee Members,],
    cl-title: [Job Application for Hiring Manager],
    date: [],
    department: [Department of Example],
    institution: [University of Example],
    address: [London, UK],
    postcode: [W1 S2],
  ),
  // Customisation options (uncomment to use)
  // primary-colour: rgb("#000000"),
  // headings-colour: rgb("#2b2b2b"),
  // name-size: 20pt,
  // body-size: 11pt,
  // closing-spacing: 1em,
  // signature-spacing: 0.5em,  // increase to 2em+ for printed version
  // supplement-spacing: 1em,
)

#set par(justify: true, first-line-indent: 2em)
#set text(weight: "regular", size: 12pt)

#lorem(400)
