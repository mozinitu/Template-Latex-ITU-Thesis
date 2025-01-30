\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{itutez}[2025/01/31]

\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{final}{\PassOptionsToClass{final}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{report}}

\DeclareOption{titlepage}{\ClassWarning{itutez}{Title page always generated. Option ignored.}}
\DeclareOption{notitlepage}{\ClassWarning{itutez}{Option 'notitlepage' not available for thesis.}}
\DeclareOption{twoside}{\ClassWarning{itutez}{Option 'twoside' not available for thesis.}}
\DeclareOption{twocolumn}{\ClassWarning{itutez}{Option 'twocolumn' not available for thesis.}}
\DeclareOption{landscape}{\ClassWarning{itutez}{Option 'landscape' not available for thesis.}}
\DeclareOption{legalpaper}{\ClassWarning{itutez}{Option 'legalpaper' not available for thesis.}}
\DeclareOption{a4paper}{\ClassWarning{itutez}{Option 'a4paper' not available for this class.}}
\DeclareOption{a5paper}{\ClassWarning{itutez}{Option 'a5paper' not available for this class.}}
\DeclareOption{executivepaper}{\ClassWarning{itutez}{Option 'executivepaper' not available.}}
\DeclareOption{b5paper}{\ClassWarning{itutez}{Option 'b5paper' not available for this class.}}
\DeclareOption{letterpaper}{\ClassWarning{itutez}{Option 'letterpaper' superfluous. Ignored.}}
\DeclareOption{onecolumn}{\ClassWarning{itutez}{Option 'onecolumn' superfluous. Ignored.}}
\DeclareOption{oneside}{\ClassWarning{itutez}{Option 'oneside' superfluous. Ignored.}}

%====================================== ITUTEZ CLASS OPTIONS ======================================
% LANGUAGE:
\newif\if@yazaryil
\@yazaryilfalse % default to numbered cite
\DeclareOption{yazaryil}{\@yazaryiltrue}
\DeclareOption{numarali}{\@yazaryilfalse}
% LANGUAGE:
\newif\if@ingilizce
\@ingilizcefalse % default to turkish
\DeclareOption{ingilizce}{\@ingilizcetrue}
\DeclareOption{turkce}{\@ingilizcefalse}
% DEGREE:
\newif\if@doktora
\newif\if@yukseklisans
\newif\if@lisans
\@doktoratrue\@yukseklisansfalse\@lisansfalse % default to PhD
\DeclareOption{doktora}{\@doktoratrue}
\DeclareOption{yukseklisans}{\@yukseklisanstrue\@doktorafalse}
\DeclareOption{lisans}{\@lisanstrue\@doktorafalse}
% PRINT TYPE:
\newif\if@onluarkali
\@onluarkalitrue % default to twoside
\DeclareOption{onluarkali}{\PassOptionsToClass{twoside}{report}\@onluarkalitrue}
\DeclareOption{tekyonlu}{\PassOptionsToClass{oneside}{report}\@onluarkalifalse}
% COVER TYPE:
\newif\if@cilt
\@cilttrue % default to hardcopy
\DeclareOption{bez}{\@cilttrue}
\DeclareOption{dijital}{\@ciltfalse}
% INSTITUTE- FOR GRADUATE DEGREES:
\newif\if@bilisim
\newif\if@avrasya
\newif\if@lisansustu
\newif\if@sosyalbilimler
\newif\if@enerji
\@lisansustutrue % default to graduate school
\DeclareOption{bilisim}{\@bilisimtrue\@lisansustufalse}
\DeclareOption{avrasya}{\@avrasyatrue\@lisansustufalse}
\DeclareOption{lisansustu}{\@lisansustutrue}
\DeclareOption{sosyalbilimler}{\@sosyalbilimlertrue\@lisansustufalse}
\DeclareOption{enerji}{\@enerjitrue\@lisansustufalse}
% FACULTY - FOR UNDERGRADUATE DEGREES:
\newif\if@ucakuzay
\newif\if@elektrikelektronik
\newif\if@makina
\DeclareOption{ucakuzay}{\@ucakuzaytrue\@lisansustufalse}
\DeclareOption{elektrikelektronik}{\@elektrikelektroniktrue\@lisansustufalse}
\DeclareOption{makina}{\@makinatrue\@lisansustufalse}
\ProcessOptions
%=================================== LOADING CLASS AND PACKAGES =====================================
% \LoadClass[a4paper,onecolumn,12pt]{report}
\LoadClass[12pt]{report}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc} % Türkçe karakter girebiliriz
\RequirePackage{mathptmx} % MS Times font
\RequirePackage{titlesec}
% \RequirePackage[showframe,showcrop]{geometry}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}\hypersetup{hidelinks}
\RequirePackage{xcolor}
\RequirePackage{pdflscape} 
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}
\RequirePackage[normalem]{ulem}
\RequirePackage[hang]{caption}
\RequirePackage[list=true]{subcaption} 
\RequirePackage{amssymb,amsmath,amsbsy}
\RequirePackage{bm} % bold math symbols
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage[bottom,multiple]{footmisc}
\RequirePackage{calc}
\RequirePackage{booktabs}
\RequirePackage{multirow}
% Bibliography
\if@yazaryil
\RequirePackage[sort&compress]{natbib} 
\else
\RequirePackage[numbers,square,sort&compress]{natbib} 
\fi

%============================== SETTINGS BETWEEN CONTENTS AND CHAPTERS ==============================

\newif\if@dedication  % Ithaf var mı?
\@dedicationfalse % Default = False         

\newif\if@foreword  % Onzoz var mı?
\@forewordfalse % Default = False

\newif\if@symbols % Sembol Listesi Olsun mu?
\@symbolsfalse % Default = False

\newif\if@abbreviations % Kisaltma Listesi Olsun mu?
\@abbreviationsfalse % Default = False

\newif\if@listoftables % Tablo Listesi Olsun mu?
\@listoftablestrue % Default = Var

\newif\if@listoffigures % Sekil Listesi Olsun mu?
\@listoffigurestrue % Default = Var

\newif\if@appendix % Appendix will be enabled by \eklerkapak or \eklerbolum
\@appendixfalse 

%====================================== MAIN COMMANDS ====================================== 

\newcommand*{\baslik}[1]{%
  \ifx\relax#1\relax
  \else
  \gdef\th@baslik{#1}
  \fi}

\newcommand*{\baslikcilt}[3]{% 
  \ifx\relax#1\relax
  \else
  \gdef\th@baslikbir{#1}
  \fi
  \gdef\th@baslikiki{#2}
  \gdef\th@baslikuc{#3}
}

\renewcommand*{\title}[1]{%
  \ifx\relax#1\relax
  \else
  \gdef\th@title{#1}
  \fi}

\newcommand*{\titlecover}[3]{%
  \ifx\relax#1\relax
  \else
  \gdef\th@titleone{#1}
  \fi
  \gdef\th@titletwo{#2}
  \gdef\th@titlethree{#3}
}

\newcommand*{\yazar}[2]{%
  \ifx\relax#1\relax
  \else
    \ifx\relax#2\relax
    \else
    \gdef\th@isimsoyisim{#1 #2}
    \gdef\th@soyisimisim{#2, #1}
    \fi
  \fi
}

\newcommand*{\ogrencino}[1]{\gdef\th@ogrencino{#1}}

\newcommand*{\unvan}[1]{\gdef\th@unvan{#1}}

\newcommand*{\anabilimdali}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\th@anabilimdali{#1}
  \fi
  \gdef\th@department{#2}
}

\newcommand*{\program}[2]{
  \gdef\th@program{#1}
  \gdef\th@programme{#2}
}

\newcommand*{\ithaf}[1]{
  \@dedicationtrue
  \gdef\th@ithaf{#1}}

\newcommand{\danisman}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\th@danisman{#1}
  \fi
  \gdef\th@danismanuni{#2}
}

\newcommand{\advisor}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\th@advisor{#1}
  \fi
  \gdef\th@advisoruni{#2}
}

\newcommand*{\esdanisman}[2]{
  \gdef\th@esdanisman{#1}
  \gdef\th@esdanismanuni{#2}
}

\newcommand*{\coadvisor}[2]{
  \gdef\th@coadvisor{#1}
  \gdef\th@coadvisoruni{#2}
}

\newcommand*{\juriBir}[2]{
  \gdef\th@juribir{#1}
  \gdef\th@juribiruni{#2}
}

\newcommand*{\juriIki}[2]{
  \gdef\th@juriiki{#1}
  \gdef\th@juriikiuni{#2}
}

\newcommand*{\juriUc}[2]{
  \gdef\th@juriuc{#1}
  \gdef\th@juriucuni{#2}
}

\newcommand*{\juriDort}[2]{
  \gdef\th@juridort{#1}
  \gdef\th@juridortuni{#2}
}

\newcommand*{\juriBes}[2]{
  \gdef\th@juribes{#1}
  \gdef\th@juribesuni{#2}
}

\newcommand*{\tarih}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\th@tarih{#1}
  \fi
  \gdef\th@date{#2}
}

\newcommand*{\tarihkucuk}[2]{
  \gdef\th@tarihkucuk{#1}
  \gdef\th@datelower{#2}
}

\newcommand*{\tezteslimtarih}[2]{
  \gdef\th@tezteslimtarih{#1}
  \gdef\th@submissiondate{#2}
}

\newcommand*{\tezsavunmatarih}[2]{
  \gdef\th@tezsavunmatarih{#1}
  \gdef\th@defencedate{#2}
}

%==================================== NEW COMMANDS ARE DEFINED ========================================

% Tesekkur, symbol lists, and abbreviation lists were set to false earlier now they are all true 
\newcommand{\onsoz}[1]{\@forewordtrue\gdef\th@forewordstash{#1}}
\newcommand{\summary}[1]{\gdef\th@summarystash{#1}}
\newcommand{\ozet}[1]{\gdef\th@ozetstash{#1}}
\newcommand{\semboller}[1]{\@symbolstrue\gdef\th@symbolsstash{#1}}
\newcommand{\kisaltmalar}[1]{\@abbreviationstrue\gdef\th@abbreviationsstash{#1}}
\newcommand{\ozgecmis}[1]{\gdef\th@resumestash{#1}}
\newcommand{\sirt}[1]{\gdef\th@sirtstash{#1}}
\newcommand{\eklerkapak}[1]{\@appendixtrue\gdef\th@appendixcoverstash{#1}}
\newcommand{\eklerbolum}[1]{\@appendixtrue\gdef\th@appendixstash{#1}}


%==================== WARNINGS IF SOME IMPORTANT PARTS ARE MISSING WHEN COMPILED ======================

\newcommand*{\th@baslik}{
     \ClassError{itutez}{*** You must specify BASLIK! ***}
     {Use the \protect\baslik{} command in the preamble.}}

\newcommand*{\th@title}{
     \classerror{itutez}{*** you must specify the TITLE! ***}
     {use the \protect\title{}{}{} command in the preamble.}}

\newcommand*{\th@baslikbir}{
     \ClassError{itutez}{*** You must specify BASLIK CILT! ***}
     {Use the \protect\baslikcilt{}{}{} command in the preamble.}}

\newcommand*{\th@titleone}{
     \classerror{itutez}{*** you must specify the TITLE COVER! ***}
     {use the \protect\titlecover{}{}{} command in the preamble.}}

\newcommand*{\th@tarih}{
    \ClassError{itutez}{*** You must specify the DATE! ***}
    {Use the \protect\tarih{}{} command in the preamble.}}

\newcommand*{\th@danisman}{
    \ClassError{itutez}{*** You must specify the DANISMAN! ***}
    {Use the \protect\danisman{}{} command in the preamble.}}

\newcommand*{\th@advisor}{
    \ClassError{itutez}{*** You must specify the ADVISOR! ***}
    {Use the \protect\advisor{} command in the preamble.}}

\newcommand*{\th@isimsoyisim}{
    \ClassError{itutez}{*** You must specify the AUTHOR! ***}
    {Use the \protect\yazar{} command in the \MessageBreak
    preamble. The first arg is your first name and \MessageBreak
    middle initial.  The second arg is your last name.}}

\newcommand{\th@anabilimdali}{
    \ClassError{itutez}{*** You must specify the ANABILIMDALI! ***}
    {Use the \protect\anabilimdali{}{} command in the \MessageBreak
    preamble. If your abstract runs over a page, \MessageBreak
    use the optional argument with the word 'long'.}
}

\newcommand{\th@summarystash}{
    \ClassError{itutez}{*** You must specify the SUMMARY! ***}
    {Use the \protect\summary{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@ozetstash}{
    \ClassError{itutez}{*** You must specify the OZET! ***}
    {Use the \protect\ozet{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@resumestash}{
    \ClassError{itutez}{*** You must specify the OZGEMIS! ***}
    {Use the \protect\ozgecmis{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@appendixcoverstash}{
    \ClassError{itutez}{*** You must specify the EKLER KAPAK! ***}
    {Use the \protect\eklerkapak{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@appendixstash}{
    \ClassError{itutez}{*** You must specify the EKLER! ***}
    {Use the \protect\eklerbolum{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

%====================================== INSTITUTE NAMES =========================================

\if@bilisim
  \gdef\th@enstitu{B\.il\.i\c s\.im Enst\. it\"us\"u}
  \gdef\th@enstitubir{BİLİŞİM ENSTİTÜSÜ}
  \gdef\th@enstituiki{}	
  \gdef\th@institute{Informatics Institute}
  \gdef\th@instituteone{INFORMATICS INSTITUTE}
  \gdef\th@institutetwo{} 							
\fi
\if@lisansustu
  \gdef\th@enstitu{L\.isansüstü Eğ\.it\.im Enst\.itüsü}
  \gdef\th@enstitubir{LİSANSÜSTÜ EĞİTİM ENSTİTÜSÜ}
  \gdef\th@enstituiki{}		
  \gdef\th@institute{Graduate School}
  \gdef\th@instituteone{GRADUATE SCHOOL}
  \gdef\th@institutetwo{}
\fi
\if@sosyalbilimler
  \gdef\th@enstitu{Sosyal B\.il\.imler Enst\.it\"us\"u}
  \gdef\th@enstitubir{SOSYAL BİLİMLER ENSTİTÜSÜ}
  \gdef\th@enstituiki{}
  \gdef\th@institute{The Graduate School of Arts and Social Sciences}       
  \gdef\th@instituteone{THE GRADUATE SCHOOL OF ARTS}            		
  \gdef\th@institutetwo{ANS SOCIAL SCIENCES} 					
\fi
\if@enerji
  \gdef\th@enstitu{Enerj\.i Enst\.it\"us\"u}
  \gdef\th@enstitubir{ENERJİ ENSTİTÜSÜ}
  \gdef\th@enstituiki{}		
  \gdef\th@institute{Institute of Energy}
  \gdef\th@instituteone{INSTITUE OF ENERGY}
  \gdef\th@institutetwo{} 									
\fi
\if@avrasya
  \gdef\th@enstitu{Avrasya Yer B\.il\.imler\.i Enst\.it\"us\"u}
  \gdef\th@enstitubir{AVRASYA YER BİLİMLERİ}
  \gdef\th@enstituiki{ENSTİTÜSÜ}		
  \gdef\th@institute{Eurasia Institute of Earth Sciences}
  \gdef\th@instituteone{EUROASIA INSTITUE OF}                   	
  \gdef\th@institutetwo{EARTH SCIENCES} 						
\fi

%======================================= FACULTY NAMES =========================================

\if@ucakuzay
  \gdef\th@enstitu{U\c cak ve Uzay B\.imler\.i Fak\"ultes\.i}
  \gdef\th@enstitubir{UÇAK VE UZAY BİLİMLERİ FAKÜLTESİ}
  \gdef\th@enstituiki{}
  \gdef\th@institute{Faculty of Aeronautics and Astronautics}		
  \gdef\th@instituteone{FACULTY OF AERONAUTICS AND}
  \gdef\th@institutetwo{ASTRONAUTICS}
\fi
\if@elektrikelektronik
  \gdef\th@enstitu{Elektr\.ik-Elektron\.ik Fak\"ultes\.i}
  \gdef\th@enstitubir{ELEKTRİK ELEKTRONİK FAKÜLTESİ}
  \gdef\th@enstituiki{}
  \gdef\th@institute{Faculty of Electrical and Electronics}
  \gdef\th@instituteone{FACULTY OF ELECTRICAL AND}
  \gdef\th@institutetwo{ELECTRONICS}
\fi
\if@makina		
  \gdef\th@enstitu{Mak\.ina Fak\"ultes\.i}				
  \gdef\th@enstitubir{MAKİNA FAKÜLTESİ}
  \gdef\th@enstituiki{}		
  \gdef\th@institute{Faculty of Mechanical Engineering}
  \gdef\th@instituteone{FACULTY OF MECHANICAL}
  \gdef\th@institutetwo{ENGINEERING}
\fi

%======================================= UNI NAMES =========================================

\gdef\th@universite{İSTANBUL TEKNİK ÜNİVERSİTESİ}
\gdef\th@university{ISTANBUL TECHNICAL UNIVERSITY}
\gdef\th@yildiz{\hbox{ }\raisebox{1.6pt}{\footnotesize$\bigstar$}\hbox{ }}

%========================= COVER PAGE NAMES ======================================================

\if@doktora
  \gdef\th@tezseviyesi{DOKTORA TEZİ}
  \gdef\th@thesislevel{Ph.D. THESIS}
\fi
\if@yukseklisans
  \gdef\th@tezseviyesi{YÜKSEK LİSANS TEZİ}
  \gdef\th@thesislevel{M.Sc. THESIS}
\fi
\if@lisans
  \gdef\th@tezseviyesi{BİTİRME ÇALIŞMASI}
  \gdef\th@thesislevel{GRADUATION THESIS}
\fi

\if@ingilizce
  \if@doktora
    \gdef\th@tezmezun{\th@thesislevel}
    \gdef\th@tezunvan{Ph.D.}
    \gdef\th@tezisim{dissertation}
  \fi
  \if@yukseklisans
    \gdef\th@tezmezun{\th@thesislevel}
    \gdef\th@tezunvan{M.Sc.}
    \gdef\th@tezisim{thesis}
  \fi
  \if@lisans
    \gdef\th@tezmezun{\th@thesislevel}
    \gdef\th@tezunvan{B.Sc.}
    \gdef\th@tezisim{graduation project}
  \fi
\else
  \if@doktora
  \gdef\th@tezmezun{\th@tezseviyesi}
  \gdef\th@tezunvan{Doktora}
  \gdef\th@tezisim{tezini}
  \fi
  \if@yukseklisans
  \gdef\th@tezmezun{\th@tezseviyesi}
  \gdef\th@tezunvan{Yüksek Lisans}
  \gdef\th@tezisim{tezini}
  \fi
  \if@lisans
  \gdef\th@tezmezun{\th@tezseviyesi}
  \gdef\th@tezunvan{Lisans}
  \gdef\th@tezisim{bitirme çalışmasını}
  \fi
\fi

\gdef\th@uniinstitute{\th@university\th@yildiz\th@instituteone}
\gdef\th@unienstitu{\th@universite\th@yildiz\th@enstitubir}

\if@ingilizce
  \gdef\th@tezunienstitu{\th@uniinstitute}
  \gdef\th@tezanabilimdali{\th@department}
  \gdef\th@tezprogram{\th@programme}
  \gdef\th@teztarih{\th@date}
  \gdef\th@teztarihkucuk{\th@datelower}
\else
  \gdef\th@tezunienstitu{\th@unienstitu}
  \gdef\th@tezanabilimdali{\th@anabilimdali}
  \gdef\th@tezprogram{\th@program}
  \gdef\th@teztarih{\th@tarih}
  \gdef\th@teztarihkucuk{\th@tarihkucuk}
\fi

%==================== CHAPTER VE SECTION NAMES ======================

\renewcommand\abstractname{SUMMARY}
\newcommand\ozetname{ÖZET}
\if@ingilizce
\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\listfigurename{LIST OF FIGURES}
\renewcommand\listtablename{LIST OF TABLES}
\renewcommand\bibname{REFERENCES}
\renewcommand\indexname{INDEX}
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}
\renewcommand\partname{Part}
\renewcommand\chaptername{CHAPTER}
\renewcommand\appendixname{APPENDIX}
\newcommand\symbolsname{SYMBOLS}
\newcommand\abbreviationsname{ABBREVIATIONS} 
\newcommand\resumename{CURRICULUM VITAE}
\newcommand\forewordname{FOREWORD}
\else
\renewcommand\contentsname{İÇİNDEKİLER}
\renewcommand\listfigurename{ŞEKİL LİSTESİ}
\renewcommand\listtablename{ÇİZELGE LİSTESİ}
\renewcommand\bibname{KAYNAKLAR}
\renewcommand\indexname{DİZİN}
\renewcommand\figurename{Şekil}
\renewcommand\tablename{Çizelge}
\renewcommand\partname{KISIM}
\renewcommand\chaptername{BÖLÜM}
\renewcommand\appendixname{EK}
\newcommand\symbolsname{SEMBOLLER}
\newcommand\abbreviationsname{KISALTMALAR} 
\newcommand\resumename{ÖZGEÇMİŞ}
\newcommand\forewordname{ÖNSÖZ}
\fi

%================================ SAYFA YAPISI İLE İLGİLİ TANIMLAMALAR ================================

\if@onluarkali
\geometry{a4paper,onecolumn,twoside,paperheight=297mm,paperwidth=210mm}
\else
\geometry{a4paper,onecolumn,paperheight=297mm,paperwidth=210mm}
\fi
\geometry{bindingoffset=0mm,foot=10mm}
\geometry{textheight=247mm,textwidth=145mm,top=25mm,left=40mm}
\raggedbottom

%=================================== HEADER SETTINGS ===================================

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt} 

%=================================== FOOTNOTE SETTINGS ==================================

\setlength{\skip\footins}{1cm}
\setlength\footnotemargin{.35em}
\addtolength{\footnotesep}{0mm}

%========================================= CAPTION SETTINGS =========================================

\DeclareCaptionLabelSeparator{colon}{\bfseries~:~}
\DeclareCaptionListFormat{itutable}{\begin{tabular}{@{}p{5.3em}@{}r}
  \bfseries\tablename#1~\thetable & \bfseries : \\ \end{tabular}}
\DeclareCaptionListFormat{itufigure}{\begin{tabular}{@{}p{5.3em}@{}r}
\bfseries\figurename#1~\thefigure & \bfseries : \\ \end{tabular}}
\DeclareCaptionLabelFormat{subfigure}{\figurename#1~\thefigure\alph{subfigure}}
\DeclareCaptionListFormat{itusubfigure}{\begin{tabular}{@{}p{5.3em}@{}r}
  \bfseries\figurename~#1\alph{subfigure} & \bfseries : \\ \end{tabular}}
\captionsetup[table]{listformat=itutable,labelfont=bf,labelsep=colon,position=top,justification=justified,skip=6pt}
\captionsetup[figure]{listformat=itufigure,labelfont=bf,labelsep=colon,position=bottom,justification=justified,skip=6pt}
\subcaptionsetup[figure]{listformat=itusubfigure,labelformat=subfigure,labelfont=bf,font=normalsize,labelsep=colon,position=bottom,justification=justified,skip=6pt}

%========================================= FLOAT SETTINGS =========================================

\setlength\floatsep{12\p@ \@plus .2\p@ \@minus .2\p@}
\setlength\textfloatsep{12\p@ \@plus .2\p@ \@minus .2\p@}
\setlength\intextsep{12\p@ \@plus .2\p@ \@minus .2\p@}

%========================================= EQUATION SETTINGS =========================================

% % Bolden equation numbers if required
% \let\theoldequation\theequation
% \renewcommand{\theequation}{\bfseries\theoldequation}

% \let\oldeqref\eqref
% \renewcommand{\eqref}[1]{\textbf{\oldeqref{#1}}}

%========================================= ENUMARATE SETTINGS ========================================

\renewcommand\labelitemi{\normalsize$\bullet$} 
\setlist{itemsep=0pt, topsep=0pt, parsep=6pt}
\setlength{\labelsep}{.5em} 
\setlength{\labelwidth}{1.5em}
\setlength{\leftmargin}{0mm}
\setlength{\leftmargini}{1.25em}
\setlength{\leftmarginii}{2.2em}
\setlength{\leftmarginiii}{2.2em}
\setlength{\leftmarginiv}{2.2em}
\setlength{\leftmarginv}{2.2em}
\setlength{\leftmarginvi}{2.2em}

%======================================= HYPHENATION SETTINGS =======================================

% Heceleme için hyphenpenalty değerini küçültebilirsiniz. 
% Değer küçüldükçe hecelemek isteyecek, değer büyükdükçe hecelemekten kaçacaktır.
\hyphenpenalty=5000
\exhyphenpenalty=5000
\widowpenalty=5000
\clubpenalty=5000

%============================ SETTINGS OF TITLE SPACINGS ONE INCH FROM TOP ============================

\newlength{\chaptopspace}
\setlength{\chaptopspace}{42pt}
\newlength{\titletopspace}
\setlength{\titletopspace}{42pt} 

%=============================== LINE SPACING SETTINGS =================================

\newlength{\defbaselineskip}
\setlength{\defbaselineskip}{\baselineskip} % Actually \baselineskip is 1.2 linespacing = 14.5pt
\newcommand{\singlespacing}{\setlength{\baselineskip}{\defbaselineskip}}  %\singlespacing = 1.0
\newcommand{\oneandonehalf}{\setlength{\baselineskip}{1.45\defbaselineskip}} %\oneandonehalf = 1.5

%============================= PARAGPRAPH SETTINGS ============================ 

\setlength{\parindent}{0pt} 
\setlength{\parskip}{6pt} 

\newlength{\oldparskip}    

\newlength{\loftparskip} % List of Figure/Table parskip
\setlength{\loftparskip}{0em}

\newlength{\tocparskip} % Table of Content parskip 
\setlength{\tocparskip}{0em}

%======================================  FONT SIZES SETTINGS ======================================= 


%================================ CHAPTER AND SECTION NUMBERING ===================================


%================================ TOC, LOT and LOF SETTINGS  ================================

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 2pt \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\hbox{.}$}
      \hfil\nobreak#2\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\hbox{.}$}
     \hfil\nobreak#5\par
    }%
  \fi}

\def\@loftline#1#2#3#4#5{
  \ifnum #1=\c@tocdepth \else
    \vskip \z@ \@plus.2\p@  
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M 
     \leavevmode
     \@tempdima #3\relax 
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \normalfont\leaders\hbox{$\m@th\hbox{.}$}
     \hfil\nobreak\bfseries#5\par
     }%
  \fi}

\renewcommand*\l@section{\@dottedtocline{1}{1.1em}{1.5em}} 
\renewcommand*\l@subsection{\@dottedtocline{2}{2.2em}{2.3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3.3em}{3.0em}} 		
\renewcommand*\l@table{\@loftline{1}{0em}{6em}}  					
\renewcommand*\l@figure{\@loftline{1}{0em}{6em}}
\renewcommand*\l@subfigure{\@loftline{1}{0em}{6em}}

%======================== SECTION, SUBSECTION, AND SUBSUBSECTION SETTINGS =============================

% Chapter settings
\renewcommand\chapter{\global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
  \BolumSagdaKalsinNolu
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}
    \if@appendix									
      \addcontentsline{toc}{section}{\appendixname\ \thechapter}										
	  \else
      \addcontentsline{toc}{chapter}{\thechapter.\hbox{ }#1}
	  \fi
  \else
    \relax
  \fi
  \chaptermark{#1}
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]
  \else
    \@makechapterhead{#2}
    \@afterheading
  \fi}

\def\@makechapterhead#1{%
  \vspace*{\chaptopspace}	
  {\parindent \z@ \raggedright \normalfont
  \ifnum \c@secnumdepth >\m@ne
    \if@appendix
      \vskip 6\p@ 
      \bfseries \appendixname\ \thechapter
      \par\nobreak
      \vskip 18\p@
    \else
      \bfseries \thechapter.\;\;#1\par\nobreak
      \vskip 12\p@ 
    \fi
  \fi}}

\def\@schapter#1{%
  \if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]%
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi}

\def\@makeschapterhead#1{%
  \vspace*{\chaptopspace}	
  {\parindent \z@ \raggedright
  \normalfont
  \interlinepenalty\@M
  \if@appendix
    \vskip 6\p@ 
    \bfseries #1\par\nobreak
    \vskip 18\p@ 
  \else
    \bfseries #1\par\nobreak
    \vskip 12\p@
  \fi}}

% \bottomskip-\oneandhalfspacing{6pt}-\parskip

\titleformat{\section}[block]{\normalsize\bfseries}{\thesection}{4pt}{}
\titlespacing*{\section}{0pt}{18pt}{6pt}

\titleformat{\subsection}[block]{\normalsize\bfseries}{\thesubsection}{4pt}{}
\titlespacing*{\subsection}{0pt}{12pt}{0pt}

\titleformat{\subsubsection}[block]{\normalsize\bfseries}{\thesubsubsection}{4pt}{}
\titlespacing*{\subsubsection}{0pt}{12pt}{0pt}

\newcommand{\subsubsubsection}[1]{\paragraph{#1}}
\titleformat{\paragraph}{\normalsize\bfseries}{\theparagraph}{4pt}{}
\titlespacing*{\paragraph}{0pt}{6pt}{-6pt}

%========================================== PAGE SETTINGS ===========================================

% Setting of even pages that do not have page numbers and odd page setting that does have a page number
\def\BolumSagdaKalsin{
  \clearpage
  \if@twoside
    \ifodd\c@page % Count the pag
    \else
      \null
      \thispagestyle{empty}
      \newpage
      \if@twocolumn
        \null
	      \newpage
      \fi
    \fi
  \fi
} 
% Setting of odd pages and even pages that do have a page number
\def\BolumSagdaKalsinNolu{
  \clearpage
  \if@twoside
    \ifodd\c@page
    \else
      \null
      \newpage
      \if@twocolumn
        \null
	      \newpage
      \fi
    \fi
  \fi
}

%======================================== OUTER COVER (DIŞ KAPAK) SETTINGS ==========================================

\newcommand*{\th@outercoverpage}{
    \thispagestyle{empty}
    \if@cilt 
    \else
      \if@doktora
        \begin{textblock*}{\textwidth}[0,0](40mm,10mm)
        \pagecolor{black}
        \color[rgb]{0.5529,0.4549,0.2941}
        \end{textblock*}
      \fi
      \if@yukseklisans
        \begin{textblock*}{\textwidth}[0,0](40mm,10mm)
        \pagecolor[rgb]{0,0.1569,0.3373}
        \color[rgb]{0.5529,0.4549,0.2941}
        \end{textblock*}
      \fi
    \fi

    \if@lisansustu
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@bilisim	
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@sosyalbilimler
    \begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
    \fi
    \if@avrasya
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@enerji
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@ucakuzay
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@elektrikelektronik
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@makina
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    	\singlespacing  			
    	\renewcommand{\ULdepth}{2.75pt} 	
    	\renewcommand{\ULthickness}{1.0pt} 
    	\centering
      \uline{\bfseries\th@tezunienstitu}	
	\end{textblock*}

  \if@ingilizce
    \ifx\th@institutetwo\@empty
    \else
      \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
      \singlespacing
      \renewcommand{\ULdepth}{2.75pt} 	
      \renewcommand{\ULthickness}{1.0pt} 	
      \centering
      \uline{\bfseries\th@institutetwo}
      \end{textblock*}
    \fi
  \else % Turkce
    \ifx\th@enstituiki\@empty
    \else
      \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
      \singlespacing
      \renewcommand{\ULdepth}{2.75pt} 	
      \renewcommand{\ULthickness}{1.0pt} 	
      \centering
      \uline{\bfseries\th@enstituiki}
      \end{textblock*}
    \fi
  \fi

  \if@ingilizce  
  \begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    \bfseries\singlespacing \th@titleone \\
    \ifx\th@titletwo\@empty
\else
      \bfseries\singlespacing \th@titletwo \\
      \ifx\th@titlethree\@empty
      \else
        \bfseries\singlespacing \th@titlethree \\
      \fi
    \fi
	\end{textblock*}
  \else % Turkce
  \begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    		\bfseries\singlespacing \th@baslikbir \\
        \ifx\th@baslikiki\@empty
        \else
		      \bfseries\singlespacing \th@baslikiki \\
          \ifx\th@baslikuc\@empty
          \else
            \bfseries\singlespacing \th@baslikuc \\
          \fi
        \fi
	\end{textblock*}
  \fi

	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
	    \centering
	    \bfseries \th@tezmezun  \\
	\end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
	    \centering
      \bfseries \th@isimsoyisim  \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
	   \centering
	   \bfseries \th@tezanabilimdali\\
    \end{textblock*}
 
 	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
 	   \centering
 	   \bfseries \th@tezprogram \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	   \centering
     \bfseries \th@teztarih \\
    \end{textblock*}

\vspace*{\fill}

\if@cilt
\else
\color{black}
\newpage
\nopagecolor
\fi
}

%======================================== ENGLISH INNER COVER SETTINGS =========================================== 
\newcommand*{\th@innercoverpage}{
  \BolumSagdaKalsin		
  \thispagestyle{empty}	
	\if@lisansustu
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@bilisim	
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@sosyalbilimler
		\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
	\fi
	\if@avrasya
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
  \if@enerji
  \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
  \fi
	\if@ucakuzay
		\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
	\fi
	\if@elektrikelektronik
		\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
	\fi
  \if@makina
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
  \fi
		\singlespacing  				
		\renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.0pt} 	
		\centering
		\uline{\bfseries\th@uniinstitute} \\ 
	\end{textblock*}

  \ifx\th@institutetwo\@empty
  \else
  \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\singlespacing
    \renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.0pt} 	
		\centering
		\uline{\bfseries\th@institutetwo}
	\end{textblock*}
  \fi
      
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    \bfseries\singlespacing \th@titleone \\
    \ifx\th@titletwo\@empty
    \else
      \bfseries\singlespacing \th@titletwo \\
      \ifx\th@titlethree\@empty
      \else
        \bfseries\singlespacing \th@titlethree \\
      \fi
    \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\bfseries \th@thesislevel  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\bfseries \th@isimsoyisim  \\
		\bfseries (\th@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\bfseries \th@department \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\bfseries \th@programme \\
	\end{textblock*}
	
  \begin{textblock*}{\textwidth}[0,0](40mm,230mm)
	  \centering
    \bfseries Thesis Advisor : \th@advisor \\
	\end{textblock*}

  \begin{textblock*}{\textwidth}[0,0](40mm,235mm)
	  \centering
    \ifx\th@coadvisor\@empty
    \else
	  \bfseries Co-Advisor : \th@coadvisor \\
    \fi
  \end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\bfseries \th@date \\
	\end{textblock*}
	
	\vspace*{\fill}

}

%===================================== TÜRKÇE İÇ KAPAK SETTINGS =======================================
\newcommand*{\th@ickapakpage}{	
  \BolumSagdaKalsin
  \thispagestyle{empty}
	\if@lisansustu
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@bilisim	
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@sosyalbilimler
		\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
	\fi
	\if@avrasya
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
  \if@enerji
  \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
  \fi
	\if@ucakuzay
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@elektrikelektronik
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
  \if@makina
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
  \fi
		\singlespacing  					
		\renewcommand{\ULdepth}{2.75pt} 
		\renewcommand{\ULthickness}{1.0pt}
		\centering
		\uline{\bfseries\th@unienstitu}
	\end{textblock*}

  \ifx\th@enstituiki\@empty
  \else
  \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\singlespacing
    \renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.0pt} 	
		\centering
		\uline{\bfseries\th@enstituiki}
	\end{textblock*}
  \fi
	
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    		\bfseries \singlespacing \th@baslikbir \\
        \ifx\th@baslikiki\@empty
        \else
		      \bfseries \singlespacing \th@baslikiki \\
          \ifx\th@baslikuc\@empty
          \else
            \bfseries \singlespacing \th@baslikuc \\
          \fi
        \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\bfseries \th@tezseviyesi  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\bfseries \th@isimsoyisim  \\
		\bfseries (\th@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\bfseries \th@anabilimdali \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\bfseries \th@program \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,230mm)
		\centering
		\bfseries Tez Danışmanı : \th@danisman \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,235mm)
		\centering
    \ifx\th@esdanisman\@empty
    \else
    \bfseries Eş Danışman : \th@esdanisman \\
    \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\bfseries \th@tarih \\
	\end{textblock*}
	
	\vspace*{\fill}
}

%========================================= APPROVAL (ONAY) PAGE SETTINGS =========================================
\newcommand{\th@approvalpage}{
\BolumSagdaKalsin
\hyphenpenalty=5000
\singlespacing
\if@ingilizce 			
	\begin{textblock*}{\textwidth}[0,0](40mm,50.5mm)
	\th@isimsoyisim , a \th@tezunvan\ student of ITU \th@institute\ student ID \th@ogrencino , successfully defended the \th@tezisim\ entitled ``\th@title'', which he/she prepared after fulfilling the requirements specified in the associated legislations, before the jury whose signatures are below.
  \end{textblock*}
 
  \begin{textblock*}{\textwidth}[0,0](40mm,100.5mm)
	\begin{tabular}{@{}p{33mm} l l}
		\bf{Thesis Advisor :}& \bf{\th@advisor} & 
		\hspace*{44pt} \hfill........................  \\	
		& \th@advisoruni  &  \\
    \ifx\th@coadvisor\@empty
    \else  
    &  &  \\
		&  &  \\
		\bf{Co-advisor :}& \bf{\th@coadvisor} & 
		\hspace*{44pt}\hfill........................   \\	
		& \th@coadvisoruni  &  \\
    \fi
		&  &  \\
		&  &  \\
		\bf{Jury Members :}& \bf{\th@juribir} & 
		\hspace*{44pt}	\hfill........................     \\	
		& \th@juribiruni  &  \\
		&  &  \\
		&  &  \\
    & \bf{\th@juriiki} & 
		\hspace*{44pt}\hfill........................  \\	
	 	& \th@juriikiuni  &  \\
		&  &  \\
	  &  &  \\	
    \ifx\th@juriuc\@empty
    \else
    & \bf{\th@juriuc} & 
		\hspace*{44pt}\hfill........................  \\	
		& \th@juriucuni  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\th@juridort\@empty
    \else
    &	\bf{\th@juridort} & 
		\hspace*{44pt}\hfill........................  \\
		& \th@juridortuni  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\th@juribes\@empty
    \else
    & \bf{\th@juribes} & 
		\hspace*{44pt}	\hfill........................\\
		& \th@juribesuni  &  \\
    \fi
		&  &  \\
		&  &  \\
	\end{tabular}
  \end{textblock*}

  \begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	\begin{tabular}{@{}l@{}c@{}l}
		\bf{Date of Submission} & \bf{ : } & \bf{\th@submissiondate} \\
		\bf{Date of Defense}    & \bf{ : } & \bf{\th@defencedate}    \\
	\end{tabular}
  \end{textblock*}

\else
	
  \begin{textblock*}{\textwidth}[0,0](40mm,50.5mm)
  İTÜ, \th@enstitu'nün \th@ogrencino\ numaralı \th@tezunvan\ öğrencisi \th@isimsoyisim , ilgili yönetmeliklerin belirlediği gerekli tüm şartları yerine getirdikten sonra hazırladığı ``\th@baslik'' başlıklı \th@tezisim\ aşağıdaki imzaları olan jüri önünde başarı ile sunmuştur.
  \end{textblock*}

\begin{textblock*}{\textwidth}[0,0](40mm,100.5mm)
	\begin{tabular}{@{}p{33mm} l l}
		\bf{Tez Danışmanı :}& \bf{\th@danisman} & 
		\hspace*{44pt}\hfill........................ \\
		& \th@danismanuni  &  \\
    \ifx\th@esdanisman\@empty
    \else
    &  &  \\
    &  &  \\
    \bf{Eş Danışman :}& \bf{\th@esdanisman} & 
    \hspace*{44pt}\hfill........................ \\
    & \th@esdanismanuni  &  \\
    \fi
		&  &  \\
		&  &  \\
		\bf{Jüri Üyeleri :}& \bf{\th@juribir} & 
		\hspace*{44pt}\hfill........................ \\
		& \th@juribiruni  &  \\
		&  &  \\
		&  &  \\
		& \bf{\th@juriiki} & 
		\hspace*{44pt}\hfill........................ \\
		& \th@juriikiuni  &  \\
		&  &  \\
		&  &  \\
    \ifx\th@juriuc\@empty
    \else
    & \bf{\th@juriuc} & 
    \hspace*{44pt}\hfill........................ \\
    & \th@juriucuni  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\th@juridort\@empty
    \else
    & \bf{\th@juridort} & 
		\hspace*{44pt}\hfill........................ \\
		& \th@juridortuni  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\th@juribes\@empty
    \else
    & \bf{\th@juribes} & 
		\hspace*{44pt}\hfill........................ \\
		& \th@juribesuni  &  \\
    \fi
		&  &  \\
		&  &  \\
	\end{tabular}
\end{textblock*}	

\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	\begin{tabular}{@{}l@{}c@{}l}
		\bf{Teslim Tarihi}  & \bf{ : } & \bf{\th@tezteslimtarih}   \\
		\bf{Savunma Tarihi} & \bf{ : } & \bf{\th@tezsavunmatarih} \\
	\end{tabular}
\end{textblock*}
	\fi
	\sloppy 
	\vspace*{\fill}
}

%================================== COVER PAGE SETTINGS ==================================  

\newcommand{\th@coverpage}{
    \if@ingilizce
      \th@outercoverpage
      \th@innercoverpage
      \th@ickapakpage
      \th@approvalpage
    \else
      \th@outercoverpage
      \th@ickapakpage
      \th@innercoverpage
      \th@approvalpage
    \fi
}

%======================================== DEDICATION PAGE SETTINGS =========================================
\newcommand{\th@dedicationpage}{
  \BolumSagdaKalsinNolu
	\vspace*{0.3\textheight}
  \begin{flushright}
	\textbf{\emph{\th@ithaf}}
  \end{flushright}
}

%======================================== FOREWORD PAGE SETTINGS =========================================
\newcommand{\th@forewordpage}{
    \BolumSagdaKalsinNolu
    \vspace*{6pt}
    \chapter*{\forewordname}
    \phantomsection
    \addcontentsline{toc}{chapter}{\forewordname}
    \@mkboth{\MakeUppercase\forewordname}{\MakeUppercase\forewordname}
    \vspace*{6pt}
    \singlespacing
    \hyphenpenalty=5000
    \sloppy
    \th@forewordstash
    \vspace{30pt} \\
    \th@teztarihkucuk \hfill \th@isimsoyisim \\
    \vspace*{-2.54mm} \hfill \th@unvan \\
}

%======================================== TOC PAGE SETTINGS ===========================================

\renewcommand\tableofcontents{
    {\BolumSagdaKalsinNolu
    \vspace*{6pt}
    \chapter*{\contentsname}
    \phantomsection
    \addcontentsline{toc}{chapter}{\contentsname}
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
    \vspace*{-15pt}
    \renewcommand{\ULdepth}{4pt}
    \renewcommand{\ULthickness}{1.0pt} 
    \if@ingilizce
    \hfill{\bfseries\uline{Page}}
    \else
    \hfill{\bfseries\uline{Sayfa}}
    \fi
    \vspace*{-7pt}} \\

    \setlength{\oldparskip}{\parskip}
    \setlength{\parskip}{\tocparskip}
    \@starttoc{toc}
    \setlength{\parskip}{\oldparskip}
    }

\let\th@tocpage\tableofcontents

%======================================= ABBR. PAGE SETTINGS ========================================== 

\newcommand{\th@abbreviationspage}{
      \BolumSagdaKalsinNolu
      \vspace*{6pt}
      \chapter*{\abbreviationsname}
      \phantomsection
      \addcontentsline{toc}{chapter}{\abbreviationsname}
      \@mkboth{\MakeUppercase\abbreviationsname}{\MakeUppercase\abbreviationsname}
      \vspace*{6pt}
      \th@abbreviationsstash
}  

%====================================== SYMBOLS PAGE SETTINGS =========================================     

\newcommand{\th@symbolspage}{
      \BolumSagdaKalsinNolu
      \vspace*{6pt}
      \chapter*{\symbolsname}
      \phantomsection
      \addcontentsline{toc}{chapter}{\symbolsname}
      \@mkboth{\MakeUppercase\symbolsname}{\MakeUppercase\symbolsname}
      \vspace*{6pt}
      \th@symbolsstash
} 

%======================================== LOT PAGE SETTINGS ===========================================

\renewcommand\listoftables{%
    {\BolumSagdaKalsinNolu
    \vspace*{6pt}
    \chapter*{\listtablename}
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}% 
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    \vspace*{-15pt}
    \renewcommand{\ULdepth}{4pt}
    \renewcommand{\ULthickness}{1.0pt} 
    \if@ingilizce
    \hfill{\bfseries\uline{Page}}
    \else
    \hfill{\bfseries\uline{Sayfa}}
    \fi
    \vspace*{-7pt}} \\

    \setlength{\oldparskip}{\parskip}
    \setlength{\parskip}{\loftparskip}
    \@starttoc{lot}
    \setlength{\parskip}{\oldparskip}
    }

\let\th@lotpage\listoftables

%======================================== LOF PAGE SETTINGS ===========================================

\renewcommand\listoffigures{%
    {\BolumSagdaKalsinNolu
    \vspace*{6pt}
    \chapter*{\listfigurename}
    \phantomsection
    \addcontentsline{toc}{chapter}{\listfigurename}
    \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}
    \vspace*{-15pt}
    \renewcommand{\ULdepth}{4pt}
    \renewcommand{\ULthickness}{1.0pt}
    \if@ingilizce
    \hfill{\bfseries\uline{Page}}
    \else
    \hfill{\bfseries\uline{Sayfa}}
    \fi
    \vspace*{-7pt}} \\

    \setlength{\oldparskip}{\parskip}
    \setlength{\parskip}{\loftparskip}
    \@starttoc{lof}
    \setlength{\parskip}{\oldparskip}
    }

\let\th@lofpage\listoffigures

%======================================== ÖZET PAGE SETTINGS ==========================================
\newcommand{\th@ozetpage}{
    \BolumSagdaKalsinNolu
    \vspace*{\titletopspace}
      \begin{center}
        \begin{tabular}{c}
          \bfseries \singlespacing \th@baslikbir \\
          \ifx\th@baslikiki\@empty
          \else
            \bfseries \singlespacing \th@baslikiki \\
            \ifx\th@baslikuc\@empty
            \else
              \bfseries \singlespacing \th@baslikuc \\
            \fi
          \fi
        \end{tabular}
      \end{center}
    \vspace*{-\chaptopspace}
    \chapter*{\centering\ozetname}
    \phantomsection
    \addcontentsline{toc}{chapter}{\ozetname}
    \@mkboth{\MakeUppercase\ozetname}{\MakeUppercase\ozetname}
    \singlespacing
    \sloppy
    \th@ozetstash   % the actual ozet
}

%======================================= SUMMARY PAGE SETTINGS ========================================
\newcommand{\th@summarypage}{
    \BolumSagdaKalsinNolu
    \vspace*{\titletopspace}
      \begin{center}
        \begin{tabular}{c}
        \bfseries\singlespacing \th@titleone \\
        \ifx\th@titletwo\@empty
        \else
          \bfseries\singlespacing \th@titletwo \\
          \ifx\th@titlethree\@empty
          \else
            \bfseries\singlespacing \th@titlethree \\
          \fi
        \fi
        \end{tabular}
      \end{center}
    \vspace*{-\chaptopspace}
    \chapter*{\centering\abstractname}
    \phantomsection
    \addcontentsline{toc}{chapter}{\abstractname}
    \@mkboth{\MakeUppercase\abstractname}{\MakeUppercase\abstractname}
    \singlespacing
    \sloppy
    \th@summarystash   % the actual abstract
}

%========================================= ALL PAGES CALLED ===========================================
\newcommand{\th@makethesisprologue}{
  \th@coverpage
  \pagenumbering{roman}								
  \renewcommand*{\thepage}{\small{\roman{page}}} 
  \setcounter{page}{\if@onluarkali 5 \else 3 \fi}
  \singlespacing

  \if@dedication
  \th@dedicationpage
  \fi
  \if@foreword
	\th@forewordpage
  \fi
  \th@tocpage
  \if@abbreviations
  \th@abbreviationspage
  \fi
  \if@symbols
	\th@symbolspage
  \fi
  \if@listoftables
	\th@lotpage
  \fi
  \if@listoffigures
	\th@lofpage
  \fi
  \if@ingilizce
  \th@summarypage
  \th@ozetpage
	\else % Turkce
	\th@ozetpage		
	\th@summarypage
	\fi

  \BolumSagdaKalsinNolu
  \oneandonehalf
  \pagenumbering{arabic}
  \renewcommand*{\thepage}{\small{\arabic{page}}}
}

%====================================== THE COVER GOES TO THE BEGINNING ==============================

\AtBeginDocument{
  \th@makethesisprologue
}

%====================================== BIBTEX ICIN TANIMLAMALAR =====================================
\if@ingilizce
  \gdef\baglac{and}
  \gdef\etal{et~al.}
  \gdef\duzenciler{(Eds.)}
  \gdef\duzenci{(Ed.)}
  \gdef\duzenleyen{edited by}
  \gdef\surum{edition}
  \gdef\cilt{volume}
  \gdef\kisasayi{no.}
  \gdef\sayi{number}
  \gdef\ssayfa{pp.}
  \gdef\sayfa{p.}
  \gdef\bolum{chapter}
  \gdef\teknikrapor{Technical Report}
  \gdef\lisanstezi{B.Sc. Thesis}
  \gdef\yuksektezi{{\it{M.Sc. Thesis}}}
  \gdef\doktoratezi{{\it{Ph.D. Dissertation}}}
\else
  \gdef\baglac{ve}
  \gdef\etal{ve diğerleri}
  \gdef\duzenciler{(düzenleyenler)}
  \gdef\duzenci{(düzenleyen)}
  \gdef\duzenleyen{düzenleyen}
  \gdef\surum{sürüm}
  \gdef\cilt{cilt}
  \gdef\kisasayi{sayı}
  \gdef\sayi{sayı}
  \gdef\ssayfa{s.}
  \gdef\sayfa{s.}
  \gdef\bolum{bölüm}
  \gdef\teknikrapor{Teknik Rapor}
  \gdef\lisanstezi{Lisans Tezi}
  \gdef\yuksektezi{{\it{Yüksek Lisans Tezi}}}
  \gdef\doktoratezi{{\it{Doktora Tezi}}}
\fi

%==================================== BIBLIOGRAPHY PAGE SETTINGS ======================================

\if@yazaryil
\bibliographystyle{itubib_name} 
\else       
\bibliographystyle{itubib_num}
\fi

\renewenvironment{thebibliography}[1]{%
    \BolumSagdaKalsinNolu
    \chapter*{\bibname}
    \vspace*{6pt}
    \singlespacing
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
    \list{\@biblabel{\@arabic\c@enumiv}}%
         {\settowidth\labelwidth{\@biblabel{#1}}%
          \leftmargin\labelwidth
          \if@yazaryil
          \else
          \advance\leftmargin\labelsep % no labelsep in author year
          \fi
          \advance\leftmargin by 15mm 
          \setlength{\itemindent}{-15mm}	
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
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}

%===================================== APPENDIX PAGE SETTINGS =========================

\newcommand{\th@appendixcoverpage}{
    \BolumSagdaKalsinNolu
    \singlespacing
    \chapter*{\appendixname}
    \phantomsection
    \addcontentsline{toc}{chapter}{\appendixname}
    \@mkboth{\MakeUppercase\appendixname}{\MakeUppercase\appendixname}
    \singlespacing
    \sloppy
    \th@appendixcoverstash
}

\newcommand{\th@appendixpage}{
    \appendix
    \singlespacing
    \sloppy
    \th@appendixstash
    }


%====================================== RESUME PAGE SETTINGS ===========================
\newcommand{\th@resumepage}{
    \BolumSagdaKalsinNolu
    \chapter*{\resumename}
    \phantomsection
    \addcontentsline{toc}{chapter}{\resumename}%
    \@mkboth{\MakeUppercase\resumename}{\MakeUppercase\resumename}
	  \singlespacing
    \sloppy
    \th@resumestash
}

%====================================== RESUME AND APPENDIX GOES TO THE END ============
\AtEndDocument{
  \if@appendix
  \th@appendixcoverpage
  \th@appendixpage
  \fi
  \th@resumepage
}

%====================================== THE END ========================================