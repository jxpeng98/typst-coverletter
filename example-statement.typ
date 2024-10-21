#import "@preview/fontawesome:0.5.0": *
#import "modernpro-coverletter.typ": *

#show: statement.with(
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
)

#align(center, text(13pt, weight: "semibold")[#underline([Statement])])
#set par(first-line-indent: 2em, justify: true)
#set text(11pt, weight: "regular")

#lorem(300)
