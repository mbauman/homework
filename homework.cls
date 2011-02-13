%%
%% This is file `homework.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% homework.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2011 by Matt Bauman <mbauman@gmail.com>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{homework}
    [2011/02/13 v0.1 by Matthew J. Bauman]
\DeclareFontFamily{U}{rsfs}{\skewchar\font127 }
\DeclareFontShape{U}{rsfs}{m}{n}{ % Allow continuous sizing
   <-6>  rsfs5
   <6-8> rsfs7
   <8->  rsfs10
}{}
\RequirePackage{etoolbox}
\newcommand{\hw@sidedness}[1]{\def\hw@side{#1side}}
\newtoggle{hw@print}

\DeclareOption{print}{\toggletrue{hw@print}   \hw@sidedness{two}}
\DeclareOption{screen}{\togglefalse{hw@print} \hw@sidedness{one}}
\DeclareOption{oneside}{\hw@sidedness{one}}
\DeclareOption{twoside}{\hw@sidedness{two}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{11pt,screen}
\ProcessOptions\relax

\LoadClass[\hw@side]{article}
\let\@@sect\@sect
\def\@sect#1#2#3#4#5#6[#7]#8{ %
  \hw@sectsplit{#1}{{#2}{#3}{#4}{#5}{#6}}[#7||]{#8}
}
\def\hw@sectsplit#1#2[#3|#4|#5]#6{ %
  \ifcsundef{hw@theorig#1}
    {\expandafter\edef\csname hw@theorig#1\endcsname %
      {\expandafter\expandonce\csname the#1\endcsname}}
    {\relax}
  \ifstrempty{#4#5}
  {
    \expandafter\edef\csname the#1\endcsname %
      {\expandafter\noexpand\csname hw@theorig#1\endcsname}
    \@@sect{#1}#2[{#3}]{#6}
  }
  {
    \expandafter\edef\csname the#1\endcsname{#3}
    \ifstrempty{#4}
      {\@@sect{#1}#2[{#6}]{#6}}
      {\@@sect{#1}#2[{#4}]{#6}}
  }
}
\patchcmd{\@maketitle}{\null\vskip 2em}{\null}{}{}
\endinput
%%
%% End of file `homework.cls'.
