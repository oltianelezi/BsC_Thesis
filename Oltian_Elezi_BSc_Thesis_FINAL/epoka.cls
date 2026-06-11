% EPOKA University Thesis LaTeX Class (CEN BA and MSc)
% Prepared by: Dr. Florenc Skuka
% Department of Computer Engineering, EPOKA University
% Based on the official EPOKA University Thesis Writing Guidelines

% This class provides a structured LaTeX template for preparing
% Bachelor (BA) and Master of Science (MSc) theses in the field of
% Computer Engineering Department.

% ------------------------------------------------------------------
% Version History
% ------------------------------------------------------------------
% v1.0 (2025/12)
% - Initial draft of the thesis template
% - Basic structure implemented (title page, chapters, TOC)
% - Preliminary formatting (spacing, margins, headings)
% - Known issues: inconsistencies in TOC formatting, appendix handling,
%   and heading styles

% v1.1 (2026/03)
% - Revised to align with official thesis writing guidelines
% - Corrected formatting inconsistencies (spacing, headings, numbering)
% - Improved structure of front matter (abstract, acknowledgments, lists)
% - Added support for Bachelor (BA – CEN) thesis format
% - General cleanup and stabilization of the template

% v1.2 (2026/04)
% - Fixed Table of Contents (TOC) formatting:
%     * Removed bold styling from TOC entries
%     * Ensured consistency with thesis formatting guidelines
% - Corrected Appendix representation:
%     * Replaced incorrect "Chapter A" with "Appendix A"
%     * Introduced "APPENDICES" section in TOC
% - Ensured References section is properly included in TOC
% - Minor refinements for consistency across sectionsarch 2026
% Updating ToC


\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{epoka}[2026/04/01 v1.2 Epoka University Thesis Class]

% Base class
\LoadClass[a4paper,oneside,onecolumn,12pt]{report}[1996/10/31]

% Required packages
\RequirePackage{ifthen}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage[hang,labelsep=period]{caption}
\RequirePackage{calc}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{tocloft}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage[nottoc,notlof,notlot]{tocbibind}
\RequirePackage{mathptmx}  % Times New Roman font

% Caption setup for tables and figures
\captionsetup[table]{position=top, aboveskip=24pt, belowskip=6pt}
\captionsetup[figure]{position=bottom, aboveskip=6pt, belowskip=18pt}

% Equation spacing
\AtBeginDocument{%
  \setlength{\abovedisplayskip}{24pt}%
  \setlength{\belowdisplayskip}{24pt}%
  \setlength{\abovedisplayshortskip}{24pt}%
  \setlength{\belowdisplayshortskip}{24pt}%
}

% Page geometry - Epoka University requirements
% Margins: Left 4cm, Right 2.5cm, Top 2.5cm, Bottom 2.5cm
\geometry{
    a4paper,
    left=4cm,
    right=2.5cm,
    top=2.5cm,
    bottom=2.5cm,
    headheight=15pt,
    headsep=10pt,
    footskip=0.5cm % Modified to move footer 2-3 lines UP and closer to text
}

% Header and footer setup - page numbers bottom centered
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}  % Page number at bottom center
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Line spacing
\onehalfspacing

% Paragraph formatting
\setlength{\parindent}{12mm}
\setlength{\parskip}{6pt}     % Default to 6pt (Abstract, Refs, Body) per PDF instructions

% Make figure and table captions bold and italic
\captionsetup{labelfont={bf,it}}

% Hyphenation penalties
\hyphenpenalty=5000
\exhyphenpenalty=5000

% Boolean flags
\newif\if@itsaMSc
\@itsaMSctrue  % Default is MSc

\newif\if@itsaBSc
\@itsaBScfalse

\newif\if@TabloListesiVar
\@TabloListesiVartrue

\newif\if@SekilListesiVar
\@SekilListesiVartrue

\newif\if@AbbreviationVar
\@AbbreviationVarfalse

\newif\if@DedicationVar
\@DedicationVarfalse

% Commands for thesis type
\newcommand*{\MSc}{\@itsaMSctrue \@itsaBScfalse}
\newcommand*{\PhD}{\@itsaMScfalse \@itsaBScfalse}
\newcommand*{\BSc}{\@itsaMScfalse \@itsaBSctrue}

% Storage commands
\newcommand{\th@StoreIn}[2]{\gdef#1{#2}}

% Author information
\renewcommand*{\author}[2]{%
    \th@StoreIn{\th@firstname}{#1}%
    \th@StoreIn{\th@lastname}{#2}%
    \th@StoreIn{\th@fullname}{#1 #2}%
}

% Thesis information
\renewcommand{\title}[1]{\th@StoreIn{\th@title}{#1}}
\newcommand{\titleenglish}[1]{\th@StoreIn{\th@titleenglish}{#1}}
\newcommand{\titlealbanian}[1]{\th@StoreIn{\th@titlealbanian}{#1}}
\renewcommand{\date}[1]{\th@StoreIn{\th@date}{#1}}
\newcommand{\dateenglish}[1]{\th@StoreIn{\th@dateenglish}{#1}}

% Supervisor information
\newcommand{\supervisor}[1]{\th@StoreIn{\th@supervisor}{#1}}
\newcommand{\supervisorenglish}[1]{\th@StoreIn{\th@supervisorenglish}{#1}}

% Department information
\newcommand{\department}[1]{\th@StoreIn{\th@department}{#1}}
\newcommand{\departmentenglish}[1]{\th@StoreIn{\th@departmentenglish}{#1}}
\newcommand{\headofdepartment}[1]{\th@StoreIn{\th@headofdepartment}{#1}}

% Faculty information
\newcommand{\faculty}[1]{\th@StoreIn{\th@faculty}{#1}}
\newcommand{\facultyenglish}[1]{\th@StoreIn{\th@facultyenglish}{#1}}


% Committee members
\newcommand{\committee}[5]{%
    \th@StoreIn{\th@committeeone}{#1}%
    \th@StoreIn{\th@committeetwo}{#2}%
    \th@StoreIn{\th@committeethree}{#3}%
    \th@StoreIn{\th@committeefour}{#4}%
    \th@StoreIn{\th@committeefive}{#5}%
}

% Front matter content
\renewcommand{\abstract}[1]{\th@StoreIn{\th@abstractcontent}{#1}}
\newcommand{\abstrakt}[1]{\th@StoreIn{\th@abstraktcontent}{#1}}
\newcommand{\acknowledgments}[1]{\th@StoreIn{\th@acknowledgments}{#1}}
\newcommand{\dedication}[1]{\@DedicationVartrue\th@StoreIn{\th@dedication}{#1}}
\newcommand{\abbreviations}[1]{\@AbbreviationVartrue\th@StoreIn{\th@abbreviations}{#1}}

% Keywords
\newcommand{\keywords}[1]{\th@StoreIn{\th@keywords}{#1}}
\newcommand{\keywordsenglish}[1]{\th@StoreIn{\th@keywordsenglish}{#1}}

% List control
\newcommand*{\NoTableList}{\@TabloListesiVarfalse}
\newcommand*{\NoFigureList}{\@SekilListesiVarfalse}

% Chapter formatting - 16pt font size
\titleformat{\chapter}[display]
    {\normalfont\bfseries\centering\fontsize{16}{19.2}\selectfont}
    {\MakeUppercase{\chaptertitlename}\ \thechapter}
    {20pt}
    {\bfseries\fontsize{16}{19.2}\selectfont\MakeUppercase}

\titlespacing*{\chapter}{0pt}{-24pt}{42pt} % -24pt before to ensure it starts high on the page, 42pt after (including 1.5 empty line + 6+6pt)

% Section formatting - with indentation
\titleformat{\section}
    {\normalfont\fontsize{14}{16.8}\selectfont\bfseries}
    {\thesection}
    {1em}
    {}
[\vspace{-0.5em}]  % Reduce space after section title

\titlespacing*{\section}{0.7cm}{48pt}{12pt}  % Left indent 7mm, 48pt before (incl 2 empty lines), 12pt after

% Subsection formatting - with indentation
\titleformat{\subsection}
    {\normalfont\fontsize{13}{15.6}\selectfont\bfseries}
    {\thesubsection}
    {1em}
    {}

\titlespacing*{\subsection}{0pt}{30pt}{6pt}  % Left indent 0, 30pt before (incl 1 empty line), 6pt after

% Subsubsection formatting - with indentation
\titleformat{\subsubsection}
    {\normalfont\bfseries}
    {\thesubsubsection}
    {1em}
    {}

\titlespacing*{\subsubsection}{0pt}{30pt}{6pt}  % Left indent 0, 30pt before, 6pt after

% Table of Contents formatting - 16pt centered
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\bibname}{REFERENCES}

% TOC depth
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

% Standard TOC Entry formatting for chapters
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftdot}{.}
\renewcommand{\cftdotsep}{1} % Denser dots (matching template)
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftchapnumwidth}{0pt}
\setlength{\cftbeforechapskip}{12pt} 

% Section and Subsection TOC formatting
\setlength{\cftsecindent}{1.25cm}
\setlength{\cftsecnumwidth}{1.5em}
\setlength{\cftbeforesecskip}{8pt} % Spacing for 1.5 lines feel
\setlength{\cftsubsecindent}{2.0cm}
\setlength{\cftsubsecnumwidth}{2.5em}
\setlength{\cftbeforesubsecskip}{8pt}
\setlength{\cftsubsubsecindent}{2.5cm}
\setlength{\cftsubsubsecnumwidth}{3em}
\setlength{\cftbeforesubsubsecskip}{8pt}

% Centering preliminary titles
\renewcommand{\cfttoctitlefont}{\hfill\fontsize{16}{19.2}\selectfont\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\fontsize{16}{19.2}\selectfont\bfseries}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\fontsize{16}{19.2}\selectfont\bfseries}
\renewcommand{\cftafterloftitle}{\hfill}

% Move TOC, LOF, LOT titles higher up
\setlength{\cftbeforetoctitleskip}{-24pt}
\setlength{\cftbeforelottitleskip}{-24pt}
\setlength{\cftbeforeloftitleskip}{-24pt}

% Redefine internal chapter command to insert two lines in TOC correctly
\newif\if@isappendix
\@isappendixfalse

\renewcommand\appendix{\par
  \clearpage
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{Appendix}%
  \gdef\thechapter{\@Alph\c@chapter}%
  \@isappendixtrue
  \providecommand\phantomsection{}
  \phantomsection
  \addcontentsline{toc}{chapter}{APPENDICES}%
}

\def\@chapter[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \if@isappendix
            \addcontentsline{toc}{chapter}{Appendix \thechapter\space #1}%
        \else
            % Insert "CHAPTER X" line
            \addcontentsline{toc}{chapter}{CHAPTER \thechapter}%
            % Insert title line
            \addcontentsline{toc}{chapter}{#1}%
        \fi
    \else
        \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \if@twocolumn
        \@topnewpage[\@makechapterhead{#2}]%
    \else
        \@makechapterhead{#2}%
        \@afterheading
    \fi
}

% Figure and table numbering
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

% Title Page - Following Epoka University Format
\newcommand{\makecoverpage}{%
    \begin{titlepage}
        \centering
        \onehalfspacing
        
        % Anchor to the very top of the text block
        \vspace*{0pt}
        
        % Title at the top
        {\normalsize \MakeUppercase{\th@title}\par}
        
        % Two empty lines with onehalfspacing
        \vspace{2\baselineskip}
        
        % Submission statement
        {\normalsize A THESIS SUBMITTED TO\par
        THE \MakeUppercase{\th@faculty}\par
        OF\par
        EPOKA UNIVERSITY\par}
        
        % Greatly reduced stretch to move BY / NAME precisely two more lines up
        \vspace{\stretch{1.1}}
        
        % BY
        {\normalsize BY\par}
        
        % One empty line after BY
        \vspace{\baselineskip}
        
        % Author name
        {\normalsize \MakeUppercase{\th@fullname}\par}
        
        % Stretch to balance the bottom half
        \vspace{\stretch{1}}
        
        % Degree statement
        {\normalsize IN PARTIAL FULFILLMENT OF THE REQUIREMENTS\par
        \if@itsaBSc
            FOR BACHELOR DEGREE\par
        \else
            FOR\par
            \if@itsaMSc
                THE DEGREE OF MASTER OF SCIENCE\par
            \else
                THE DEGREE OF DOCTOR OF PHILOSOPHY\par
            \fi
        \fi
        IN\par
        \MakeUppercase{\th@department}\par}
        
        % Final stretch to lower date to the bottom
        \vspace{\stretch{1}}
        
        % Date
        {\normalsize \MakeUppercase{\th@date}\par}
        
        % Push the Date explicitly to the bottom edge
        \vspace*{0pt}
        
    \end{titlepage}
    \clearpage
}

% Approval Page (Page i)
\newcommand{\makeapprovalpage}{%
    \thispagestyle{plain}
    \begin{center}
        \textbf{Approval sheet of the Thesis}\\[1cm]
    \end{center}
    
    \noindent
    This is to certify that we have read this thesis entitled ``\textbf{\MakeUppercase{\th@titleenglish}}'' and that in our opinion it is fully adequate, in scope and quality, as a thesis for the degree of \if@itsaBSc Bachelor of Science\else\if@itsaMSc Master of Science\else Doctor of Philosophy\fi\fi.
    
    \vspace{2cm}
    
    \begin{flushright}
        \rule{6cm}{0.4pt}\\
        \th@headofdepartment\\
        Head of Department\\
        Date: \rule{3cm}{0.4pt}
    \end{flushright}
    
    \vspace{1.5cm}
    
    \noindent
    Examining Committee Members:\par\vspace{0.5cm}
    
    \noindent
    \begin{tabular}{@{}p{0.45\textwidth}p{0.3\textwidth}l@{}}
        \th@committeeone & (\th@departmentenglish) & \rule{2.5cm}{0.4pt} \\[0.8cm]
        \th@committeetwo & (\th@departmentenglish) & \rule{2.5cm}{0.4pt} \\[0.8cm]
        \th@committeethree & (\th@departmentenglish) & \rule{2.5cm}{0.4pt} \\
    \end{tabular}
    
    \clearpage
}

% Declaration Page (Page ii)
\newcommand{\makedeclarationpage}{%
    \thispagestyle{plain}
    
    \noindent
    \textbf{I hereby declare that all information in this document has been obtained and presented in accordance with academic rules and ethical conduct. I also declare that, as required by these rules and conduct, I have fully cited and referenced all material and results that are not original to this work.}
    
    \vspace{3cm}
    
    \begin{flushright}
        \begin{tabular}{@{}rl@{}}
            Name Surname: & \th@fullname \\[0.5cm]
            Signature: & \rule{4cm}{0.4pt}
        \end{tabular}
    \end{flushright}
    
    \clearpage
}

% Abstract page
\newcommand{\makeabstractpage}{%
    \chapter*{ABSTRACT}
    \addcontentsline{toc}{chapter}{ABSTRACT}
    
    \begin{center}
        \vspace*{-12pt} % Adjusting for chapter header space
        \vspace{\baselineskip}
        {\bfseries\fontsize{14}{16.8}\selectfont \MakeUppercase{\th@titleenglish}}\\[\baselineskip]
        \vspace{\baselineskip}
        \th@lastname, \th@firstname\\
        \if@itsaBSc B.Sc.,\else\if@itsaMSc M.Sc.,\else Ph.D.,\fi\fi\ Department of \th@departmentenglish\\
        Supervisor: \th@supervisorenglish\\[\baselineskip]
    \end{center}
    
    \th@abstractcontent
    
    \vspace{\baselineskip}
    \vspace{\baselineskip}
    \vspace{\baselineskip}
    
    \noindent
    \textbf{Keywords:} \textit{\th@keywordsenglish}
    
    \clearpage
}

% Albanian Abstract page
\newcommand{\makeabstraktpage}{%
    \chapter*{ABSTRAKT}
    \addcontentsline{toc}{chapter}{ABSTRAKT}
    
    \begin{center}
        \vspace*{-12pt}
        \vspace{\baselineskip}
        {\bfseries\fontsize{14}{16.8}\selectfont \MakeUppercase{\th@title}}\\[\baselineskip]
        \vspace{\baselineskip}
        \th@lastname, \th@firstname\\
        \if@itsaBSc B.Sc.,\else\if@itsaMSc M.Sc.,\else Ph.D.,\fi\fi\ Departamenti i \th@department\\
        Mbikëqyrës: \th@supervisor\\[10pt]
    \end{center}
    
    \th@abstraktcontent
    
    \vspace{\baselineskip}
    \noindent
    \textbf{Fjalë kyçe:} \textit{\th@keywords}
    
    \clearpage
}

% Acknowledgments page
\newcommand{\makeacknowledgments}{%
    \chapter*{\fontsize{16}{19.2}\selectfont\bfseries ACKNOWLEDGMENTS}
    \addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}
    \vspace{20pt}
    
    \indent \th@acknowledgments
    
    \clearpage
}

% Dedication page (optional)
\newcommand{\makededication}{%
    \if@DedicationVar
        \thispagestyle{plain}
        \vspace*{5cm}
        
        \begin{center}
            \textit{\th@dedication}
        \end{center}
        
        \clearpage
    \fi
}

% Abbreviations page
\newcommand{\makeabbreviations}{%
    \if@AbbreviationVar
        \chapter*{LIST OF ABBREVIATIONS}
        \addcontentsline{toc}{chapter}{LIST OF ABBREVIATIONS}
        
        \th@abbreviations
        
        \clearpage
    \fi
}

% Front matter
\newcommand{\makefrontmatter}{%
    \pagenumbering{roman}
    \setcounter{page}{1}
    
    \makecoverpage
    \if@itsaBSc\else
        \makeapprovalpage
    \fi
    \makedeclarationpage
    \makeabstractpage
    \if@itsaBSc\else
        \makeabstraktpage
    \fi
    \makededication
    \makeacknowledgments
    \makeabbreviations
    
    % Table of Contents
    \begin{singlespace}
        \tableofcontents
    \end{singlespace}
    \clearpage
    
    % List of Tables (12pt spacing per guidelines)
    \if@TabloListesiVar
        {%
         \setlength{\parskip}{12pt}%
         \listoftables
        }
        \addcontentsline{toc}{chapter}{LIST OF TABLES}
        \clearpage
    \fi
    
    % List of Figures (12pt spacing per guidelines)
    \if@SekilListesiVar
        {%
         \setlength{\parskip}{12pt}%
         \listoffigures
        }
        \addcontentsline{toc}{chapter}{LIST OF FIGURES}
        \clearpage
    \fi
    
    % Start main matter
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

% Bibliography setup
\bibliographystyle{plain}

\endinput
