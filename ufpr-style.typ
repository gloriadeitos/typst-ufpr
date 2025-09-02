#let template(
  title: "Título",
  city: "Curitiba",
  year: 2025,
  authors: ("Nome do Autor",),
  description: "Descrição",
  advisors: ("Prof. Dr.",),
  doc
) = [
  #set page(
    margin: (
      top: 3cm,
      bottom: 2cm,
      inside: 3cm,
      outside: 2cm
    ),
    paper: "a4"
  )
  #set par(
    justify: true,
    first-line-indent: (amount: 1cm, all: true),
    spacing: 1em,
    leading: 1em
  )
  // Global font
  #show text: it => {
    text(
      it,
      font: "Arial",
      size: 12pt,
      spacing: 1.5mm
    )
  }
  // Headings
  // - Numbered
  #set heading(
    numbering: "1."
  )
  #show heading: it => {
    upper(it)
  }
  // - Centered
  #show strong: it => {
    align(center,upper(it))
  }

  // Cover page
  #page(
    align(center)[
      UNIVERSIDADE FEDERAL DO PARANÁ
      \ \
      #for author in authors {
        upper(author)
        linebreak()
      }
      #align(bottom, [
        #upper(city)
        #linebreak()
        #year
      ])
    ],
    background: image("ufpr_cover.png"),
    foreground: block(upper(title), inset: 3cm),
    margin: 2cm
  )
  // Description page
  // TODO
  #doc
]
