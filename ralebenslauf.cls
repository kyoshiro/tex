% ralebenslauf is a LaTeX class for curriculum vitae written in German.
%
% This class is written by Roman Asendorf <roman.asendorf@googlemail.com>
% based on rabrief, a class for letters written in German.
%
% and licensed by the Creative Commons Attribution-Share Alike 3.0 Unported
% http://creativecommons.org/licenses/by-sa/3.0/
% 
% created: 2009-01-09
% updated: 2009-01-14
%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ralebenslauf}
% --------------------------- Declaration of lables ------------------------- %
\newcommand{\labelCV}{Lebenslauf}
\newcommand{\labelPersonalInfo}{Zur Person}
\newcommand{\labelLastname}{Nachname:}
\newcommand{\labelFirstname}{Vorname:}
\newcommand{\labelAddress}{Adresse:}
\newcommand{\labelCountry}{Land:}
\newcommand{\labelBirthday}{Geburtsdatum:}
\newcommand{\labelBirthLocation}{Geburtsort:}
\newcommand{\labelFamily}{Familienstand:}
\newcommand{\labelFullName}[2]{#1 #2}
\newcommand{\labelCityCodeAndCity}[2]{#1 #2}
\newcommand{\labelCityAndDate}[2]{#1, den #2}
\newcommand{\labelphone}{Telefon:}
\newcommand{\labelmobile}{Mobil:}
\newcommand{\labelemail}{E-Mail:}


% Replace German text fragments by English text fragments
\DeclareOption{english}{%
  \renewcommand{\labelCV}{Curriculum Vitae}
  \renewcommand{\labelPersonalInfo}{About}
  \renewcommand{\labelLastname}{Lastname:}
  \renewcommand{\labelFirstname}{Firstname:}
  \renewcommand{\labelAddress}{Address:}
  \renewcommand{\labelCountry}{Country:}
  \renewcommand{\labelBirthday}{Date of birth:}
  \renewcommand{\labelBirthLocation}{Location of birth:}
  \renewcommand{\labelFamily}{Family:}
  \nreewcommand{\labelFullName}[2]{#1 #2}
  \renewcommand{\labelCityCodeAndCity}[2]{#1 #2}
  \renewcommand{\labelCityAndDate}[2]{#1, #2}
  \renewcommand{\labelphone}{phone no.:}%
  \renewcommand{\labelmobile}{mobile no.:}%
  \renewcommand{\labelemail}{email:}%
}

\ProcessOptions

% Class ralebenslauf is based on
\LoadClass[11pt,a4paper]{scrartcl}

% ---------------------- Declaration of requirements ------------------------ %
\RequirePackage{vmargin}
\RequirePackage{ifthen}

% The Pazo Math fonts are a family of PostScript fonts suitable
% for typesetting mathematics in combination with the Palatino
% family of text fonts.
% http://tug.ctan.org/info?id=mathpazo
\RequirePackage[sc,osf]{mathpazo}

% The "microtype" package provides a LaTeX interface to pdfTeXs
% micro-typographic extensions: character protrusion and font
% expansion.
% http://tug.ctan.org/info?id=microtype
\RequirePackage{microtype}

% There are problems in LaTeX that it "would be nice" to correct;
% fixltx2e provides a home for these corrections.
% http://tug.ctan.org/info?id=fixltx2e
\RequirePackage{fixltx2e}

% Implements a workaround for the LaTeX bug that marginpars will
% sometimes come out at the wrong margin.
% http://tug.ctan.org/info?id=mparhack
\RequirePackage{mparhack}

% Alternative versions of "ragged"-type commands
% http://tug.ctan.org/info?id=ragged2e
\RequirePackage{ragged2e}

% Imports images
% http://www.ctan.org/pub/tex-archive/info/?id=graphicx
\RequirePackage{graphicx}
\RequirePackage{eso-pic}

% Managing custom tables
% http://www.ctan.org/pub/tex-archive/info/?id=longtable
\RequirePackage{longtable}

\setlength{\parindent}{0pt}

% --------------------- Declaration of custom commands ---------------------- %
\newcommand{\TheFromLastname}{}
\newcommand{\fromlastname}[1]{\AtBeginDocument{\renewcommand{\TheFromLastname}{#1}}}
\newcommand{\TheFromFirstname}{}
\newcommand{\fromfirstname}[1]{\AtBeginDocument{\renewcommand{\TheFromFirstname}{#1}}}
\newcommand{\TheFromStreetShort}{}
\newcommand{\fromstreetshort}[1]{\AtBeginDocument{\renewcommand{\TheFromStreetShort}{#1}}}
\newcommand{\TheFromStreet}{}
\newcommand{\fromstreet}[1]{\AtBeginDocument{\renewcommand{\TheFromStreet}{#1}}}
\newcommand{\TheFromCityCC}{}
\newcommand{\fromcitycc}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCC}{#1}}}
\newcommand{\TheFromCityShort}{}
\newcommand{\fromcityshort}[1]{\AtBeginDocument{\renewcommand{\TheFromCityShort}{#1}}}
\newcommand{\TheFromCity}{}
\newcommand{\fromcity}[1]{\AtBeginDocument{\renewcommand{\TheFromCity}{#1}}}
\newcommand{\TheFromCityCode}{}
\newcommand{\fromcitycode}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCode}{#1}}}
\newcommand{\TheFromCountry}{}
\newcommand{\fromcountry}[1]{\AtBeginDocument{\renewcommand{\TheFromCountry}{#1}}}
\newcommand{\TheFromPhone}{}
\newcommand{\fromphone}[1]{\AtBeginDocument{\renewcommand{\TheFromPhone}{#1}}}
\newcommand{\TheFromMobile}{}
\newcommand{\frommobile}[1]{\AtBeginDocument{\renewcommand{\TheFromMobile}{#1}}}
\newcommand{\TheFromEMail}{}
\newcommand{\fromemail}[1]{\AtBeginDocument{\renewcommand{\TheFromEMail}{#1}}}
\newcommand{\TheFromBirthday}{}
\newcommand{\frombirthday}[1]{\AtBeginDocument{\renewcommand{\TheFromBirthday}{#1}}}
\newcommand{\TheFromBirthLocation}{}
\newcommand{\frombirthlocation}[1]{\AtBeginDocument{\renewcommand{\TheFromBirthLocation}{#1}}}
\newcommand{\TheFromFamily}{}
\newcommand{\fromfamily}[1]{\AtBeginDocument{\renewcommand{\TheFromFamily}{#1}}}

\newcommand{\ThePhoto}{}
\newcommand{\photo}[1]{\AtBeginDocument{\renewcommand{\ThePhoto}{#1}}}
\newcommand{\TheSign}{}
\newcommand{\sign}[1]{\AtBeginDocument{\renewcommand{\TheSign}{#1}}}

\newcommand{\TheDate}{\today}
\renewcommand{\date}[1]{\AtBeginDocument{\renewcommand{\TheDate}{#1}}}

% \setmarginsrb{left}{top}{right}{bottom}{headhgt}{headsep}{foothgt}{footskip}
\setmarginsrb{2.5cm}{2cm}{2cm}{2cm}{0cm}{0cm}{2cm}{2cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{1.75ex plus 0.75ex minus 0.75ex}

% ------------------------ Modifications to sections ------------------------ %
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-1.5ex \@plus -.1ex \@minus -.2ex}%
  {1ex \@plus.2ex}%
  % Changing font to capital
  {\large\sc}}%

% -------------------------- Start new table section ------------------------ %
\newenvironment{tableSection*}[1]{
  \vskip 3mm\section*{#1}
  \begin{longtable}
    % Columns in percent
    {@{} p{.21\textwidth} @{\hskip .02\textwidth} p{.77\textwidth} @{}}
}{\end{longtable}}%

% ------------------------- Start new simple section ------------------------ %
\newenvironment{tinySection*}[1]{
  \vskip 3mm\section*{#1}%
\begin{longtable}
    % Columns in percent
    {@{} p{\textwidth} @{}}
}{\end{longtable}}%

% -------------- Starts a new curricilum vitae environment ------------------ %
\newenvironment{curvit}{
  
  \thispagestyle{empty}

  % --------------------------------- The header ---------------------------- %
  \begin{minipage}[t]{8cm}
    % Remove empty space before header
    \vspace*{-15mm}
    \textbf{\Large\sc{\labelCV}}
  \end{minipage}%
  % Finish with a horizontal line
  \vspace{-1ex}\hrule height 1.5pt%

  % ------------------------------- Personalities --------------------------- %
  \begin{minipage}[t]{\textwidth}
    \begin{tableSection*}{}%\labelPersonalInfo}
      % Checks if content is given else skips entry
      \ifthenelse{\equal{\TheFromLastname}{}}{}{\textbf{\labelLastname} &
        \TheFromLastname\\}%
      \ifthenelse{\equal{\TheFromFirstname}{}}{}{\textbf{\labelFirstname} &
        \TheFromFirstname\\}%
      \ifthenelse{\equal{\TheFromBirthday}{}}{}{\textbf{\labelBirthday} &
        \TheFromBirthday\\}%
      \ifthenelse{\equal{\TheFromBirthLocation}{}}{}{\textbf{\labelBirthLocation}
        & \TheFromBirthLocation\\}%
      \ifthenelse{\equal{\TheFromFamily}{}}{}{\textbf{\labelFamily} &
        \TheFromFamily\\}%
      \ifthenelse{\equal{\TheFromStreet}{}}{}{\textbf{\labelAddress} &
        \TheFromStreet\\}%
      \ifthenelse{\equal{\TheFromCity}{}}{}{&
        \labelCityCodeAndCity{\TheFromCityCode}{\TheFromCity}\\}%
      \ifthenelse{\equal{\TheFromCountry}{}}{}{\textbf{\labelCountry} &
        \TheFromCountry\\}%
      \ifthenelse{\equal{\TheFromPhone}{}}{}{\textbf{\labelphone} &
        \TheFromPhone\\}%
      \ifthenelse{\equal{\TheFromMobile}{}}{}{\textbf{\labelmobile} &
        \TheFromMobile\\}%
      \ifthenelse{\equal{\TheFromEMail}{}}{}{\textbf{\labelemail} &
        \TheFromEMail\\}% 
    \end{tableSection*}%

    % Push block right behind personalities
    \hspace*{12.5cm}%
    \begin{minipage}[t][5.5cm]{5.5cm}
      % Push picture upward
      \vspace{-6.1cm}\ThePhoto
    \end{minipage}%
  \end{minipage}%

  % Remove empty space
  \vspace*{-6cm}%

  % ------------------------------ Folding marks ---------------------------- %
  \setlength{\unitlength}{1mm}
  \begin{picture}(0,0)
    \put(-25,-14){\line(1,0){3}}
    \put(-25,-71.5){\line(1,0){4}}
    \put(-25,-128.5){\line(1,0){3}}
  \end{picture}%

  % ------------------------------- Main content ---------------------------- %
  \begin{FlushLeft}
    \renewcommand{\baselinestretch}{1.2}\normalsize
}
{
  \renewcommand{\baselinestretch}{1.0}\normalsize
  \end{FlushLeft}

  % Set space before main content closing
  \vspace{0.5cm plus 0.1cm minus 0.5cm}%

  % Closing with name, city and date
  \enlargethispage{2.5cm}
    \begin{minipage}[t][2cm]{\linewidth}%
      \vspace{-0.5cm}%
      \AddToShipoutPicture*{\TheSign}%
      \hspace*{5mm}%
      \vspace{5mm}%
    \end{minipage}
  \labelFullName{\TheFromFirstname}{\TheFromLastname}\\
  \labelCityAndDate{\TheFromCity}{\TheDate}
}
