#let font_name = "Aptos"
#let font_title_size = 24pt
#let font_subtitle_size = 15pt
#let font_subtitle_color = rgb("#12348e")
#let font_link_color = rgb("#3730a3")
#let font_body_size = 10.5pt
#let font_body_color = rgb("#1e1e1e")

#let icon(filename) = {
    box(
        height: 12pt,
        baseline: 1.5pt,
        image("resources/icons/" + filename + ".svg")
    )
}

#let duration(terms: ()) = {
    let from_date = terms.at(0).from
    let to_date = if terms.at(1).to != none { terms.at(1).to } else { "Present" }
    let textTerms = "from " + from_date + " to " + to_date

    text(font_body_size)[#icon("duration") #textTerms]
}

#let location(location) = {
    text(font_body_size)[#icon("location") #location]
}

#let styledLink(url, title) = {
    let styledLink = link(url, title);
    
    box(inset: (right: 4pt))[#styledLink]
}

#let renderContacts(contacts: ()) = {
    for contact in contacts {
        styledLink(contact.link, [#icon(contact.name) #contact.title])
    }
}

#let renderHeader(name, position, photo, location, myContacts) = {
    let photoBox = if photo != "" {
        box(
            height: auto,
            width: 72pt,
            image(photo, fit: "cover")
        )
    } else {
        empty()
    }

    let titleBox = {
        heading(level: 1)[#name]
        v(-18pt)

        text(font_subtitle_size, weight: "medium")[#position]
        v(-12pt)

        link(location.link)[#icon("location") #location.name]
        v(-8pt)

        renderContacts(contacts: myContacts)
    }

    grid(
        columns: (1fr, auto),
        [#titleBox],
        [#photoBox]
    )

    v(-10pt)
}

#let renderSummary(summaryText) = {
    heading(level: 2)[#icon("professional-summary") About Me]

    text(font_body_size)[#summaryText]

    v(0pt)
}

#let renderJobExperience(experiences) = {
    heading(level: 2)[#icon("job-experience") Job Experience]

    for (index, experience) in experiences.enumerate() {
        heading(level: 3)[#experience.position #h(1fr)]
        duration(terms: experience.terms)
        v(-10pt)

        text(size: font_body_size, weight: "medium", fill: rgb(115, 115, 115))[#experience.company_name #h(1fr)]
        location([#experience.company_location])
        v(-5pt)

        for point in experience.description {
            text(font_body_size)[- #point]
        }
        v(-4pt)

        if index < experiences.len() - 1 {
            line(length: 100%, stroke: (thickness: 0.5pt, dash: "dashed", paint: rgb(115,115,115)))
        }

        v(-4pt)
    }
}

#let renderEducation(educations) = {
    heading(level: 2)[#icon("education") Education]
    v(1pt)

    for (index, education) in educations.enumerate() {
        heading(level: 3)[#education.degree, #education.field_of_study #h(1fr)]
        duration(terms: education.terms)
        v(-10pt)

        text(size: font_body_size, weight: "medium", fill: rgb(115, 115, 115))[#education.facility_name #h(1fr)]
        location([#education.facility_location])
        v(-5pt)

        if index < educations.len() - 1 {
            line(length: 100%, stroke: (thickness: 0.5pt, dash: "dashed", paint: rgb(115,115,115)))
        }

        v(-4pt)
    }
}

#let renderCertifications(certifications) = {
    heading(level: 2)[#icon("certifications") Certifications]
    v(1pt)

    for certification in certifications {
        heading(level: 3)[#certification.name #h(1fr)]
        v(-5pt)

        text(size: font_body_size, weight: "medium", fill: rgb(115, 115, 115))[#certification.issuer_name #h(1fr)]
        v(-5pt)

        text(font_body_size)[#certification.description]
        v(-5pt)
    }

    v(-5pt)
}

#let renderSkills(skills) = {
    heading(level: 2)[#icon("skills") Skills]

    let chips = []

    let chips = skills.map(skill =>
        rect(radius: 4pt, fill: rgb(230, 230, 230), inset: (x: 5pt, y: 5pt))[#text(size: font_body_size, fill: font_body_color)[#skill]]
    )

    let chipsBox = chips.map(chip => box(inset: (x: 1pt, y: -2pt))[#chip])

    chipsBox.join()

    v(-10pt)
}

#let render(
    name: "",
    position: "",
    photo: "",
    location: "",
    myContacts: (),
    summary: "",
    work_experience: (),
    education: (),
    certifications: (),
    skills: ()
) = {
    set document(
        title: name + "'s CV",
        author: name
    )
    set text(font_body_size, font: font_name)
    set page(margin: (x: 1cm, y: 1cm))

    show heading.where(level: 1): it => text(font: font_name, size: font_title_size, [#{ it.body }])
    show heading.where(level: 2): it => text(font: font_name, size: font_subtitle_size, fill: font_subtitle_color, [#{ it.body } #v(-12pt) #line(length: 100%, stroke: 0.5pt + font_subtitle_color)])
    show heading.where(level: 3): it => text(font: font_name, size: font_body_size, [#v(-5pt) #it.body])
    show heading.where(level: 4): it => text(font: font_name, size: font_body_size, fill: font_body_color, it.body)

    renderHeader(name, position, photo, location, myContacts)

    renderSummary(summary)

    grid(
        columns: (33%, 1fr),
        gutter: 8pt,
        [
            #renderSkills(skills)
            #renderCertifications(certifications)
        ],
        [
            #renderJobExperience(work_experience)
            #renderEducation(education)
        ]
    )
}
