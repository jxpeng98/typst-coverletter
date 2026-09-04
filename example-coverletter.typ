#import "modernpro-coverletter.typ": *

#assert.eq(_first-filled(("candidate",), default: "fallback"), "candidate")

// Every person, place, institution, role, identifier, and claim below is an
// explicit placeholder from the invented setting of Exampleland.
#show: coverletter.with(
  profile: (
    name: [Dr. Nova Placeholder],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: (
      (text: [nova\@candidate.invalid], link: "mailto:nova@candidate.invalid"),
      (text: [nova.candidate.invalid], link: "https://nova.candidate.invalid"),
      (text: [Fictional ID~0000-0000], link: "https://registry.example.invalid/0000-0000"),
    ),
  ),
  recipient: (
    name: [Professor Taylor Demo],
    role: [Chair, Fictional Search Committee],
    department: [School of Speculative Policy],
    organization: [Placeholder Institute],
    address: [Demo Harbour, Exampleland],
    date: [1 Imaginarymonth 20ZZ],
    subject: [Application for Lecturer in Speculative Governance],
    greeting: [Dear Professor Demo and Members of the Fictional Committee,],
  ),
  closing: (
    supplements: ([Enclosure: Curriculum vitae],),
  ),
)

I am applying for the entirely fictional Lecturer in Speculative Governance
position at Placeholder Institute. I am currently a Lecturer in Speculative
Systems at Exampleland University, where I lead the Placeholder Systems Lab. My
research and teaching concern imaginary institutions and simulated decision
engines in the invented setting of Exampleland.

My fictional research combines synthetic audits, counterfactual trials, and
staged workshops. In one invented project, sample-service teams tested how
placeholder documentation changed generated review decisions. At Placeholder
Institute, I would extend this simulated programme by studying how hypothetical
oversight tools affect imaginary organisational practice.

I teach Speculative Research Methods, supervise sample projects, and design
assignments around fictional evidence. My teaching begins with invented policy
questions and introduces imaginary tools only when they help placeholder
students answer those questions. I would be pleased to contribute to simulated
research methods and the School's hypothetical project-based teaching.

Placeholder Institute's combination of speculative scholarship, sample methods,
and fictional partnerships would provide an ideal imaginary setting for this
work. Thank you for considering this example application. I would welcome a
hypothetical discussion of how these invented activities could contribute to
the fictional School.
