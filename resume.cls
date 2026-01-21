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
\RequirePackage{namedef}

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

% Institution
% Start Month and Year: Year or Date, Year. WYSIYG
% End Month and Year: Year or Date, Year. WYSIYG
% notComplete: "true" or "false". Adds an "Expected" string under the end year
% degree: name of the degree
% GPA: pass in as gpa/max_gpa so that max_gpa != 4 can be displayed
% Extras:  Accomplishments such as honors
% Location
\named\def\educationEntry#[ins]#[start]#[end]#[notComplete]#[degree]#[gpa]#[extra]#[location]{
  \begin{minipage}[t]{0.20\textwidth}
    \hfill
    {
      \small
      #[start] - #[end]
      \ifnum\pdfstrcmp{#[notComplete]}{true}=0 %
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
      \textsc{#[ins]}
    }
    \hfill
    {
      \small
      #[location]
    }
    \newline
    {
      \small
      \textsc{ #[degree]}
    }
    \newline
    {
      \small
      GPA: #[gpa]
    }

    \ifthenelse{\isempty{#[extra]}}{
    }{%
      {\footnotesize
        \emph{#[extra]}
      }%
    }
  \end{minipage}
  \vspace{0.25cm}
}
