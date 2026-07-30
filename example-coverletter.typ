#import "modernpro-coverletter.typ": *

// All people, institutions, roles, and claims in this example are fictional.
#show: coverletter.with(
  profile: (
    name: [Dr. Maya Chen],
    role: [Lecturer in Computational Social Science],
    address: [Edinburgh, United Kingdom],
    contacts: (
      (text: [maya\@northbridge.example], link: "mailto:maya@northbridge.example"),
      (text: [maya.example.org], link: "https://maya.example.org"),
      (text: [ORCID~0000-0000-0000-0000], link: "https://orcid.org/0000-0000-0000-0000"),
    ),
  ),
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
  closing: (
    supplements: ([Enclosure: Curriculum vitae],),
  ),
)

I am applying for the Lecturer in Digital Governance position at Eastborough
University. I am currently a Lecturer in Computational Social Science at
Northbridge University, where I lead the Civic AI Lab. My research and teaching
examine how public institutions evaluate, explain, and govern data-intensive
systems, a focus that closely matches the School's work on accountable public
innovation.

My research combines audit studies, causal inference, and participatory design.
In a recent project, I worked with local-service teams to test how different
forms of model documentation changed review decisions. That work developed into
a broader programme on public audit, supported by a fictional New Investigator
Award. At Eastborough, I would extend this programme by studying when oversight
tools change institutional practice rather than simply improve disclosure.

I teach computational research methods at undergraduate and postgraduate
levels, supervise MSc dissertations, and design assignments around transparent
and reproducible analysis. My teaching begins with substantive public-policy
questions and introduces technical methods only when they help students answer
those questions responsibly. I would be pleased to contribute to research
methods, digital government, and the School's project-based teaching.

Eastborough's combination of public-policy scholarship, applied methods, and
partnerships with civic organisations would provide an excellent setting for
this work. Thank you for considering my application. I would welcome the
opportunity to discuss how my research, teaching, and service could contribute
to the School.
