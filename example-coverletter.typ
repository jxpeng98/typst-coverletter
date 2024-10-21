#import "@preview/fontawesome:0.5.0": *
#import "modernpro-coverletter.typ": *

#show: coverletter.with(
  font-type: "PT Serif",
  name: [Example EE],
  address: [UK],
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
)

#set par(justify: true, first-line-indent: 2em)
#set text(weight: "regular", size: 12pt)

#lorem(400)
