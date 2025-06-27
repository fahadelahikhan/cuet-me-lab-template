%% cuet-report.cls
%% A custom LaTeX class for CUET Mechanical Engineering Lab Reports
%% 
%% Author: Fahad Elahi Khan (Student ID: 2103017)
%% Institution: Chittagong University of Engineering & Technology
%% Department: Mechanical Engineering
%% Created: June 2025
%% 
%% This class file is designed specifically for CUET ME lab reports
%% and contains custom formatting and styling requirements.
%% 
%% Usage Restriction Notice:
%% This class file contains original design elements and custom formatting
%% created by the author. While LaTeX code itself cannot be copyrighted,
%% the specific design choices, color schemes, and layout arrangements
%% represent original creative work. Users are requested to:
%% 1. Acknowledge the original author when using this template
%% 2. Not claim this work as their own original creation
%% 3. Respect the academic integrity principles when adapting this code
%%
%% Contact: khanfahadelahi@gmail.com for permissions or collaborations
%% 
%% Licensed under Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%% This means you can use and modify it for non-commercial purposes,
%% but must provide attribution and share derivatives under same license.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cuet-report}[2025/06/27 v1.0 CUET ME Lab Report Class by Fahad Elahi Khan]

% Base class
\LoadClass[a4paper,10pt]{article}

% Required packages
\RequirePackage{xcolor}
\RequirePackage{pagecolor}
\RequirePackage{fontspec} 
\RequirePackage{microtype} 
\RequirePackage[a4paper]{geometry}
\RequirePackage{fancyhdr} 
\RequirePackage{setspace}
\RequirePackage{titlesec} 
\RequirePackage{tocloft} 
\RequirePackage{graphicx} 
\RequirePackage{float}
\RequirePackage{tcolorbox}
\RequirePackage{hyperref}
\RequirePackage{atbegshi}

% Custom integrity check - This will cause compilation error if removed
\newcommand{\@authorcheck}{Fahad Elahi Khan - CUET ME 2103017}
\newcommand{\@classversion}{cuet-report v1.0 - Original by \@authorcheck}

% Page geometry setup
\geometry{
    top=2.3cm,
    bottom=1.75cm,
    left=2.3cm,
    right=1.75cm
}

% Custom color definitions
\definecolor{darkblue}{rgb}{0.0, 0.0, 0.5}
\definecolor{extrawhite}{rgb}{1.0, 1.0, 0.98}

% Font setup with fallback options
\IfFontExistsTF{Crimson-Roman}{
    \setmainfont{Crimson-Roman}[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *,
        BoldFont = *,
        ItalicFont = *,
        BoldItalicFont = *
    ]
}{
    \PackageWarning{cuet-report}{Crimson-Roman font not found, using default serif font}
    \setmainfont{Times New Roman}
}

\IfFontExistsTF{Playfair Display Black}{
    \newfontfamily\headingfont{Playfair Display Black}[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = PlayfairDisplay-Black,
        BoldFont = PlayfairDisplay-Black
    ]
}{
    \PackageWarning{cuet-report}{Playfair Display Black font not found, using bold serif}
    \newfontfamily\headingfont[BoldFont = *]{\rmfamily}
}

\IfFontExistsTF{Merriweather Bold}{
    \newfontfamily\subheadingfont{Merriweather}[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = Merriweather-Bold,
        BoldFont = Merriweather-Bold
    ]
    \newfontfamily\subtitlefont{Merriweather}[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = Merriweather-Regular,
        BoldFont = Merriweather-Bold
    ]
}{
    \PackageWarning{cuet-report}{Merriweather fonts not found, using default serif variants}
    \newfontfamily\subheadingfont[BoldFont = *]{\rmfamily}
    \newfontfamily\subtitlefont{\rmfamily}
}

% Title formatting
\titleformat{\section}{\LARGE\headingfont\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\Large\headingfont\bfseries}{\thesubsection}{1em}{}

% Header and footer setup
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

% Line spacing
\onehalfspacing

% Custom commands for report information
\newcommand{\reportnumber}[1]{\gdef\@reportnumber{#1}}
\newcommand{\reporttitle}[1]{\gdef\@reporttitle{#1}}
\newcommand{\studentname}[1]{\gdef\@studentname{#1}}
\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand{\groupname}[1]{\gdef\@groupname{#1}}
\newcommand{\coursecode}[1]{\gdef\@coursecode{#1}}
\newcommand{\coursetitle}[1]{\gdef\@coursetitle{#1}}
\newcommand{\performancedate}[1]{\gdef\@performancedate{#1}}
\newcommand{\submissiondate}[1]{\gdef\@submissiondate{#1}}

% Default values
\reportnumber{XX}
\reporttitle{Report Title}
\studentname{Student Name}
\studentid{Student ID}
\groupname{Group}
\coursecode{Course Code}
\coursetitle{Course Title}
\performancedate{DD/MM/YYYY}
\submissiondate{DD/MM/YYYY}

% Custom title page command
\newcommand{\makereporttitle}{
    \begin{titlepage}
        \pagecolor{white}
        \centering
        {\fontsize{20}{22}\selectfont\headingfont\bfseries \textbf{\textcolor{gray!3!black}{Chittagong\ University\ of\ Engineering\ \&\ Technology}}}
        
        \vspace{0.5cm}
        {\fontsize{16}{18}\selectfont\subheadingfont\bfseries \textbf{\textcolor{gray!3!black}{Department of Mechanical Engineering}}}
        
        \vspace{0.3cm}
        
        \begin{figure}[H]
            \centering
            \IfFileExists{images/CUET_Logo.png}{%
                \includegraphics[width=2in]{images/CUET_Logo}%
            }{%
                \PackageWarning{cuet-report}{CUET_Logo.png not found in images/ directory}%
                \fbox{\parbox{2in}{\centering CUET\\LOGO\\[1cm]}}%
            }\par
            \vspace{0.3cm}
        \end{figure}
        
        \vspace{0.7cm}
        
        \centering \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Lab Report \raisebox{-0.05ex}{\textasciitilde} \subtitlefont{\@reportnumber}}}
        
        \vspace{0.5cm}
        
        \begin{flushleft} 
            \begin{tabular}{lll}
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Name of the Report}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{ \ :}} 
            \end{tabular}
        \end{flushleft}
        
        \vspace{0.1cm}
        
        \begin{center}
            \begin{tcolorbox}[
                colback=gray!7, colframe=darkblue, 
                width=1\textwidth, 
                boxrule=0.5mm, 
                arc=4mm,
                left=8mm, right=8mm, 
                top=3mm, bottom=3mm,
                colbacktitle=gray!20,
                ]
                \centering {\fontsize{16}{18}\selectfont\headingfont {\@reporttitle}}
            \end{tcolorbox}
            \vspace{0.3cm}
        \end{center}
        
        \begin{flushleft} 
            \begin{tabular}{lll}
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Name of the Student}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@studentname}} \\ 
                $\, $ & $\, $ & $\, $ \\ 
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Student ID}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@studentid}} \\ 
                $\, $ & $\, $ & $\, $ \\ 
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Group}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@groupname}} \\ 
                $\, $ & $\, $ & $\, $ \\ 
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Course Code}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@coursecode}} \\ 
                $\, $ & $\, $ & $\, $ \\ 
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Course Title}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@coursetitle}} \\ 
                $\, $ & $\, $ & $\, $ \\ 
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Date of Performance}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@performancedate}} \\ 
                $\, $ & $\, $ & $\, $ \\ 
                \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{Date of Submission}}  & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subheadingfont \textbf{:}} & \textcolor{gray!7!black}{\fontsize{14}{16}\selectfont\subtitlefont {\@submissiondate}} \\ 
            \end{tabular}
        \end{flushleft}
        
        \begin{flushright}
            \begin{minipage}{0.3\textwidth}
                \centering {\raggedright \fontsize{14}{16}\selectfont\subheadingfont \textbf{Remarks :}}
                \begin{tcolorbox}[colback=white, colframe=darkblue, width=\textwidth, boxrule=0.3mm, arc=2mm, left=1mm]
                    \vspace{1.3cm}
                \end{tcolorbox}
            \end{minipage}
        \end{flushright}
        
    \end{titlepage}
}

% Add class attribution to document properties
\AtBeginDocument{
    \hypersetup{
        pdftitle={CUET ME Lab Report - \@reporttitle},
        pdfauthor={\@studentname},
        pdfcreator={\@classversion},
        pdfsubject={CUET Mechanical Engineering Lab Report}
    }
}