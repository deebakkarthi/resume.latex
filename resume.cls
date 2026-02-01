\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClass[12pt]{article}

\RequirePackage[
  letterpaper,
  margin = 0.5in
]{geometry}
\setlength{\parindent}{0pt}

\RequirePackage[USenglish]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{titling}
\RequirePackage[oldstyle,proportional]{ETbb}
\RequirePackage{fontawesome5}
\RequirePackage[bookmarks, colorlinks]{hyperref}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{xifthen}
\RequirePackage{pgfkeys}

\hypersetup{%
  urlcolor=uvaOrange,
  pdfauthor={Deebakkarthi Chinnasame Rani},
  pdftitle={Deebakkarthi Chinnasame Rani: R\'{e}sum\'{e}},
  pdfproducer={}
}

\titleformat{\section}
{\Large\mdseries\scshape}{}{0em}{}

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
    \footnotesize
    \faPhone* \href{tel:\@phone}{\@phone}\quad
    \faEnvelope \space \href{mailto:\@email}{\@email}\quad
    \faGlobe \space \href{https://\@website}{\@website}\quad
    \faLinkedin \space
    \href{https://linkedin.com/in/\@linkedin/}{\@linkedin}\quad
    \faGithub \space \href{https://github.com/\@github}{\@github}\quad
  \end{center}

}

\pgfkeys{
  /educationEntry/.is family, /educationEntry,
  ins/.estore in = \educationEntryInstitution,
  start/.estore in = \educationEntryStart,
  end/.estore in = \educationEntryEnd,
  notComplete/.estore in = \educationEntryNotComplete,
  degree/.estore in = \educationEntryDegree,
  location/.estore in = \educationEntryLocation,
  gpa/.estore in = \educationEntryGPA
}

\newcommand\educationEntry[2][]{
  \pgfkeys{/educationEntry, #1}%
  \begin{minipage}[t]{0.20\textwidth}
    \hfill
    {
      \small
      \raggedright
      \educationEntryStart - \educationEntryEnd
      \par
      \ifnum\pdfstrcmp{\educationEntryNotComplete}{true}=0%
      \raggedleft
      (Expected)
      \par
      \fi
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.75\textwidth}
    {
      \large
      \textsc{\educationEntryInstitution}
    }
    \hfill
    {
      \small
      \educationEntryLocation
    }
    \newline
    {
      \small
      \textsc{\educationEntryDegree}
    }
    \newline
    {
      \small
      GPA: \educationEntryGPA
    }

    \ifthenelse{\isempty{#2}}{
    }{%
      {\footnotesize
        \emph{#2}
      }%
    }
  \end{minipage}
  \vspace{0.25cm}
}

\pgfkeys{
  /experienceEntry/.is family, /experienceEntry,
  workplace/.estore in = \experienceEntryWorkplace,
  start/.estore in = \experienceEntryStart,
  end/.estore in = \experienceEntryEnd,
  position/.estore in = \experienceEntryPosition,
  location/.estore in = \experienceEntryLocation,
}

\newcommand\experienceEntry[2][]{
  \pgfkeys{/experienceEntry, #1}%
  \begin{minipage}[t]{0.20\textwidth}
    \hfill
    {
      \small
      \experienceEntryStart - \experienceEntryEnd
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.75\textwidth}
    {
      \large
      \textsc{\experienceEntryWorkplace}
    }
    \hfill
    {
      \small
      \experienceEntryLocation
    }
    \newline
    {
      \small
      \textsc{\experienceEntryPosition}
    }
    #2
  \end{minipage}
  \vspace{0.25cm}
}
