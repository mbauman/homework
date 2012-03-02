%%
%% This is file `homework.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% homework.dtx  (with options: `class')
%% ------------------------------------------------------------------------
%% homework --- A class and style for the authoring of homework assignments
%% Author: Matt Bauman <mbauman@gmail.com>
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{homework}
  [2012/03/01 v0.1 by Matthew J. Bauman]
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
\def\@sect#1#2#3#4#5#6[#7]#8{\hw@sectsplit{#1}{{#2}{#3}{#4}{#5}{#6}}[#7||]{#8}}
\def\hw@sectsplit#1#2[#3|#4|#5]#6{
  \ifcsundef{hw@theorig#1}
    { \csletcs{hw@theorig#1}{the#1}\csletcs{hw@theprev#1}{the#1} }
    { \relax }
  \ifcsequal{the#1}{hw@theprev#1}
    { \relax }
    { \csletcs{hw@theorig#1}{the#1}\csletcs{hw@theprev#1}{the#1} }
  \ifstrempty{#4#5}
    {
      \csedef{the#1}{\csexpandonce{hw@theorig#1}}
      \@@sect{#1}#2[{#3}]{#6}
    }
    {
      \csedef{the#1}{#3}
      \csletcs{hw@theprev#1}{the#1}
      \ifstrempty{#4}
        {\@@sect{#1}#2[{#6}]{#6}}
        {\@@sect{#1}#2[{#4}]{#6}}
    }
}
\patchcmd{\@maketitle}{\null\vskip 2em}{\null}{}{}
\let\Small\footnotesize
\let\SMALL\scriptsize
%% Copyright (C) 2012 by Matt Bauman <mbauman@gmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Matt Bauman <mbauman@gmail.com>.
%% 
%% This work consists of the file  homework.dtx
%% and the derived files           homework.{ins,pdf,sty,cls}
%%
%% End of file `homework.cls'.
