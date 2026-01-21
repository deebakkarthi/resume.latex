\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClass{article}
\RequirePackage[letterpaper, margin=1in]{geometry}
\usepackage[USenglish]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{titling}
\RequirePackage[oldstyle,proportional]{ETbb}
\RequirePackage{fontawesome5}
\RequirePackage[bookmarks, colorlinks]{hyperref}
\RequirePackage[usenames,dvipsnames]{color}
\hypersetup{%
  urlcolor=uvaOrange,
  pdfauthor={Deebakkarthi Chinnasame Rani},
  pdftitle={Deebakkarthi Chinnasame Rani: R\'{e}sum\'{e}},
  pdfproducer={}
}

\definecolor{uvaOrange}{RGB}{229, 114, 0}

\newcommand*{\phone}[1]{\gdef\@phone{#1}}
\newcommand*{\@phone}{}%

\newcommand*{\email}[1]{\gdef\@email{#1}}
\newcommand*{\@email}{}%

\newcommand*{\website}[1]{\gdef\@website{#1}}
\newcommand*{\@website}{}%

\newcommand*{\linkedin}[1]{\gdef\@linkedin{#1}}
\newcommand*{\@linkedin}{}%

\newcommand*{\github}[1]{\gdef\@github{#1}}
\newcommand*{\@github}{}%

\renewcommand{\maketitle}{
  \begin{center}
    {
      \Huge
      \textsc{
        \@author
      }
    }
    \\
    {
      \normalsize
      \emph{ R\'{e}sum\'{e}}
    }
  \end{center}

  \begin{center}
    \normalsize
    \faPhone* \href{tel:\@phone}{\@phone}\quad
    \faEnvelope \space \href{mailto:\@email}{\@email}\quad
    \faGlobe \space \href{https://\@website}{\@website}\quad
    \faLinkedin \space
    \href{https://linkedin.com/in/\@linkedin/}{\@linkedin}\quad
    \faGithub \space \href{https://github.com/\@github}{\@github}\quad
  \end{center}

}
