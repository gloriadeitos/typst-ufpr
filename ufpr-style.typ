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
  #set text(
    font: "Arial",
    size: 12pt,
    spacing: 1.5mm
  )
  // Headings
  // - Numbered
  #set heading(
    numbering: "1."
  )
  #show heading: it => {
    if it.level == 1 {text(upper(it), size: 12pt)}
    else {text(upper(it), size: 12pt, weight: 0)}
    linebreak()
  }
  // - Centered
  #show strong: it => {
    align(center,upper(it))
  }

  // Figures
  #show figure.where(kind: image): set figure(supplement: "FIGURA")
  #show figure.where(kind: table): set figure(supplement: "TABELA")
  #set figure.caption(separator: [ --- ])
  #show figure: it => block[
    #v(1em)
    #let (desc, source) = it.caption.body.text.split("@")
    #set text(size: 10pt)
    #it.supplement #counter(figure.where(kind: it.kind)).display()#it.caption.separator#upper(desc.trim())
    #it.body
    Fonte: #source.trim().
    #v(1em)
  ]

  // Cover page
  #page(
    align(center)[
      UNIVERSIDADE FEDERAL DO PARANÁ
      \ \
      #for author in authors {
        upper(author)
        linebreak()
      }
      #align(horizon, upper(title))
      #align(bottom, [
        #upper(city)
        #linebreak()
        #year
      ])
    ],
    background: image("ufpr_cover.png"),
    margin: 2cm
  )
  // Description page
  #page(
    [
      #place(
        top + left,
        dy: 50% + 2cm, dx: 50%,
        clearance: 0pt,
        float: true,
        block(width: 50%, height: 0pt)[
          #set text(size: 10pt)
          #set par(leading: 0.5em)
          #description
          \ \
          #if advisors.len() == 1 [
            Orientador: #advisors.first()
          ] else [
            Orientadores: // TODO
          ]
        ]
      )
      #align(center)[
        UNIVERSIDADE FEDERAL DO PARANÁ
        \ \
        #for author in authors {
          upper(author)
          linebreak()
        }
        #align(horizon, upper(title))
        #align(bottom, [
          #upper(city)
          #linebreak()
          #year
        ])
      ]
    ],
    margin: 2cm,
  )
  #doc
]
