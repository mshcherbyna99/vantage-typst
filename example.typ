#import "vantage-typst.typ": vantage, term, skill, styled-link
#let configuration = yaml("configuration.yaml")

#vantage(
    name: configuration.name,
    position: configuration.position,
    photo: configuration.photo,
    contacts: [
        #for contact in configuration.contacts [
            (name: contact.name, link: contact.link, display: contact.title)
        ]
    ],
    tagline: (configuration.tagline),
    [
        == Education
        #for edu in configuration.education [
            === #edu.degree\
            at === #edu.institution\
            #term[from #edu.start_date to #edu.end_date][#edu.location]
            ==== #edu.field_of_study\
            \
        ]\
        == Skills
        #for skill in configuration.skills [
            #skill\;
        ]\

        == Certifications
        #for certification in configuration.certifications [
            === #certification.name\
            #certification.description
        ]\
    ],
    [
        == Experience
        #for work_experience in configuration.work_experiences [
          === #work_experience.position
          at
          === #work_experience.company.name\
          #term[from #work_experience.from to #work_experience.to][#work_experience.location]
            #if work_experience.description != "" [
                #for point in work_experience.description [
                    - #point
                ]
            ]
        ]
    ]
)
