%# -*- coding: utf-8-unix -*-
%==================================================
%% sjtuthesis.cls for SJTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtuthesis}[2016/04/06 v0.9 Shanghai Jiao Tong University Template]
\def\version{v0.9}
\newif\ifsjtu@bachelor\sjtu@bachelorfalse
\newif\ifsjtu@master\sjtu@masterfalse
\newif\ifsjtu@doctor\sjtu@doctorfalse
\newif\ifsjtu@review\sjtu@reviewfalse
\newif\ifsjtu@submit\sjtu@submitfalse
\newif\ifsjtu@typeinfo \sjtu@typeinfotrue
\DeclareOption{notypeinfo}{\sjtu@typeinfofalse}
\DeclareOption{bachelor}{\sjtu@bachelortrue}
\DeclareOption{master}{\sjtu@mastertrue}
\DeclareOption{doctor}{\sjtu@doctortrue}
\DeclareOption{review}{\sjtu@reviewtrue}
\DeclareOption{submit}{\sjtu@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,UTF8,scheme=chinese]{ctexbook}
\ifsjtu@bachelor\relax\else
  \ifsjtu@master\relax\else
    \ifsjtu@doctor\relax\else
      \ClassError{sjtuthesis}%
      		{You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

%% sjtuthesis.cls segments
% 0. Import sjtuthesis.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
% 4. Draw the sjtuthesis

%==========
% Segment 0. Import sjtuthesis.cfg 
%==========

%% 导入 sjtuthesis.cfg 文件
\AtEndOfClass{\input{sjtuthesis.cfg}}


%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage[centering,a4paper,body={16cm,22cm}]{geometry} %设置版面
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{fontspec}
\RequirePackage{metalogo,doc}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{ccaption}
\RequirePackage[backend=biber, style=caspervector,utf8, bibencoding=utf8, sorting=none]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{wasysym}
\RequirePackage{listings}
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmic}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}

\colorlet{punct}{red!60!black}
\definecolor{background}{HTML}{EEEEEE}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}

\definecolor{lightgray}{rgb}{0.95, 0.95, 0.95}
\definecolor{darkgray}{rgb}{0.4, 0.4, 0.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}
\definecolor{editorGray}{rgb}{0.95, 0.95, 0.95}
\definecolor{editorOcher}{rgb}{1, 0.5, 0} % #FF7F00 -> rgb(239, 169, 0)
\definecolor{editorGreen}{rgb}{0, 0.5, 0} % #007C00 -> rgb(0, 124, 0)
% CSS
\lstdefinelanguage{CSS}{
  keywords={color,background-image:,margin,padding,font,weight,display,position,top,left,right,bottom,list,style,border,size,white,space,min,width, transition:, transform:, transition-property, transition-duration, transition-timing-function},	
  sensitive=true,
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]",
  alsoletter={:},
  alsodigit={-}
}

% JavaScript
\lstdefinelanguage{JavaScript}{
  morekeywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break},
  morecomment=[s]{/*}{*/},
  morecomment=[l]//,
  morestring=[b]",
  morestring=[b]'
}

\lstdefinelanguage{HTML5}{
  language=html,
  sensitive=true,	
  alsoletter={<>=-},	
  morecomment=[s]{<!-}{-->},
  tag=[s],
  otherkeywords={
  % General
  >,
  % Standard tags
	<!DOCTYPE,
  </html, <html, <head, <title, </title, <style, </style, <link, </head, <meta, />,
	% body
	</body, <body,
	% Divs
	</div, <div, </div>, 
	% Paragraphs
	</p, <p, </p>,
	% scripts
	</script, <script,
  % More tags...
  <canvas, /canvas>, <svg, <rect, <animateTransform, </rect>, </svg>, <video, <source, <iframe, </iframe>, </video>, <image, </image>
  },
  ndkeywords={
  % General
  =,
  % HTML attributes
  charset=, src=, id=, width=, height=, style=, type=, rel=, href=,
  % SVG attributes
  fill=, attributeName=, begin=, dur=, from=, to=, poster=, controls=, x=, y=, repeatCount=, xlink:href=,
  % CSS properties
  margin:, padding:, background-image:, border:, top:, left:, position:, width:, height:,
	% CSS3 properties
  transform:, -moz-transform:, -webkit-transform:,
  animation:, -webkit-animation:,
  transition:,  transition-duration:, transition-property:, transition-timing-function:,
  }
}

\lstset{%
  % General design
  backgroundcolor=\color{editorGray},
  basicstyle={\small\ttfamily},   
  frame=l,
  % line-numbers
  xleftmargin={0.75cm},
  numbers=left,
  stepnumber=1,
  firstnumber=1,
  numberfirstline=true,	
  % Code design
  identifierstyle=\color{black},
  keywordstyle=\color{blue}\bfseries,
  ndkeywordstyle=\color{editorGreen}\bfseries,
  stringstyle=\color{editorOcher}\ttfamily,
  commentstyle=\color{darkgray}\ttfamily,
  % Code
  language=HTML5,
  alsolanguage=JavaScript,
  alsodigit={.:;},	
  tabsize=2,
  showtabs=false,
  showspaces=false,
  showstringspaces=false,
  extendedchars=true,
  breaklines=true,
  % German umlauts
  literate=%
  {Ö}{{\"O}}1
  {Ä}{{\"A}}1
  {Ü}{{\"U}}1
  {ß}{{\ss}}1
  {ü}{{\"u}}1
  {ä}{{\"a}}1
  {ö}{{\"o}}1
}

\lstdefinelanguage{json}{
    basicstyle=\normalfont\ttfamily,
    numbers=left,
    numberstyle=\scriptsize,
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    breaklines=true,
    frame=lines,
    backgroundcolor=\color{background},
    literate=
     *{0}{{{\color{numb}0}}}{1}
      {1}{{{\color{numb}1}}}{1}
      {2}{{{\color{numb}2}}}{1}
      {3}{{{\color{numb}3}}}{1}
      {4}{{{\color{numb}4}}}{1}
      {5}{{{\color{numb}5}}}{1}
      {6}{{{\color{numb}6}}}{1}
      {7}{{{\color{numb}7}}}{1}
      {8}{{{\color{numb}8}}}{1}
      {9}{{{\color{numb}9}}}{1}
      {:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1},
}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
%==========

% Set the mainfont
\setmainfont{Times New Roman}

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{contentsname={\sjtu@contentsname}}
\ctexset{listfigurename={\sjtu@listfigurename}}
\ctexset{listtablename={\sjtu@listtablename}}
\floatname{algorithm}{\sjtu@label@algo}
\renewcommand{\listalgorithmname}{\sjtu@listalgorithmname}
\renewcommand{\lstlistingname}{\sjtu@value@listingname}
% Title Settings at the chapter Level
\ctexset{chapter={
	nameformat={\Large\bfseries},
	titleformat={\Large\bfseries},
	beforeskip={15\p@},
	afterskip={12\p@},
	}
}
% Title Settings at the section Level
\ctexset{section={
	format={\large\bfseries},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
	format={\bfseries\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in ccaption pacakge
\captiondelim{\ }
\captionnamefont{\kaishu\small}
\captiontitlefont{\kaishu\small}

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法的编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand\p@subfigure{\thefigure}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}

% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\sjtu@label@algo~}[chapter]
  \newtheorem{thm}{\sjtu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\sjtu@label@lem~}
  \newtheorem{prop}[thm]{\sjtu@label@prop~}
  \newtheorem{cor}[thm]{\sjtu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\sjtu@label@defn~}[chapter]
  \newtheorem{conj}{\sjtu@label@conj~}[chapter]
  \newtheorem{exmp}{\sjtu@label@exmp~}[chapter]
  \newtheorem{rem}{\sjtu@label@rem~}
  \newtheorem{case}{\sjtu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\sjtu@label@thm~}
  \newtheorem{blem}[thm]{\sjtu@label@lem~}
  \newtheorem{bprop}[thm]{\sjtu@label@prop~}
  \newtheorem{bcor}[thm]{\sjtu@label@cor~}
  \renewcommand{\proofname}{\bf\sjtu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions are to extend the LaTeX algorithmic 
% package with SWITCH statements and one-line structures.
% The extension is by 
%   Prof. Farn Wang 
%   Dept. of Electrical Engineering, 
%   National Taiwan University. 
% 
\newcommand{\SWITCH}[1]{\STATE \textbf{switch} (#1)}
\newcommand{\ENDSWITCH}{\STATE \textbf{end switch}}
\newcommand{\CASE}[1]{\STATE \textbf{case} #1\textbf{:} \begin{ALC@g}}
\newcommand{\ENDCASE}{\end{ALC@g}}
\newcommand{\CASELINE}[1]{\STATE \textbf{case} #1\textbf{:} }
\newcommand{\DEFAULT}{\STATE \textbf{default:} \begin{ALC@g}}
\newcommand{\ENDDEFAULT}{\end{ALC@g}}
\newcommand{\DEFAULTLINE}[1]{\STATE \textbf{default:} }
% 
% End of the LaTeX algorithmic package extension.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the sjtuthesis
%==========

\newcommand\classification[1]{\def\sjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\sjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\sjtu@value@confidential{#1}}
\newcommand\school[1]{\def\sjtu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\sjtu@value@chinesedegree{#1}}
\renewcommand\title[2][\sjtu@value@title]{%
  \def\sjtu@value@title{#2}
  \def\sjtu@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\sjtu@value@author{#1}}
\newcommand\advisor[1]{\def\sjtu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\sjtu@value@coadvisor{#1}}
\newcommand\major[1]{\def\sjtu@value@major{#1}}
\newcommand\submitdate[1]{\def\sjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\sjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\sjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\sjtu@value@chairman{#1}}


% sjtuspace
\newcommand\sjtuspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\sjtu@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\sjtufiledate{#1}%
  \def\sjtufileversion{#2}%
  \def\sjtufileinfo{#3}}%
\expandafter\ifx\csname ver@sjtuthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_sjtuthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@sjtuthesis.cls\endcsname}
\fi
\expandafter\sjtu@getfileinfo\reserved@a\relax? ? \relax\relax
\def\sjtu@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\sjtuunderline{\@ifnextchar[\sjtu@underline\CTEXunderline}

% “绘制”SJTU中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
\begin{figure}[!htp]
 \centering
 \includegraphics[angle=0,origin=br,width=13cm]{figure/sjtu}
\end{figure}
\heiti\zihao{-2}\sjtu@label@sjtu
\vskip 15pt
\textbf{\kaishu\zihao{1}\sjtu@label@statement}
\vskip 5pt
\heiti\zihao{-2}\sjtu@label@bacheloreng
\begin{figure}[!htp]
 \centering
 \includegraphics[angle=0,origin=br,width=4cm]{figure/sjtubadge}
\end{figure}
    \vskip 20pt
    \begin{tabular}{ll}
    \huge{\kaishu\sjtu@label@title} &\kaishu
\sjtuunderline[350pt]{\sjtu@value@title}
    \end{tabular}
    \vskip 5pt
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1}
    \begin{tabular}{lc}
      \kaishu\sjtu@label@author &\kaishu
      \sjtuunderline[150pt]{\sjtu@value@author}
    \\
      \kaishu\sjtu@label@studentnumber &\kaishu
      \sjtuunderline[150pt]{\sjtu@value@studentnumber}
    \\
      \kaishu\sjtu@label@advisor &\kaishu
      \sjtuunderline[150pt]{\sjtu@value@advisor}
    \\  
      \kaishu\sjtu@label@major &\kaishu
      \sjtuunderline[150pt]{\sjtu@value@major}
    \\  
      \kaishu\sjtu@label@institute &\kaishu
      \sjtuunderline[150pt]{\sjtu@value@institute}
    \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifsjtu@typeinfo
    \fi
    \cleardoublepage
  \fi
}


% English Title Page
\newcommand\englishtitle[1]{\def\sjtu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\sjtu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\sjtu@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\sjtu@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\sjtu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\sjtu@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\sjtu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\sjtu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\sjtu@value@englishmajor{#1}}
% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \sjtu@label@englishstatement} 
      \vspace{20pt} \vskip\stretch{1}
      {\huge\sjtu@value@englishtitle \vskip 1pt}
      \vskip \stretch{1}
    \ifsjtu@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\sjtu@value@englishauthor} 
      \vskip \stretch{1}
      {\normalfont\zihao{4}\sjtu@label@englishadvisor} 
      \vskip 2pt
      {\normalfont\zihao{4}\sjtu@value@englishadvisor} 
      \vskip 5pt
      \ifx\sjtu@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\sjtu@label@englishcoadvisor} 
        \vskip 2pt
        {\normalfont\zihao{4}\sjtu@value@englishcoadvisor} 
        \vskip \stretch{2}
      \fi
    \fi 
    \normalfont\sjtu@value@englishinstitute \vskip 30pt
    \normalfont\sjtu@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bf\zihao{3} \sjtu@value@school}\\
  	{\bf\zihao{3} \sjtu@label@original}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@label@originalcontent\par}
  \vskip 60pt
  \hspace{13em}\sjtu@label@authorsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\sjtu@label@originalDate\hspace{1em}
  \cleardoublepage
}


% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bf\zihao{3} \sjtu@value@school}\\
  	{\bf\zihao{3} \sjtu@label@authorization}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@label@authorizationcontent\par}
  \vskip 60pt
  \sjtu@label@authorsign\hrulefill\hspace{3em}\sjtu@label@Supervisorsign\hrulefill
  \vskip 15pt
  \sjtu@label@originalDate\hfill\hspace{3em}\sjtu@label@originalDate
  \cleardoublepage
}

% fancyhdr页眉页脚设置
\ifsjtu@bachelor
	% 本科学位论文页眉页脚设置
	%% 正文页眉页脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries\pageref{LastPage}}~页}
	  \renewcommand{\headheight}{32pt}
	}
	%% 开章页页眉页脚
	\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
	  \fancyhf{}%
	  \fancyhead[L]{\nouppercase{\small\kaishu\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bf\thepage}~页\,共~{\bf\pageref{LastPage}}~页}
	  \renewcommand{\headheight}{32pt}
	}
\else
	% 研究生学位论文页眉页脚设置
	\if@twoside
	  %% 正文页眉页脚
	  \fancypagestyle{main}{
	    \fancyhead[LO, RE]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	    \fancyhead[RO]{\nouppercase{\small\kaishu\leftmark}}
	    \fancyhead[LE]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	    \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	  %% 开章页页眉页脚
	  \fancypagestyle{plain}{
	    \fancyhf{}
	    \fancyhead[LO,RE]{\nouppercase{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}}
	    \fancyhead[RO]{\nouppercase{\small\kaishu\leftmark}}
	    \fancyhead[LE]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	    \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	\else
	%% 正文页
	\fancypagestyle{main}{
	  \fancyhead[L]{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}
	  \fancyhead[R]{\nouppercase{\small\kaishu\leftmark}}
	  \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fancypagestyle{plain}{
	  \fancyhf{}
	  \fancyhead[L]{\nouppercase{\small\kaishu\sjtu@value@school\sjtu@value@chinesedegree\sjtu@label@thesis}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\leftmark}}
	  % \fancyhead[L]{\small {\it\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fi
\fi

% 中英文摘要
\newenvironment{abstract}{\chapter*{\sjtu@value@title\vskip 30pt\sjtu@label@abstract}\markboth{\sjtu@label@abstract}{}\vskip 15pt}{}
\newcommand\keywords[1]{\vskip 15pt\vspace{2ex}\noindent{\bf\large \sjtu@label@keywords} #1}
\newenvironment{englishabstract}{\chapter*{\sjtu@value@englishtitle\vskip 20pt\bfseries \sjtu@label@englishabstract}\markboth{\sjtu@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@englishkeywords} #1}

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newenvironment{publications}[1]
     {\chapter{\sjtu@label@publications}%
      \@mkboth{\MakeUppercase\sjtu@label@publications}
              {\MakeUppercase\sjtu@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\sjtu@label@patents}%
      \@mkboth{\MakeUppercase\sjtu@label@patents}
              {\MakeUppercase\sjtu@label@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\sjtu@label@projects}%
      \@mkboth{\MakeUppercase\sjtu@label@projects}
              {\MakeUppercase\sjtu@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}
  {\chapter{\sjtu@label@resume}}
  {}
  
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}
   
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}
   
\renewenvironment{thanks}
  {\chapter{\sjtu@label@thanks}}
  {}

\newenvironment{summary}
{\chapter*{\sjtu@label@summary\markboth{\sjtu@label@summary}{}}\addcontentsline{toc}{chapter}{\sjtu@label@summary}
}{}

\newenvironment{symbolnote}{\chapter{\sjtu@label@symbolnote}}{} 

\endinput


%%
%% End of file `sjtuthesis.cls'.

