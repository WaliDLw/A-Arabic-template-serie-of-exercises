 

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{walidex}[24/05/2019 v1]

% La classe manEN2019.cls s'appuie sur la structure de la classe book
% pour le sectionnage (chapter, section ...)
 
\LoadClassWithOptions{article}
%\RequirePackage{mathpazo} % Police d'écriture

% Packages AMS %%%%%%
\RequirePackage{amsmath,amsthm,amsfonts,amssymb}
% Package vecteurs %%%%%%
\RequirePackage{esvect,pifont}
% Package couleur %%%%%%
\RequirePackage[table]{xcolor}
% Package pour le fond de page %%%%%%
\RequirePackage{eso-pic}
 \usepackage{pdfpages}
% Package pour les titres de sections %%%%%%
\RequirePackage[nobottomtitles*]{titlesec}
% Package pour les titres de table des matières %%%%%%
\RequirePackage{titletoc}
% Package pour écrire en plusieurs colonnes %%%%%%
\RequirePackage{multicol}
% Package pour les entêtes et pied de page %%%%%%
\RequirePackage{fancyhdr}
% Package pour maximum height dans \includegraphics
\RequirePackage[export]{adjustbox}
% Package pour enumeration et itemize %%%%%%
\RequirePackage{enumitem}
% Package tikz %%%%%%
\RequirePackage{tikz}
\usetikzlibrary{calc,shapes}
\RequirePackage{calc}
\usepackage{tikzpagenodes}\usetikzlibrary{shapes.geometric}
% Package bclogo (pour les théorèmes) %%%%%%
\RequirePackage[tikz]{bclogo}
% Package ifthen pour faire des conditions %%%%%%
\RequirePackage{ifthen}
%\usepackage{bidicontour}
 \usepackage[outline]{bidicontour}

% Package pour colorier les tableaux
\RequirePackage{colortbl}
% Package pour faire du  avec les enumerate/itemize
\RequirePackage{multienum}
% Hyperref et Geometry %%%%%%
\usepackage[paperwidth=21 cm,paperheight=30 cm, margin=0.4cm,bottom=2cm]{geometry}
%\RequirePackage[a4paper,margin=0.4cm,bottom=2.8cm]{geometry}
\RequirePackage[colorlinks=true,allcolors=purple]{hyperref}
% Package pour le code %%%%%%
\RequirePackage{listings}
%
\definecolor{myblue}{rgb}{0.0, 0.0, 0.5}
\usepackage[many]{tcolorbox}
\usetikzlibrary{patterns}
\RequirePackage{polyglossia}
\RequirePackage{forest}
\RequirePackage{ulem}
% \usepackage{tkz-fct}
% desactiver message d'erreur bidi package -------------------
% 
%===============================================================
%%%%%%%%%%%%%%%%%%%%%
% Pour permettre à  polyglosssia et arabxetex de coexister:
 
%--------------------------------------
% Définition de commandes d'illustration
\renewcommand{\bctrombone}{\includegraphics[width=6mm]{icons/bctromboneblanc}}
\renewcommand{\bccle}{\includegraphics[width=9mm]{icons/bccleblanc}}
\newcommand{\bulle}{\autofontsize{14pt}\color{purple}\textbullet}

 

 
  

% Redéfinition des listes à puces et enumératives
%\setlist[itemize]{wide, label={\bulle},itemsep = -0.3cm}
\setlist[enumerate,1]{leftmargin=03ex,label =\color{purple} $(\arabic*$,
ref = \arabic*,itemsep = -0.1cm}
\setlist[enumerate,2]{leftmargin=03ex,label =\color{purple}\alph*),
ref = \alph*)}
%\setlist[enumerate,3]{wide,label =(\roman*),
%ref = \roman*)}
\SetEnumitemKey{twocol}{
% itemsep = 0.6\itemsep,
%parsep = 0.6\parsep,
before = \vspace{-3mm}\raggedcolumns\begin{multicols*}{2},
after = \end{multicols*}}

% FANCYHDR
\makeatletter

 \pagestyle{empty}
 \fancyhf{}
\fancyfoot[RO,LE]{\fontfamily{ugq}\autofontsize{11pt}\selectfont
      \color{purple} \bfseries\thepage}
\fancyfoot[RE]{
      \color{purple}  \leftmark}
\fancyfoot[LO]{
      \color{purple}  \leftmark}
      \renewcommand{\headrulewidth}{0pt}
\makeatother



% Commande de taille de police
\newcommand{\autofontsize}[1]{\fontsize{#1}{\dimexpr #1*12/10}}

 
\tikzstyle{mybox} = [fill=blue, very thick,
    rectangle, inner sep=10pt, inner ysep=15pt,yshift=1mm]
  \newcounter{cptexFiche}[section]

 

% FICHE D'EXERCICES
\definecolor{ao}{rgb}{0.0, 0.5, 0.0}

% commande annexe pour la difficulté des exercices (* = un peu plus dur, ** = 
%plus dur, *** = dur) ; la macro \replicate{4}{*} fournira **** (autrement dit, 
%imprime #1 fois #2)
\definecolor{amber}{rgb}{1.0, 0.75, 0.0}
\newcommand{\replicate}[2]{%
   \ifthenelse{#2=0}{}{#1\replicate{#1}{\number\numexpr#2-1 }}%
}
\newcommand{\difficulte}[1]{\replicate{\parbox{2.5mm}{
\begin{tikzpicture}
 \node[color=amber] {$\bigstar$};
\end{tikzpicture}}}{#1}\hspace{5pt}
}
\newenvironment{listeexo}
  {\setlength{\columnsep}{20pt}\begin{multicols*}{2}}
  {\end{multicols*}}
  
\newcommand{\sectionex}[1]{
\needspace{2cm}
\begin{center}\begin{tikzpicture}
    \draw[double,draw=purple]node [midway, draw=purple,chamfered rectangle,chamfered rectangle corners={north east, south west},text width=7cm,text centered,inner sep=0pt]{\bfseries   \textarabic{\sffamily \color{purple} #1}};
\end{tikzpicture}
\end{center}}



\newenvironment{exerciceFiche}[1][]{
\refstepcounter{cptexFiche}
\noindent
\parbox{0.4cm}{
\begin{tikzpicture}[blend group=overlay]
 \fill[fill=purple!20] (0,0) rectangle (0.55,0.55) node[midway,font=\large\sffamily,color=white] 
(A) {\bidicontour{black}{\color{white}{\thecptexFiche}}};
\fill[fill=purple ](0.4,0.55)
 rectangle (0.55,0)
 ;
  \fill[fill=purple](0,0.15)
 rectangle (0.55,0)
 ;
\end{tikzpicture}%
}\hspace{1mm} \ifx&#1&%
\else
    \fontfamily{ugq}\selectfont\color{myblue} \sffamily \RL{#1 }
\\[1mm]\normalfont\color{black}
\fi
}{\vspace{0.25\baselineskip}}
 %
 \usetikzlibrary{fadings, shadings}
\newcounter{fadcnt}\setcounter{fadcnt}{0}
\newcommand\fadingtext[3][]{%
\stepcounter{fadcnt}
     \begin{tikzfadingfrompicture}[name=fading letter\thefadcnt]
       \node[text=transparent!0,inner xsep=0pt,outer xsep=0pt,#1] {#3};
     \end{tikzfadingfrompicture}%
     \begin{tikzpicture}[baseline=(textnode.base)]
       \node[inner sep=0pt,outer sep=0pt,#1](textnode){\phantom{#3}}; 
       \shade[path fading=fading letter\thefadcnt,#2,fit fading=false]
       (textnode.south west) rectangle (textnode.north east);% 
     \end{tikzpicture}% 
}
\usetikzlibrary{calc}
\newbox\shbox
\tikzset{%
     path picture shading/.style={%
     path picture={%
%
\pgfpointdiff{\pgfpointanchor{path picture bounding box}{south west}}%
     {\pgfpointanchor{path picture bounding box}{north east}}%
\pgfgetlastxy\pathwidth\pathheight%
\pgfinterruptpicture%
      \global\setbox\shbox=\hbox{\pgfuseshading{#1}}%
    \endpgfinterruptpicture%
\pgftransformshift{\pgfpointanchor{path picture bounding box}{center}}%
\pgftransformxscale{\pathwidth/(\wd\shbox)}%
\pgftransformyscale{\pathheight/(\ht\shbox)}% \dp will (should) be 0pt
\pgftext{\box\shbox}%
%
       }
     }
}
\pgfdeclarehorizontalshading{rainbow}{10bp}{color(0bp)=(violet);
               color(1.6667bp)=(blue);
               color(3.3333bp)=(cyan);
               color(5bp)=(green);
               color(6.6667bp)=(yellow);
               color(8.3333bp)=(orange);
               color(10bp)=(red)}
               %%%%
 \def\tit[#1,#2,#3]{ 
 %
 \fancyhead[R]{
    \begin{tikzpicture}[remember picture,overlay]
    \draw[purple!20,line width=.07cm]($(current page.north)+(0,-1.4cm)$)--($(current page.south)+(0,+0cm)$);
     \fill[color=purple!20] ($(current page.north west) + 
(0cm,-1.3cm)$) rectangle ($(current page.north east) +(0cm,-1.4cm)$);
 \draw[ color=purple!50 ,line width=0.1cm] ($(current page.north west) + (0cm,0cm)$) 
 rectangle ($(current page.south east) + (0cm,+0cm)$);
 %           
%----------------------------------
    %  \node  at ($(current page.north) + (0cm,-0.7cm)$) (titre){};
%{
 %\fontfamily{ugq}\autofontsize{16pt}\bfseries\color{gray!20}  \textarabic{\ttfamily
%#2
%}}; 
\node [xshift=1mm,yshift=-1mm,,font=\bf\sffamily] (titre) at  
($(current page.north)+(0,-0.6cm)$)
{\color{gray!10}\bidicontour{purple}{\RL{ \fontfamily{ugq}\autofontsize{13pt}\ttfamily
#2
}}};
		\node[,font=\bf\sffamily ,text=black ] [left=0.5cm of titre.west] {\color{gray!10}\bidicontour{red}{\RL{#3 }}};
%
\node[,font=\bf\sffamily ,text=black]   [right=0.3cm of titre.east] {\color{gray!10}\bidicontour{red}{\RL{
#1
}}};
  %
            \end{tikzpicture}%
}
}
 %
 \fancyfoot[l]{%
\begin{tikzpicture}[remember picture, overlay]
\draw[purple!20,line width=.07cm,fill=white] (current page.south) circle (1em);
\node[anchor=south,text=purple] at ($(current page.south)-(0,.51mm)$) {\large\bf\thepage };
\end{tikzpicture}}
  \pagestyle{fancy}
\setlength{\headsep}{2cm}% defaut 25pt
\parindent=0pt
 \usepackage{fourier}
 \usepackage{pgfplots,tkz-euclide,tkz-tab,mathrsfs}
%
% \mathversion{bold}
% \definecolor{purple}{rgb}{0.0, 0.6, 2.0}
 \def\rr{\mathbb{R}}
 \def\ra#1{\mathbb{R}-\left\lbrace #1 \right\rbrace}
 \def\oi{ \left(O; \vec{i} , \vec{j}\right)}
 
 \def\exo#1{\begin{exerciceFiche}  
 #1
 \end{exerciceFiche}}
 \pgfplotsset{compat=1.11}
\setlength{\columnseprule}{0pt}
\usepackage{tikzsymbols}
\renewcommand{\columnseprulecolor}{\color{purple}}
 \DeclareMathSizes{10.95}{10}{7}{7}   % For size 10 text
