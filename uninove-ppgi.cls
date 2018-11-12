% ----------------------------------------- % 
%
%	Esta classe contem o modelo latex de 
%	dissertação utilizado pela uninove
%	no programa de pós graduação do
%	PPGI.
%	
%	Alguns parametros foram baseados no
%	modelo latex do IME USP, desenvolvido
% 	pelo professor Jesús P. Mena-Chalco :
%
%	http://latex-exemplo.blogspot.com.br/2015/11/modelo-latex-para-dissertacoes-e-teses.html	
%
% ----------------------------------------- % 

\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,oneside,a4paper]{book}

% ----------------------------------------- % 
%
%	Recebendo fonte padrão 
%
%	Chamada : 
%
%		\documentclass[courier]{uninove-ppgi} -> fonte courier
%
%		\documentclass[times]{uninove-ppgi} -> fonte times
%
% ----------------------------------------- % 

\newif\iftimes@font

\newif\ifcourier@font

\DeclareOption{times}{\times@fonttrue \courier@fontfalse}

\DeclareOption{courier}{\courier@fonttrue \times@fontfalse}

% operação default de fonte
\ExecuteOptions{courier}

\ProcessOptions\relax

% opção de fonte (courier ou times)
\ifcourier@font

	\RequirePackage{courier}
	
\else

	\RequirePackage{times}
	
\fi

% ----------------------------------------- % 
%
%	Carregando pacotes
%
% ----------------------------------------- % 

\RequirePackage[T1]{fontenc}
\RequirePackage[brazil]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[pdftex]{graphicx}           % usamos arquivos pdf/png como figuras
\RequirePackage{setspace}                   % espaçamento flexível
\RequirePackage{indentfirst}                % indentação do primeiro parágrafo
\RequirePackage{imakeidx}                    % índice remissivo
\RequirePackage[nottoc]{tocbibind}          % acrescentamos a bibliografia/indice/conteudo no Table of Contents
\RequirePackage{type1cm}                    % fontes realmente escaláveis
\RequirePackage{listings}                   % para formatar código-fonte (ex. em Java)
\RequirePackage{titletoc}
\RequirePackage[fixlanguage]{babelbib}
\RequirePackage[font=small,format=plain,labelfont=bf,up,textfont=it,up]{caption}
\RequirePackage[usenames,svgnames,dvipsnames]{xcolor}
\RequirePackage[a4paper,top=3cm,bottom=2.0cm,left=3cm,right=2.0cm]{geometry} % margens
\RequirePackage[hyphens,spaces,obeyspaces]{url}
\RequirePackage[pdftex,plainpages=false,pdfpagelabels,pagebackref,colorlinks=true,citecolor=DarkGreen,linkcolor=NavyBlue,urlcolor=DarkRed,filecolor=green,bookmarksopen=true]{hyperref} % links coloridos
\RequirePackage[all]{hypcap} % soluciona o problema com o hyperref e capitulos   
\RequirePackage[alf, abnt-etal-list=0]{abntex2cite} % Pacote para citações no padrão abnt 6023 
\RequirePackage{amssymb} % matemática
\RequirePackage{amsmath} % matemática
\RequirePackage{amsthm} % matemática
\RequirePackage{mathtools} % matemática     
\RequirePackage{tikz,tikz-3dplot} % tikz 
\RequirePackage{pgfplots} % gráficos
\RequirePackage{pgfgantt} % gráficos de Gantt
\RequirePackage{capt-of} % tikz 
\RequirePackage{titlesec} % chapter, section, subsection...
\RequirePackage[titles]{tocloft} % ajuste de espaçamentos de lista de tabelas e figuras
\RequirePackage{fancyhdr} % header das páginas (padrão baseado no template do IME-USP)
\RequirePackage{verbatim} % comentários longos por meio do enviromment comment
\RequirePackage{enumerate} % modificar estilo do ambiente enumerate
\RequirePackage{tabularx}
\RequirePackage[portuguese, ruled, vlined, linesnumbered]{algorithm2e} % algoritmos e pseudocódigos
\RequirePackage{subcaption}

% ----------------------------------------- % 
%
%	Algumas configurações de pacotes e outros 
%
% ----------------------------------------- % 

%
%	{algorithm2e}
%

\SetInd{0.5cm}{0.1cm}

%
%	{tikz}
%

\usetikzlibrary{arrows,shapes,backgrounds,fit,trees,positioning,calc}

%
% 	{titlesec}
%

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4} % for subsubsection

\titleformat{\chapter}[display] 
		{\normalfont\scshape}
		{\titlerule\vspace{6pt}\filleft\chaptertitlename~\thechapter}
		{0pt}
		{\Large\filleft}
		[\vspace{3pt}\titlerule]

\titlespacing*{\chapter}{0pt}{-30pt}{6mm}

\titleformat{\section}
		{\normalsize\scshape\bfseries}
		{\thesection~}
		{2pt}
		{}

\titlespacing*{\section}{0pt}{6mm}{6mm}

\titleformat{\subsection}
		{\normalsize\scshape}
		{\thesubsection~}
		{2pt}
		{}

\titlespacing*{\subsection}{0pt}{6mm}{6mm}

\titleformat{\subsubsection}
		{\normalsize}
		{\thesubsubsection~}
		{2pt}
		{}

\titlespacing*{\subsubsection}{0pt}{6mm}{6mm}

%
%	{tocloft}
%

\cftsetindents{figure}{0em}{2em}
\cftsetindents{table}{0em}{2em}

% 
%	{fancyhdr}
%

\pagestyle{fancy}

\fancyhf{}

\fancyheadoffset{0cm}

\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

\fancyhead[L]{\leftmark}
\fancyhead[R]{\thepage}

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}

\fancypagestyle{plain}{%
   \fancyhf{}%
   \fancyhead[R]{\thepage}%
}

% 
%	{amsthm}
%

\theoremstyle{definition}
\newtheorem{definition}{Definição}[chapter]

\newenvironment{definicao}[1]
	{\begin{definition}[#1]}
	{\end{definition}}


\newtheorem{proposition}{Proposição}[chapter]

\newenvironment{proposicao}
	{\begin{proposition}\itshape}
	{\end{proposition}}
	
\newenvironment{prova}
	{\noindent \textbf{Prova:}}
	{}

\newtheorem{theorem}{Teorema}[chapter]

\newenvironment{teorema}[1]
	{\begin{theorem}[#1]\itshape}
	{\end{theorem}}

%
%	Novos operadores matemáticos
%

\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}

%
%	Path de imagens
%

\graphicspath{{./figuras/}}

%
%  Links das citações para as referências
%

\renewcommand*{\backreflastsep}{, }
\renewcommand*{\backreftwosep}{, }
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{{\tiny%
    \ifcase #1 Not cited.%
          \or Citado na p\'{a}g.~#2.%
          \else Citado na p\'{a}g. #2.%
    \fi%
    }}

%
%  Espaçamento e fonte
%

\onehalfspacing

\fontsize{60}{62}\usefont{OT1}{cmr}{m}{n}{\selectfont}

%
%	Tirando espaço superior extra das figuras
%

\makeatletter
	\setlength{\@fptop}{0pt}
\makeatother

%
%   Arruma o espaço: id est (i.e.) e exempli gratia (e.g.) 
%

\frenchspacing                        

%
%	URL com o mesmo estilo do texto e não mono-spaced
%

\urlstyle{same}                        

%
%	Para não permitir espaços extra no texto
%

\raggedbottom                          

% ----------------------------------------- % 
%
%	Variáveis para criar capa e folha de rosto
%
%	Atenção : Sempre configure todas as variáveis antes de
%	          chamar os métodos.
%
% ----------------------------------------- % 

\newcommand{\Universidade}[1]{
	\newcommand{\universidade}{#1}
}

\newcommand{\Programa}[1]{
	\newcommand{\programa}{#1}
}

\newcommand{\Autor}[1]{
	\newcommand{\autor}{#1}
}

\newcommand{\Titulo}[1]{
	\newcommand{\titulo}{#1}
}

\newcommand{\Ano}[1]{
	\newcommand{\ano}{#1}
}

\newcommand{\Orientador}[1]{
	\newcommand{\orientador}{#1}
}

\newcommand{\Titulacao}[1]{
	\newcommand{\titulacao}{#1}
}

\newcommand{\Tipoexame}[1]{
	\newcommand{\tipoexame}{#1}
}

% ----------------------------------------- % 
%	
%	Comando para gerar a capa 
%
% ----------------------------------------- %

\newcommand{\capa}{%

	\begin{center}

		\thispagestyle{empty}
	
		\textbf{%
			\universidade\\
			\programa\\
			\vspace*{2cm}
			\autor\\
			\vspace*{4cm}
			\titulo\\
			\vspace*{\stretch{3}}
			São Paulo\\
			\ano
		}
	
	\end{center}}%

% ----------------------------------------- %
%	
%	Comando para gerar a folha de rosto
%
% ----------------------------------------- %
	
\newcommand{\folharosto}{%

	\begin{center}	

		\newpage		
	
		\thispagestyle{empty}	
	
		\textbf{	
			\autor\\			
			\vspace*{6cm}		
			\titulo\\		
		}
			
		\vspace*{2cm}
			
		\begin{flushright}
		
			\begin{minipage}{.5\textwidth} 		
			Exame de \tipoexame{} apresentado a Universidade Nove de Julho - UNINOVE, como parte dos requisitos para a obtenção do título de \titulacao{} em Informática e Gestão do Conhecimento.
			\end{minipage}
			
			\vspace*{1cm}
			Prof. Orientador: \orientador
			
		\end{flushright}
					
		\textbf{
			\vspace*{\stretch{3}}\\
			São Paulo\\
			\ano
		}
		
	\end{center}}%

% ----------------------------------------- % 
%
%	Variáveis para criar palavras-chaves e keywords
%
%	Atenção : Sempre configure todas as variáveis antes de
%	          chamar os métodos.
%
% ----------------------------------------- % 

\newcommand{\PalavrasChave}[1]{%
	\newcommand{\palavraschave}{#1}	
}

\newcommand{\KeyWords}[1]{%
	\newcommand{\keywords}{#1}	
}

% ----------------------------------------- %
%
%	Resumo e abstract da tese
%
% ----------------------------------------- %


\newenvironment{resumo}
	{\chapter*{Resumo}\thispagestyle{empty}}
	{~\\ \noindent \textbf{Palavras-chave}: \palavraschave}

\newenvironment{abstract}
	{\chapter*{Abstract}\thispagestyle{empty}}
	{~\\ \noindent \textbf{Keywords}: \keywords}
	
	
% ----------------------------------------- %
%
%	Agradecimentos
%
% ----------------------------------------- %


\newenvironment{agradecimentos}
	{\chapter*{Agradecimentos}\thispagestyle{empty}}
	{}

% ----------------------------------------- %
%
%	Resumo do capítulo
%
% ----------------------------------------- %
	
\newenvironment{resumocapitulo}
	{\begin{center}
	\begin{minipage}{0.85\textwidth}
	\textbf{Resumo do capítulo}\\\itshape}
	{\end{minipage}
	\end{center}}
	
% ----------------------------------------- %
%
%	Abreviaturas
%
% ----------------------------------------- %

\newenvironment{listaabreviaturas}
	{\chapter*{Lista de Abreviaturas}
	\thispagestyle{empty}
	\addcontentsline{toc}{chapter}{Lista de Abreviaturas}
	\markboth{\MakeUppercase{Lista de Abreviaturas}}{\MakeUppercase{Lista de Abreviaturas}}
	\begin{tabular}{lp{0.8\textwidth}}\small}
	{\end{tabular}}

% ----------------------------------------- %
%
%	Símbolos (não adicione espaços extras dentro dos )
%
% ----------------------------------------- %

\newcommand{\simbolos}[2]{%
	\section*{#1}	
	\begin{tabular}{lp{0.8\textwidth}}\small
	  #2
	\end{tabular}%
}%

\newenvironment{listasimbolos}
	{\chapter*{Lista de Símbolos}
	\thispagestyle{empty}
	\addcontentsline{toc}{chapter}{Lista de Símbolos}
	\markboth{\MakeUppercase{Lista de Símbolos}}{\MakeUppercase{Lista de Símbolos}}}
	{}

% ----------------------------------------- %
%
%	Links coloridos
%
% ----------------------------------------- %

\newcommand{\drawlink}[3]{%
{\hypersetup{linkcolor=#1}\hyperref[#2]{#3}\hypersetup{linkcolor=NavyBlue}}%
}

% ----------------------------------------- %
%
%	Fabrica comandos com o nome passado
%	para ser utilizado como link invisível
%
% ----------------------------------------- %

\newcommand{\factorylinks}[3]{%
\newcommand{#1}{\hypersetup{linkcolor=black}\hyperref[#2]{#3}\hypersetup{linkcolor=NavyBlue}}
}

% ----------------------------------------- %
%
%	Citar a fonte de figuras
%
% ----------------------------------------- %

\newcommand{\fonte}[1]{%
{	
	\fontsize{10pt}{\baselineskip}\selectfont
	Fonte : #1
}
}

\endinput