% rabrief is a LaTeX class for letters written in German.
%
% This class is written by Roman Asendorf <roman.asendorf@gmail.com> adapted 
% from tfbrief written by Thomas Fischer <thomas.fischer@t-fischer.net>
%
% and licensed by the Creative Commons Attribution-Share Alike 3.0 Unported
% http://creativecommons.org/licenses/by-sa/3.0/
% 
% created: 2009-01-09
% updated: 2010-02-23
%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{rabrief}

% --------------------------- Declaration of lables ------------------------- %
\newcommand{\labelphone}{Telefon}
\newcommand{\labelmobile}{Mobil}
\newcommand{\labelemail}{E-Mail}
\newcommand{\labelcustomer}{Kundennummer}
\newcommand{\labelviafaxto}[1]{Fax #1}
\newcommand{\labelviaemailto}[1]{via email: #1}
\newcommand{\labelfromanddate}[2]{#1, den #2}
\newcommand{\labelattachments}{Anlagen}
% Replace German text fragments by English text fragments
\DeclareOption{english}{%
  \renewcommand{\labelphone}{phone no.}%
  \renewcommand{\labelmobile}{mobile no.}%
  \renewcommand{\labelemail}{email}%
  \renewcommand{\labelcustomer}{customer no.}%
  \renewcommand{\labelviafaxto}[1]{via fax #1}%
  \renewcommand{\labelviaemailto}[1]{via email: #1}%
  \renewcommand{\labelfromanddate}[2]{#1, #2}%
  \renewcommand{\labelattachments}{Attachments}%
}

\ProcessOptions

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

% --------------------- Declaration of custom commands ---------------------- %
\newlength{\fromwidth}
\setlength{\fromwidth}{5cm}
\newcommand{\TheFromNameShort}{}
\newcommand{\fromnameshort}[1]{\AtBeginDocument{\renewcommand{\TheFromNameShort}{#1}}}
\newcommand{\TheFromName}{}
\newcommand{\fromname}[2][]{\AtBeginDocument{\renewcommand{\TheFromName}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromNameShort}{#1}}}}
\newcommand{\TheFromStreetShort}{}
\newcommand{\fromstreetshort}[1]{\AtBeginDocument{\renewcommand{\TheFromStreetShort}{#1}}}
\newcommand{\TheFromStreet}{}
\newcommand{\fromstreet}[2][]{\AtBeginDocument{\renewcommand{\TheFromStreet}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromStreetShort}{#1}}}}
\newcommand{\TheFromCityCC}{}
\newcommand{\fromcitycc}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCC}{#1}}}
\newcommand{\TheFromCityShort}{}
\newcommand{\fromcityshort}[1]{\AtBeginDocument{\renewcommand{\TheFromCityShort}{#1}}}
\newcommand{\TheFromCity}{}
\newcommand{\fromcity}[2][]{\AtBeginDocument{\renewcommand{\TheFromCity}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheFromCityShort}{#1}}}}
\newcommand{\TheFromCityCode}{}
\newcommand{\fromcitycode}[1]{\AtBeginDocument{\renewcommand{\TheFromCityCode}{#1}}}
\newcommand{\TheFromCountry}{}
\newcommand{\fromcountry}[1]{\AtBeginDocument{\renewcommand{\TheFromCountry}{#1}}}
\newcommand{\TheFromPhone}{}
\newcommand{\fromphone}[1]{\AtBeginDocument{\renewcommand{\TheFromPhone}{#1}}}
\newcommand{\TheFromFax}{}
\newcommand{\fromfax}[1]{\AtBeginDocument{\renewcommand{\TheFromFax}{#1}}}
\newcommand{\TheFromMobile}{}
\newcommand{\frommobile}[1]{\AtBeginDocument{\renewcommand{\TheFromMobile}{#1}}}
\newcommand{\TheFromEMail}{}
\newcommand{\fromemail}[1]{\AtBeginDocument{\renewcommand{\TheFromEMail}{#1}}}
\newcommand{\TheFromCustomer}{}
\newcommand{\fromcustomer}[1]{\AtBeginDocument{\renewcommand{\TheFromCustomer}{#1}}}
\newcommand{\TheToName}{}
\newcommand{\toname}[1]{\AtBeginDocument{\renewcommand{\TheToName}{#1}}}
\newcommand{\TheToSubname}{}
\newcommand{\tosubname}[1]{\AtBeginDocument{\renewcommand{\TheToSubname}{#1}}}
\newcommand{\TheToStreet}{}
\newcommand{\tostreet}[1]{\AtBeginDocument{\renewcommand{\TheToStreet}{#1}}}
\newcommand{\TheToCityCC}{}
\newcommand{\tocitycc}[1]{\AtBeginDocument{\renewcommand{\TheToCityCC}{#1}}}
\newcommand{\TheToCityShort}{}
\newcommand{\tocityshort}[1]{\AtBeginDocument{\renewcommand{\TheToCityShort}{#1}}}
\newcommand{\TheToCity}{}
\newcommand{\tocity}[2][]{\AtBeginDocument{\renewcommand{\TheToCity}{#2}\ifthenelse{\equal{#1}{}}{}{\renewcommand{\TheToCityShort}{#1}}}}
\newcommand{\TheToCityCode}{}
\newcommand{\tocitycode}[1]{\AtBeginDocument{\renewcommand{\TheToCityCode}{#1}}}
\newcommand{\TheToCountry}{}
\newcommand{\tocountry}[1]{\AtBeginDocument{\renewcommand{\TheToCountry}{#1}}}
\newcommand{\TheToFax}{}
\newcommand{\tofax}[1]{\AtBeginDocument{\renewcommand{\TheToFax}{#1}}}
\newcommand{\TheToEmail}{}
\newcommand{\toemail}[1]{\AtBeginDocument{\renewcommand{\TheToEmail}{#1}}}
\newcommand{\TheSubject}{Betreff}
\renewcommand{\subject}[1]{\AtBeginDocument{\renewcommand{\TheSubject}{#1}}}
\newcommand{\TheDate}{\today}
\renewcommand{\date}[1]{\AtBeginDocument{\renewcommand{\TheDate}{#1}}}
\newcommand{\TheGreeting}{Sehr geehrte Damen und Herren,}
\newcommand{\greeting}[1]{\AtBeginDocument{\renewcommand{\TheGreeting}{#1}}}
\newcommand{\TheLeave}{Mit freundlichen Gr\"u\ss en,}
\newcommand{\leave}[1]{\AtBeginDocument{\renewcommand{\TheLeave}{#1}}}
\newcommand{\TheSignature}{\vspace{1cm}}
\newcommand{\signature}[1]{\AtBeginDocument{\renewcommand{\TheSignature}{#1}}}
\newcommand{\TheSign}{}
\newcommand{\sign}[1]{\AtBeginDocument{\renewcommand{\TheSign}{#1}}}
% 
% \setmarginsrb{left}{top}{right}{bottom}{headhgt}{headsep}{foothgt}{footskip}
\setmarginsrb{2.5cm}{2cm}{1.75cm}{2cm}{0cm}{0cm}{2cm}{2cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{1.75ex plus 0.75ex minus 0.75ex}

% -------------------- Starts a new letter environment ---------------------- %
\newenvironment{letter}{
  
  \thispagestyle{empty}
  
  % --------------------------------- The header ------------------------------ %
  \begin{minipage}[t]{8cm}
    % Remove empty space before header
    \vspace*{-15mm}
            {\sc
              \textbf{\Large\sc{\TheFromName}}\\%
              \TheFromStreet\\%
              \ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC --\TheFromCityCode}\ \TheFromCity\\%
              \ifthenelse{\equal{\TheFromCountry}{}}{}{\TheFromCountry\\}}
  \end{minipage}
  %
  \begin{minipage}[t]{8.5cm}
    \begin{flushright}
      \vspace*{-8mm}
      % Checks if content is given else skips entry
              {\sc\small
                \ifthenelse{\equal{\TheFromEMail}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\textbf\footnotesize\labelemail\hspace{1em}}{\TheFromEMail}\\}%
                \ifthenelse{\equal{\TheFromPhone}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\textbf\footnotesize \labelphone\hspace{1em}}\TheFromPhone\\}%
                \ifthenelse{\equal{\TheFromFax}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\textbf\footnotesize Fax\hspace{1em}}\TheFromFax\\}%
                \ifthenelse{\equal{\TheFromMobile}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\textbf\footnotesize \labelmobile\hspace{1em}}\TheFromMobile\\}%
                \ifthenelse{\equal{\TheFromCustomer}{}}{}{\hspace*{-2cm}\makebox[2cm][r]{\textbf\footnotesize \labelcustomer\hspace{1em}}\TheFromCustomer\\}}%
    \end{flushright}
  \end{minipage}
  % Finish with a horizontal line
  \vspace{1mm}
  \hrule height 1.5pt
  % ------------------------------ Folding marks ------------------------------ %
  \setlength{\unitlength}{1mm}
  \begin{picture}(0,0)
    % y-offset of 24 is required
    \put(-25,-57){\line(1,0){3}}
    \put(-25,-114.5){\line(1,0){4}}
    \put(-25,-171.5){\line(1,0){3}}
  \end{picture}
  % ------------------------------ Address field ------------------------------ %
  \begin{minipage}[t]{8cm}
    % Set space before address field
    \vspace*{10mm}
    \begin{minipage}[t]{\linewidth}
      % From part
      {\fontfamily{phv}\fontseries{mc}\selectfont \scriptsize
        \ifthenelse{\equal{\TheFromNameShort}{}}{\TheFromName}{\TheFromNameShort}
        $\cdot$
        \ifthenelse{\equal{\TheFromStreetShort}{}}{\TheFromStreet}{\TheFromStreetShort}
        $\cdot$
        \ifthenelse{\equal{\TheFromCityCC}{}}{\TheFromCityCode}{\TheFromCityCC
          --\TheFromCityCode}
        \ifthenelse{\equal{\TheFromCityShort}{}}{\TheFromCity}{\TheFromCityShort} \vspace{-1ex}
        \rule{0cm}{0cm}\\\hrule\rule{0cm}{0cm}}\\
      % To part
      \TheToName \\
      \TheToSubname \\
      \ifthenelse{\equal{\TheToStreet}{}}{\vspace*{0.75ex}\\}{\TheToStreet\vspace*{0.6ex}\\}
                 {\bfseries \ifthenelse{\equal{\TheToCityCC}{}}{\TheToCityCode}{\TheToCityCC --\TheToCityCode} \TheToCity}\\
                 \ifthenelse{\equal{\TheToCountry}{}}{}{\\\textbf{\TheToCountry}}
                 \ifthenelse{\equal{\TheToFax}{}}{}{
                   % Set space before fax no.
                   \vspace{0.5em}
                   \fbox{\footnotesize \labelviafaxto{\TheToFax}}}
                 \ifthenelse{\equal{\TheToEmail}{}}{}{
                   % Set space before email address
                   \vspace{0.5em}
                   \fbox{\footnotesize \labelviaemailto{\TheToEmail}}}
    \end{minipage}
  \end{minipage}
  % ------------------------------- Main content ------------------------------ %

  % Set space before main content
  \vspace{1cm plus 3.5cm minus 1.75cm}
  
  % Setting city and date on the right side
  \begin{flushright}
    \labelfromanddate{\TheFromCity}{\TheDate}
  \end{flushright}
  
  % Set space before subject
  \vspace{1cm plus 3.5cm minus 1.75cm}
         {\bfseries \TheSubject}
         
         % Set space before greeting
         \vspace{0.75cm plus 1cm minus 0.75cm}
         \TheGreeting
         
         \begin{FlushLeft}
           \renewcommand{\baselinestretch}{1.2}\normalsize
}
{
  \renewcommand{\baselinestretch}{1.0}\normalsize
         \end{FlushLeft}
         % Closing main content with leave and signature
         \ifthenelse{\equal{\TheLeave}{}}{}{
           \vspace{0.5em plus 0.5em minus 0.75em}
           \TheLeave}\\%
         \vspace{-0.5em plus 0.25em minus 0.25em}
         \begin{minipage}[t][2cm]{\linewidth}
           \TheSignature
           %\vspace{-0.5cm}
           %\AddToShipoutPicture*{\TheSign}
           %\hspace*{5mm}
           \vspace{5mm}
           \TheFromName
         \end{minipage}
}
% ------------------- Starts a new attachment environment ------------------- %
\newenvironment{attachment}{
  \vspace{0.5cm plus 0.5cm minus 0.5cm}\vfill
  \labelattachments:
  % Set space before list
  \vspace{0.5em}}{}
  %\begin{itemize}
  %  \setlength{\itemsep}{0cm}
%}{\end{itemize}}

