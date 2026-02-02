\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClass[10pt]{article}

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
\RequirePackage{enumitem}
\RequirePackage{pifont}

\hypersetup{%
  urlcolor=uvaOrange,
  pdfauthor={Deebakkarthi Chinnasame Rani},
  pdftitle={Deebakkarthi Chinnasame Rani: R\'{e}sum\'{e}},
  pdfproducer={}
}

\newlist{mylist}{itemize}{1}
\setlist[mylist, 1]{
  label=\ding{101},
  topsep=1pt,
  align=left,
  leftmargin = *,
}

\newlist{projectLinks}{itemize*}{1}
\setlist[projectLinks, 1]{
  label=,
  afterlabel=,
  itemjoin={{\quad \ding{120}\quad }},
}

\titleformat{\section}
{ \Large\mdseries\scshape}{}{0em}{}
\titlespacing{\section}{0pt}{0.25\baselineskip}{0pt}

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
  \begin{minipage}[t]{0.08\textwidth}
    {
      \small
      \raggedright
      \educationEntryStart\ -
      \newline
      \educationEntryEnd \hfill
      \ifnum\pdfstrcmp{\educationEntryNotComplete}{true}=0%
      \newline
      (Expected)
      \fi
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.89\textwidth}
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
  \par
  \vspace{10pt}
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
  \begin{minipage}[t]{0.08\textwidth}
    {
      \small
      \raggedright
      \experienceEntryStart\ -
      \newline
      \experienceEntryEnd
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.89\textwidth}
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
    {
      \small
      #2
    }
  \end{minipage}
  \vspace{10pt}
}

\pgfkeys{
  /projectEntry/.is family, /projectEntry,
  name/.estore in = \projectEntryName,
  start/.estore in = \projectEntryStart,
  end/.estore in = \projectEntryEnd,
}

\newcommand\projectEntry[3][]{
  \pgfkeys{/projectEntry, #1}%
  \begin{minipage}[t]{0.08\textwidth}
    {
      \small
      \raggedright
      \projectEntryStart\ -
      \newline
      \projectEntryEnd
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.89\textwidth}
    {
      \large
      \textsc{
        \projectEntryName
      }
    }
    {
      \hfill
      \small
      \texttt{
        #2
      }
    }
    \par
    {
      #3
    }
  \end{minipage}
  \vspace{10pt}
}

\pgfkeys{%
  /publicationEntry/.is family, /publicationEntry,
  default/.style = {
    title={},
    venue={},
    date={},
    doi={},
  },
  title/.estore in = \publicationEntryTitle,
  venue/.estore in = \publicationEntryVenue,
  date/.estore in = \publicationEntryDate,
  doi/.estore in = \publicationEntryDOI,
}%

\newcommand\publicationEntry[1][]{
  \pgfkeys{/publicationEntry, default, #1}%
  \begin{minipage}[t]{0.08\textwidth}
    {
      \ifthenelse{\equal{\publicationEntryDate}{Forthcoming}}{
        \footnotesize
        \raggedright
        \publicationEntryDate
        \hfill
        \par
      }{
        \small
        \raggedright
        \publicationEntryDate
      }
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.89\textwidth}
    \publicationEntryTitle
    \ifthenelse{\equal{\publicationEntryVenue}{}}{}{
      \ in \textit{\publicationEntryVenue}
    }.
    \ifthenelse{\equal{\publicationEntryDOI}{}}{}{
      \href{https://doi.org/\publicationEntryDOI}{doi: \publicationEntryDOI}
    }
    \par
  \end{minipage}
  \par
  \vspace{10pt}
}

\newcommand\skillsEntry[2]{
  \begin{minipage}[t]{0.08\textwidth}
    {
      \small
      \begin{flushleft}
        #1
      \end{flushleft}
    }
  \end{minipage}
  \hfill
  \vline
  \hfill
  \begin{minipage}[t]{0.89\textwidth}
    #2
  \end{minipage}
  \par
}
