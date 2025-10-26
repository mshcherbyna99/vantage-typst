#import "vantage-typst.typ": render

#let configuration = yaml("/configuration.yaml")

#render(
    name: configuration.name,
    position: configuration.position,
    photo: configuration.photo,
    location: configuration.location,
    myContacts: configuration.contacts,
    summary: configuration.summary,
    education: configuration.education,
    work_experience: configuration.work_experience,
    certifications: configuration.certifications,
    skills: configuration.skills,
)
