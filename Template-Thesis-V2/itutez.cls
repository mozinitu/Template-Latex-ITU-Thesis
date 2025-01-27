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
% \RequirePackage[showframe,showcrop]{geometry}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}\hypersetup{hidelinks}
\RequirePackage[open,openlevel=1]{bookmark}
\RequirePackage{xcolor}
\RequirePackage{pdflscape} 
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}
\RequirePackage[normalem]{ulem}
\RequirePackage[hang]{caption}
\RequirePackage[list=true,listformat=simple]{subcaption} 
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

\newif\if@listoftables  % Tablo Listesi Olsun mu?
\@listoftablestrue  % Default = False

\newif\if@listoffigures % Sekil Listesi Olsun mu?
\@listoffigurestrue % Default = Var

\newif\if@tocisdotted % ToC Noktalı / Noktasız
\@tocisdottedtrue % Default = Noktalı      

\newif\if@tocchapterbold  % ToC da BÖLÜM 1-2.. bold mu?
\@tocchapterboldfalse % Default = Bold Değil

\newif\if@loflotpagebold  % LoF LoT da Sf No bold mu?
\@loflotpageboldtrue  % Default = Bold

\newif\if@appendix % Appendix will be enabled by \eklerkapak or \eklerbolum
\@appendixfalse 

%====================================== MAIN COMMANDS ====================================== 

\newcommand*{\baslik}[1]{\gdef\th@baslik{#1}}

\newcommand*{\baslikcilt}[3]{% If undefined create warning check
  \ifx\relax#1\relax
  \else
  \gdef\th@baslikbir{#1}
  \fi
  \gdef\th@baslikiki{#2}
  \gdef\th@baslikuc{#3}
}

\renewcommand*{\title}[1]{\gdef\th@title{#1}}

\newcommand*{\titlecover}[3]{
  \ifx\relax#1\relax
  \else
  \gdef\th@titleone{#1}
  \fi
  \gdef\th@titletwo{#2}
  \gdef\th@titlethree{#3}
}

\newcommand*{\yazar}[2]{
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
    \ClassError{itutez}{*** You must specify the OZGEMIS ***}
    {Use the \protect\ozgecmis{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@appendixcoverstash}{
    \ClassError{itutez}{*** You must specify the APPENDIX COVER ***}
    {Use the \protect\eklerkapak{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@appendixstash}{
    \ClassError{itutez}{*** You must specify the APPENDIX ***}
    {Use the \protect\eklerbolum{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

%====================================== INSTITUTE NAMES =========================================
    \if@bilisim
      \gdef\th@enstitubir{B\.il\.i\c s\.im Enst\. it\"us\"u}
      \gdef\th@enstituiki{}	
      \gdef\th@instituteone{Informatics Institute}
      \gdef\th@institutetwo{} 							
    \fi
    \if@lisansustu
      \gdef\th@enstitubir{L\.isansüstü Eğ\.it\.im Enst\.itüsü}
      \gdef\th@enstituiki{}		
      \gdef\th@instituteone{Graduate School}
      \gdef\th@institutetwo{}
    \fi
    \if@sosyalbilimler
      \gdef\th@enstitubir{Sosyal B\.il\.imler Enst\.it\"us\"u}
      \gdef\th@enstituiki{}		      
      \gdef\th@instituteone{The Graduate School of Arts}            		
      \gdef\th@institutetwo{and Social Sciences} 					
    \fi
    \if@enerji
      \gdef\th@enstitubir{Enerj\.i Enst\.it\"us\"u}
      \gdef\th@enstituiki{}		
      \gdef\th@instituteone{Institute of Energy}
      \gdef\th@institutetwo{} 									
    \fi
    \if@avrasya
      \gdef\th@enstitubir{Avrasya Yer B\.il\.imler\.i}
      \gdef\th@enstituiki{Enst\.it\"us\"u}		
      \gdef\th@instituteone{Eurasia Institute of}                   	
      \gdef\th@institutetwo{Earth Sciences} 						
    \fi
%======================================= FACULTY NAMES =========================================
    \if@ucakuzay
	    \gdef\th@enstitubir{U\c cak ve Uzay B\.imler\.i Fak\"ultes\.i}
	    \gdef\th@enstituiki{}		
	    \gdef\th@instituteone{Faculty of Aeronautics and}
	    \gdef\th@institutetwo{Astronautics}
    \fi
    \if@elektrikelektronik
    	\gdef\th@enstitubir{Elektr\.ik-Elektron\.ik Fak\"ultes\.i}
	    \gdef\th@enstituiki{}		
    	\gdef\th@instituteone{Faculty of Electrical and}
    	\gdef\th@institutetwo{Electronics}
    \fi
    \if@makina									
    	\gdef\th@enstitubir{Mak\.ina Fak\"ultes\.i}
	    \gdef\th@enstituiki{}		
    	\gdef\th@instituteone{Faculty of Mechanical}
    	\gdef\th@institutetwo{Engineering}
    \fi

%========================= COVER PAGE NAMES ======================================================
\if@doktora
  \gdef\th@tezseviyesiEN{Ph.D. THESIS}
  \gdef\th@tezseviyesiTR{DOKTORA TEZİ}
  \gdef\th@tezunvanEN{Ph.D.}
  \gdef\th@tezunvanTR{Doktora}
  \gdef\th@tezisimEN{dissertation}
  \gdef\th@tezisimTR{tezini}
\fi
\if@yukseklisans
  \gdef\th@tezseviyesiEN{M.Sc. THESIS}
  \gdef\th@tezseviyesiTR{YüKSEK LİSANS TEZİ}
  \gdef\th@tezunvanEN{M.Sc.}
  \gdef\th@tezunvanTR{Yüksek Lisans}
  \gdef\th@tezisimEN{thesis}
  \gdef\th@tezisimTR{tezini}
\fi
\if@lisans
  \gdef\th@tezseviyesiEN{GRADUATION THESIS}
  \gdef\th@tezseviyesiTR{BİTİRME ÇALIŞMASI}
  \gdef\th@tezunvanEN{B.Sc.}
  \gdef\th@tezunvanTR{Lisans}
  \gdef\th@tezisimEN{graduation project}
  \gdef\th@tezisimTR{bitirme çalışmasını}
\fi
\gdef\th@enstituEN{
  \ifx\th@institutetwo\@empty
  \th@instituteone
  \else
  \th@instituteone\ \th@institutetwo
  \fi
}
\gdef\th@enstitubuyukEN{
  ISTANBUL TECHNICAL UNIVERSITY
  \raisebox{1.6pt}{\footnotesize$\bigstar$}
  \MakeUppercase{\th@instituteone}
}
\gdef\th@enstitukucukEN{
  \th@institutetwo
}
\gdef\th@enstituTR{
  \ifx\th@enstituiki\@empty
  \th@enstitubir
  \else
  \th@enstitubir\ \th@enstituiki
  \fi
}
\gdef\th@enstitubuyukTR{
  İSTANBUL TEKNİK ÜNİVERSİTESİ
  \raisebox{1.6pt}{\footnotesize$\bigstar$}
  \MakeUppercase{\th@enstitubir}
}
\gdef\th@enstitukucukTR{
  \th@enstituiki
}
\gdef\th@baslikEN{\th@title}
\gdef\th@baslikTR{\th@baslik}
\gdef\th@anabilimbaslikEN{Department}
\gdef\th@anabilimbaslikTR{Anabilim Dalı}
\gdef\th@programbaslikEN{Programme}
\gdef\th@programbaslikTR{Program}
\gdef\th@teslimtarihibaslikEN{Date of Submission}
\gdef\th@teslimtarihibaslikTR{Tezin Enstitüye Verildiği Tarih}
\gdef\th@savunmatarihibaslikEN{Date of Defense Examination}
\gdef\th@savunmatarihibaslikTR{Tezin Savunulduğu Tarih}
\gdef\th@danismanbaslikEN{Thesis Advisor}
\gdef\th@danismanbaslikTR{Tez Danışmanı}
\gdef\th@esdanismanbaslikEN{Co-Advisor}
\gdef\th@esdanismanbaslikTR{Eş Danışman}
\gdef\th@juribaslikEN{Members of the Examining Committee}
\gdef\th@juribaslikTR{Diğer Jüri Üyeleri}
\gdef\th@tarihbuyukEN{\th@date}
\gdef\th@tarihbuyukTR{\th@tarih} 	

\if@ingilizce
  \gdef\th@tezseviyesi{\th@tezseviyesiEN}
  \gdef\th@enstitu{\th@enstituEN}
  \gdef\th@enstitubuyuk{\th@enstitubuyukEN}
  \gdef\th@enstitukucuk{\th@enstitukucukEN}
  \gdef\th@tezbaslik{\th@baslikEN}
  \gdef\th@anabilim{\th@department}
  \gdef\th@anabilimbaslik{\th@anabilimbaslikEN}
  \gdef\th@program{\th@programme}
  \gdef\th@programbaslik{\th@programbaslikEN}
  \gdef\th@tarihbuyuk{\th@tarihbuyukEN}
  \gdef\th@tarihkucuk{\th@datelower}
  \gdef\th@teslimtarihi{\th@submissiondate}
  \gdef\th@teslimtarihibaslik{\th@teslimtarihibaslikEN}
  \gdef\th@savunmatarihi{\th@defencedate}
  \gdef\th@savunmatarihibaslik{\th@savunmatarihibaslikEN}
  \gdef\th@danismanbaslik{\th@danismanbaslikEN}
  \gdef\th@juribaslik{\th@juribaslikEN}
\else
  \gdef\th@tezseviyesi{\th@tezseviyesiTR}
  \gdef\th@enstitu{\th@enstituTR}
  \gdef\th@enstitubuyuk{\th@enstitubuyukTR}
  \gdef\th@Enstitukucuk{\th@enstitukucukTR}
  \gdef\th@tezbaslik{\th@baslikTR}
  \gdef\th@anabilim{\th@anabilimdali}
  \gdef\th@anabilimbaslik{\th@anabilimbaslikTR}
  \gdef\th@program{\th@program}
  \gdef\th@programbaslik{\th@programbaslikTR}
  \gdef\th@tarihbuyuk{\th@tarihbuyukTR}
  \gdef\th@tarihkucuk{\th@tarihkucuk}
  \gdef\th@teslimtarihi{\th@tezteslimtarih}
  \gdef\th@teslimtarihibaslik{\th@teslimtarihibaslikTR}
  \gdef\th@savunmatarihi{\th@tezsavunmatarih}
  \gdef\th@savunmatarihibaslik{\th@savunmatarihibaslikTR}
  \gdef\th@danismanbaslik{\th@danismanbaslikTR}
  \gdef\th@juribaslik{\th@juribaslikTR}
\fi

%==================== CHAPTER VE SECTION NAMES ======================
% We dont change report.cls names, instead we define new ones.
\gdef\th@summaryname{SUMMARY}
\gdef\th@ozetname{ÖZET}
\if@ingilizce
\gdef\th@chaptername{CHAPTER}
\gdef\th@tocname{TABLE OF CONTENTS}
\gdef\th@lotname{LIST OF TABLES}
\gdef\th@lofname{LIST OF FIGURES}
\gdef\th@forewordname{FOREWORD}
\gdef\th@resumename{CURRICULUM VITAE}
\gdef\th@appendixname{APPENDIX}
\gdef\th@symbolsname{SYMBOLS}
\gdef\th@bibname{REFERENCES}
\gdef\th@abbreviationsname{ABBREVIATIONS} 
\gdef\th@indexname{INDEX}
\gdef\th@figurename{Figure}
\gdef\th@tablename{Table}
\gdef\th@partname{PART}
\gdef\th@glossaryname{DICTIONARY}
\else
\gdef\th@chaptername{BÖLÜM}
\gdef\th@tocname{İÇİNDEKİLER}
\gdef\th@lotname{ÇİZELGE LİSTESİ} 
\gdef\th@lofname{ŞEKİL LİSTESİ}
\gdef\th@forewordname{ÖNSÖZ}
\gdef\th@resumename{ÖZGEÇMİŞ}
\gdef\th@appendixname{EK}
\gdef\th@symbolsname{SEMBOLLER}
\gdef\th@bibname{KAYNAKLAR}
\gdef\th@abbreviationsname{KISALTMALAR}
\gdef\th@indexname{DİZİN}
\gdef\th@figurename{Şekil}
\gdef\th@tablename{Çizelge}
\gdef\th@partname{KISIM}
\gdef\th@glossaryname{TERİMLER SÖZLÜĞÜ}
\fi

%================================ SAYFA YAPISI İLE İLGİLİ TANIMLAMALAR ================================
% \geometry{driver=pdftex}
\if@onluarkali
\geometry{a4paper,onecolumn,twoside,paperheight=297mm,paperwidth=210mm}
\else
\geometry{a4paper,onecolumn,paperheight=297mm,paperwidth=210mm}
\fi
\geometry{bindingoffset=0mm,foot=10mm}
% \geometry{textheight=247mm,textwidth=145mm,top=25mm,bottom=25mm,left=40mm,right=25mm}
\geometry{textheight=247mm,textwidth=145mm,top=25mm,left=40mm}
\setlength{\parindent}{0pt} % Paragrafların ilk satırlarının ne kadar içeri gireceği
\setlength\parskip{6pt} 
\raggedbottom
% \flushbottom

%=================================== HEADER AND FOOTNOTE SETTINGS ===================================
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\fontsize{11}{11}\selectfont\thepage}
\renewcommand{\headrulewidth}{0pt} 
% Needs to be checked
\setlength{\skip\footins}{1cm}
\setlength\footnotemargin{.35em}
\addtolength{\footnotesep}{0mm}

%========================================= CAPTION SETTINGS =========================================
\DeclareCaptionLabelSeparator{colon}{ \bf{:} }  % Proper colomn separation in the figure labels 
\DeclareCaptionLabelFormat{subfigure}{\figurename#1~\thefigure\alph{subfigure}}
\captionsetup[table]{labelfont=bf,labelsep=colon,position=top,justification=justified,skip=6pt}
\captionsetup[figure]{labelfont=bf,labelsep=colon,position=bottom,justification=justified,skip=6pt}
\subcaptionsetup[figure]{labelformat=subfigure,labelfont=bf,font=normalsize,labelsep=colon,position=bottom,justification=justified,skip=6pt}

%========================================= EQUATION SETTINGS =========================================

%========================================= ENUMARATE SETTINGS ========================================
\renewcommand\labelitemi{\normalsize$\bullet$} % Set the bullet size similar to the word template
\setlist{itemsep=0pt, topsep=0pt, parsep=6pt}
\setlength{\labelsep}{.5em} % Enumeration  
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
\newlength{\chaptervspace}
\setlength{\chaptervspace}{50.4pt} % 72pt - \vspace*{12*0.2pt} -\topskip{12pt} - \parskip{6pt}
\newlength{\titlevspace}
\setlength{\titlevspace}{38.4pt} % 50.4pt - 12pt

%=============================== LINE SPACING SETTINGS =================================
\newlength{\defbaselineskip}
\setlength{\defbaselineskip}{\baselineskip} % Actually \baselineskip is 1.2 linespacing = 14.5pt
\newcommand{\setlinespacing}[1]{\setlength{\baselineskip}{#1\defbaselineskip}}  % Not used
\newcommand{\doublespacing}{\setlength{\baselineskip}{2.0\defbaselineskip}}           %%\doublespacing = 2
\newcommand{\singlespacing}{\setlength{\baselineskip}{\defbaselineskip}}              %%\singlespacing = 1.0
\newcommand{\oneandonehalf}{\setlength{\baselineskip}{1.45\defbaselineskip}}          %%\oneandonehalf = 1.5
\newcommand{\lofspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}              %%\lofspacing = 1.0
\newcommand{\lotspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}              %%\lotspacing = 1.0
\newcommand{\tocspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}              %%\tocspacing = 1.0
\newcommand{\titlespacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}            %%\titlespacing = 1.0

%============================= TOC, LOT AND LOF RELATED PARAGPRAPH SKIPS ============================
\newlength{\lofparskip}     %% List of Figure parskip 08-05-2006
\setlength{\lofparskip}{0em}

\newlength{\lotparskip}     %% List of Table parskip 08-05-2006
\setlength{\lotparskip}{0em}

\newlength{\tocparskip}     %% Table of Content parskip 08-05-2006
\setlength{\tocparskip}{0em}

%======================================  FONT SIZES SETTINGS ======================================= 
% Most of these settings are redundant. Since all thesis is in 12 pt Font.
\newcommand*{\titleFnt}{% Title Font Boyutu
  \normalfont\normalsize\bfseries}               
\newcommand*{\titleAnaBilimDaliFnt}{% Anabilimdalı Font Boyutu
  \normalfont\normalsize\bfseries}   
\newcommand*{\DestekFnt}{% Destek Font Boyutu
  \normalfont\normalsize\bfseries}             
\newcommand*{\TOCFnt}{
  \normalfont\normalsize\bfseries}   
\newcommand*{\HdFnt}{% Başlıklar Font Boyutu
  \normalfont\normalsize\bfseries}                     
\newcommand*{\ChFnt}{% Chapter Font Boyutu 
  \normalfont\normalsize\bfseries}                  
\newcommand*{\ScFnt}{% Section Font Boyutu
  \normalfont\normalsize\bfseries}   

%================================ CHAPTER AND SECTION NUMBERING ===================================

\newcommand*{\DefTheChapter}{\arabic{chapter}}
\newcommand*{\DefTheSection}{\DefTheChapter.\arabic{section}}
\newcommand*{\DefTheSubsection}{\DefTheSection.\arabic{subsection}}
\newcommand*{\DefTheSubsubsection}{\DefTheSubsection.\arabic{subsubsection}}
\newcommand*{\DefTheSubsubsubsection}{\DefTheSubsubsection.\arabic{subsubsubsection}}

\renewcommand*{\thechapter}{\DefTheChapter}
\renewcommand*{\thesection}{\DefTheSection}
\renewcommand*{\thesubsection}{\DefTheSubsection}
\renewcommand*{\thesubsubsection}{\DefTheSubsubsection}
\newcommand*{\thesubsubsubsection}{\DefTheSubsubsubsection}

%================================ TOC, LOT and LOF SETTINGS  ================================

\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{4}

% Part settings in TOC
\renewcommand*\l@part[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      #1\nobreak
      \if@tocisdotted
        \leaders\hbox{$\m@th\hbox{.}$}  % cleaders is more flush than leaders
      \fi 
      \hfil\nobreak#2\par % Added to make the dots come next to the page numbers
      \penalty\@highpenalty
    \endgroup
  \fi
}

% Chapter Settings in TOC
\renewcommand*\l@chapter[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      #1\nobreak 
      \if@tocisdotted
        \leaders\hbox{$\m@th\hbox{.}$} % cleaders is more flush than leaders
      \fi
      \hfil\nobreak#2\par % Added to make the dots come next to the page numbers
      \penalty\@highpenalty
   \endgroup
  \fi}

% Section, subsection, subsubsection Settings in TOC  
\def\@tocline#1#2#3#4#5{
  \vskip 1\p@
  \ifnum #1=\c@tocdepth 
  \else
    \vskip \z@ \@plus.2\p@  
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M 
     \leavevmode %\bfseries % sections unbolded
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     #4\nobreak
      \if@tocisdotted
       \leaders\hbox{$\m@th\hbox{.}$} %cleaders or xleaders is more flush than leaders
       \fi
     \hfill
     \hfil\nobreak#5 % Added to make the dots come next to the page numbers
     \par}%
  \fi}

\newcommand*\l@mistix{\@tocline{1}{0mm}{0mm}} 
\renewcommand*\l@section{\@tocline{1}{1.1em}{1.5em}}              	
\renewcommand*\l@subsection{\@tocline{2}{2.2em}{2.3em}}
\renewcommand*\l@subsubsection{\@tocline{3}{3.3em}{3.0em}} 			
\newcommand*\l@subsubsubsection{\@tocline{4}{4.3em}{4.9em}} 
\renewcommand*\l@table{\@lofline{1}{0em}{5.5em}}  					
\renewcommand*\l@figure{\@lofline{1}{0em}{6em}}
\renewcommand*\l@subfigure{\@lofline{1}{0em}{6em}}

% LOT ve LOF Settings
\def\@lofline#1#2#3#4#5{
	\vskip 1\p@
	\ifnum #1=\c@tocdepth
  \else
	\vskip \z@ \@plus.2\p@
	{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
		\parindent #2\relax\@afterindenttrue
		\interlinepenalty\@M \normalsize  % normalsize font
		\leavevmode %\bfseries  % Figure and table captions are not bold
		\@tempdima #3\relax
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{#4}\nobreak
		\if@tocisdotted
		\leaders\hbox{$\m@th\hbox{.}$}  %cleaders or xleaders is more flush than leaders
		\fi
		\hfill
		\hfil\nobreak\if@loflotpagebold\bfseries\fi#5 % Added to make the dots come next to the page numbers with bold page numbers
		\par}
	\fi}


%========================================== PAGE SETTINGS ===========================================
% Setting of even pages that do not have page numbers and odd page setting that does have a page number
\def\BolumSagdaKalsin{
  \clearpage
  \if@twoside
    \ifodd\c@page % Count the pag
    \else
      \hbox{}
      \thispagestyle{empty}
      \newpage
      \if@twocolumn
	      \hbox{}
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
      \hbox{}
      \newpage
      \if@twocolumn
	      \hbox{}
	      \newpage
      \fi
    \fi
  \fi
} 

%==================================== NUMBERED CHAPTER TITLE SETTINGS ==========================================

\def\@makechapterhead#1{%
    \vspace*{\chaptervspace}	
    {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@appendix
        \ChFnt \th@appendixname\ \thechapter\ %:\ \normalfont #1
        \par\nobreak
        \vskip 18\p@ 	% Due to single space
      \else
        \ChFnt \thechapter. \;#1\par\nobreak
        \vskip 12\p@ % This is the Chapter 18 pt spacing after the title
      \fi
    \fi
  }}

%==================================== UNNUMBERED CHAPTER TITLE SETTINGS ==========================================

\def\@makeschapterhead#1{%
  \vspace*{\chaptervspace}	
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \if@appendix
      \ChFnt #1\par\nobreak
      \vskip 18\p@  % due to single space
    \else
      \ChFnt #1\par\nobreak
      \vskip 12\p@
    \fi
  }}

%======================== SECTION, SUBSECTION, AND SUBSUBSECTION SETTINGS =============================
% Skip values by SBÖ are TRUE
% Numbered and unnumbered section settings
\def\section{
\@ifstar\unnumberedsection\numberedsection
}
\def\numberedsection{
\@ifnextchar[%]
\numberedsectionwithtwoarguments
\numberedsectionwithoneargument
}
\def\unnumberedsection{
\@ifnextchar[%]
\unnumberedsectionwithtwoarguments
\unnumberedsectionwithoneargument
}
\def\numberedsectionwithoneargument#1{
\numberedsectionwithtwoarguments[#1]{#1}
}
\def\unnumberedsectionwithoneargument#1{
\unnumberedsectionwithtwoarguments[#1]{#1}
}
\def\numberedsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi  
  \removelastskip
  % Better to not sections in appendix
  % \if@appendix % Appendix için
  % \vspace*{18pt}\goodbreak
  % \refstepcounter{section}
  % \noindent
  % \leavevmode
  % \begingroup
  % \normalfont \bfseries
  % \th@appendixname\ \thesection\ %:\ \normalfont #2 % \quad
  % \endgroup\goodbreak 
  % \vskip 12pt\nobreak  
  % \addcontentsline{toc}{section}{\th@appendixname\ \thesection}
  % \else
  \vspace*{12pt}\goodbreak
  \refstepcounter{section}
  \noindent
  \leavevmode
  \begingroup
  \normalfont \bfseries
  \thesection\;\ 
  #2\quad
  \endgroup\goodbreak 
  \vskip 6pt\nobreak  
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}
  % \fi
}
\def\unnumberedsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{12pt}\goodbreak 
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \vskip 6pt\nobreak  
  \addcontentsline{toc}{section}{#1}
}
% Numbered and Unnumbered subsection settings
\def\subsection{
\@ifstar\unnumberedsubsection\numberedsubsection
}
\def\numberedsubsection{
\@ifnextchar[%]
\numberedsubsectionwithtwoarguments
\numberedsubsectionwithoneargument
}
\def\unnumberedsubsection{
\@ifnextchar[%]
\unnumberedsubsectionwithtwoarguments
\unnumberedsubsectionwithoneargument
}
\def\numberedsubsectionwithoneargument#1{
\numberedsubsectionwithtwoarguments[#1]{#1}
}
\def\unnumberedsubsectionwithoneargument#1{
\unnumberedsubsectionwithtwoarguments[#1]{#1}
}
\def\numberedsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak 
  \refstepcounter{subsection}
  \noindent
  \leavevmode
  \begingroup
  \ScFnt
  \thesubsection\;\ 
  #2\quad
  \endgroup\goodbreak 	
  \vskip 0pt\nobreak   	
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}#1}
}
\def\unnumberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \vskip 0pt\nobreak   	
  \addcontentsline{toc}{subsection}{#1}
}
% Numbered and Unnumbered subsubsection settings
\def\subsubsection{
\@ifstar
\unnumberedsubsubsection
\numberedsubsubsection
}
\def\subsubsubsection{
\unnumberedsubsubsubsection
}
\def\numberedsubsubsection{
\@ifnextchar[%]
\numberedsubsubsectionwithtwoarguments
\numberedsubsubsectionwithoneargument
}
\def\unnumberedsubsubsection{
\@ifnextchar[%]
\unnumberedsubsubsectionwithtwoarguments
\unnumberedsubsubsectionwithoneargument
}
\def\unnumberedsubsubsubsection{
\@ifnextchar[%]
\unnumberedsubsubsubsectionwithtwoarguments
\unnumberedsubsubsubsectionwithoneargument
}
\def\numberedsubsubsectionwithoneargument#1{
\numberedsubsubsectionwithtwoarguments[#1]{#1}
}
\def\unnumberedsubsubsectionwithoneargument#1{
\unnumberedsubsubsectionwithtwoarguments[#1]{#1}
}
\def\unnumberedsubsubsubsectionwithoneargument#1{
\unnumberedsubsubsubsectionwithtwoarguments[#1]{#1}
}
\def\numberedsubsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \refstepcounter{subsubsection}
  \noindent
  \leavevmode
  \begingroup
  \ScFnt
  \thesubsubsection\;\ 
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}
}
\def\unnumberedsubsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsubsection}{#1}
}
% Unnumbered subsubsubsection settings
\def\unnumberedsubsubsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{0pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak 
  \vskip -6pt\nobreak  	
  \addcontentsline{toc}{subsubsubsection}{#1}
}

% TOC'de part tanımları
\def\@part[#1]#2{
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
      \ChFnt \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \ChFnt #2\par}
    \@endpart}

\def\@spart#1{%
     {\centering
      \interlinepenalty \@M
      \normalfont
      \ChFnt #1\par}%
     \@endpart}

 \def\@endpart{\vfil\newpage
               \if@twoside
                \if@openright
                 \null
                 \thispagestyle{empty}%
                 \newpage
                \fi
               \fi
               \if@tempswa
                 \twocolumn
               \fi}

% Chapter settings
\renewcommand\chapter{\global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@chapter\@schapter}

% TOC'de Chapter tanımları
\def\@chapter[#1]#2{
  \BolumSagdaKalsinNolu
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}
    \if@appendix
      \addtocontents{toc}{\protect\addvspace{0\p@}}												
      \addcontentsline{toc}{section}{\th@appendixname\ \thechapter}										
	  \else
      \addtocontents{toc}{\protect\addvspace{-10\p@}}
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
  \fi
}

\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}

%======================================== OUTER COVER (DIŞ KAPAK) SETTINGS ==========================================

\newcommand*{\th@outercoverpage}{
    \thispagestyle{empty}

    \if@cilt 
    \else
    \color{black} % applies to 2nd page
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
    \begin{textblock*}{\textwidth}[0,0](39mm,30.5mm)
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
    	\renewcommand{\ULthickness}{1.5pt} 
    	\centering
      \uline{\bf\th@enstitubuyuk}	
	\end{textblock*}

  \if@ingilizce
    \ifx\th@institutetwo\@empty
    \else
      \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
      \singlespacing
      \renewcommand{\ULdepth}{2.75pt} 	
      \renewcommand{\ULthickness}{1.5pt} 	
      \centering
      \uline{\MakeUppercase{\bf\th@enstitukucukEN}}
      \end{textblock*}
    \fi
  \else % Turkce
    \ifx\th@enstituiki\@empty
    \else
      \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
      \singlespacing
      \renewcommand{\ULdepth}{2.75pt} 	
      \renewcommand{\ULthickness}{1.5pt} 	
      \centering
      \uline{\MakeUppercase{\bf\th@enstitukucukTR}}
      \end{textblock*}
    \fi
  \fi

  \if@ingilizce  
  \begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    \titleFnt\titlespacing \th@titleone \\
    \ifx\th@titletwo\@empty
    \else
      \titleFnt\titlespacing \th@titletwo \\
      \ifx\th@titlethree\@empty
      \else
        \titleFnt\titlespacing \th@titlethree \\
      \fi
    \fi
	\end{textblock*}
  \else % Turkce
  \begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    		\titleFnt\titlespacing \th@baslikbir \\
        \ifx\th@baslikiki\@empty
        \else
		      \titleFnt\titlespacing \th@baslikiki \\
          \ifx\th@baslikuc\@empty
          \else
            \titleFnt\titlespacing \th@baslikuc \\
          \fi
        \fi
	\end{textblock*}
  \fi

	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
	    \centering
	    \titleFnt \th@tezseviyesi  \\
	\end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
	    \centering
      \titleFnt \th@isimsoyisim  \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
	   \centering
	   \titleFnt \th@anabilim\\
    \end{textblock*}
 
 	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
 	   \centering
 	   \titleFnt \th@program \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	   \centering
       \titleFnt \th@tarihbuyuk \\
    \end{textblock*}

\vspace*{\fill}

\if@cilt
\else
\newpage
\nopagecolor
\fi

}

%======================================== ENGLISH INNER COVER (İÇ KAPAK) SETTINGS =========================================== 
\newcommand*{\th@innercoverpageEN}{			
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
		\renewcommand{\ULthickness}{1.5pt} 	
		\centering
		\uline{{\bf\th@enstitubuyukEN}} \\ 
	\end{textblock*}

  \ifx\th@institutetwo\@empty
  \else
  \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\singlespacing
    \renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.5pt} 	
		\centering
		\uline{\MakeUppercase{\bf\th@enstitukucukEN}}
	\end{textblock*}
  \fi
      
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    \titleFnt\titlespacing \th@titleone \\
    \ifx\th@titletwo\@empty
    \else
      \titleFnt\titlespacing \th@titletwo \\
      \ifx\th@titlethree\@empty
      \else
        \titleFnt\titlespacing \th@titlethree \\
      \fi
    \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\titleFnt \th@tezseviyesiEN  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\titleFnt \th@isimsoyisim  \\
		\titleFnt (\th@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\titleFnt \th@department \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\titleFnt \th@programme \\
	\end{textblock*}
	
  \begin{textblock*}{\textwidth}[0,0](40mm,230mm)
	  \centering
    \titleFnt \th@danismanbaslikEN : \titleFnt \th@advisor \\
	\end{textblock*}

  \begin{textblock*}{\textwidth}[0,0](40mm,235mm)
	  \centering
    \ifx\th@coadvisor\@empty
    \else
	  \titleFnt \th@esdanismanbaslikEN : \titleFnt \th@coadvisor \\
    \fi
  \end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\titleFnt \th@tarihbuyukEN \\
	\end{textblock*}
	
	\vspace*{\fill}
}

%===================================== TÜRKÇE INNER COVER (İÇ KAPAK) SETTINGS =======================================
\newcommand*{\th@innercoverpageTR}{	
	\BolumSagdaKalsin
	\thispagestyle{empty}
	\if@lisansustu
		\begin{textblock*}{\textwidth}[0,0](39mm,30.5mm)
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
		\renewcommand{\ULthickness}{1.5pt}
		\centering
		\uline{{\bf\th@enstitubuyukTR}}
	\end{textblock*}

  \ifx\th@enstituiki\@empty
  \else
  \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\singlespacing
    \renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.5pt} 	
		\centering
		\uline{\MakeUppercase{\bf\th@enstitukucukTR}}
	\end{textblock*}
  \fi
	
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    		\titleFnt\titlespacing \th@baslikbir \\
        \ifx\th@baslikiki\@empty
        \else
		      \titleFnt\titlespacing \th@baslikiki \\
          \ifx\th@baslikuc\@empty
          \else
            \titleFnt\titlespacing \th@baslikuc \\
          \fi
        \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\titleFnt \th@tezseviyesiTR  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\titleFnt \th@isimsoyisim  \\
		\titleFnt (\th@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\titleFnt \th@anabilimdali \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\titleFnt \th@program \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,230mm)
		\centering
		\titleFnt \th@danismanbaslikTR : \titleFnt \th@danisman \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,235mm)
		\centering
    \ifx\th@esdanisman\@empty
    \else
    \titleFnt \th@esdanismanbaslikTR : \titleFnt \th@esdanisman \\
    \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\titleFnt \th@tarihbuyukTR \\
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
	\th@isimsoyisim , a \th@tezunvanEN\ student of ITU \th@enstitu\ student ID \th@ogrencino , successfully defended the \th@tezisimEN\ entitled ``\th@tezbaslik'', which he/she prepared after fulfilling the requirements specified in the associated legislations, before the jury whose signatures are below.
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
  İTÜ, \th@enstitu'nün \th@ogrencino\ numaralı \th@tezunvanTR\ öğrencisi \th@isimsoyisim , ilgili yönetmeliklerin belirlediği gerekli tüm şartları yerine getirdikten sonra hazırladığı ``\th@tezbaslik'' başlıklı \th@tezisimTR\ aşağıdaki imzaları olan jüri önünde başarı ile sunmuştur.
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
      \th@innercoverpageEN
      \th@innercoverpageTR
      \th@approvalpage
    \else
      \th@outercoverpage
      \th@innercoverpageTR
      \th@innercoverpageEN
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
    \chapter*{\th@forewordname}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@forewordname}
    \@mkboth{\MakeUppercase\th@forewordname}{\MakeUppercase\th@forewordname}
    \vspace*{6pt}
    \singlespacing
    \hyphenpenalty=5000
    \sloppy
    \th@forewordstash
    \vspace{30pt} \\
    \th@tarihkucuk \hfill \th@isimsoyisim \\
    \vspace*{-2.54mm} \hfill \th@unvan \\
}

%======================================== TOC PAGE SETTINGS ===========================================
\renewcommand\tableofcontents{
    {\BolumSagdaKalsinNolu
    \chapter*{\th@tocname}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@tocname}
    \@mkboth{\MakeUppercase\th@tocname}{\MakeUppercase\th@tocname}
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt}
    \renewcommand{\ULthickness}{1.5pt} 
    \if@ingilizce
      \hfill\vspace*{0truecm}{\bf\uline{Page}}
    \else
      ~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}
    \fi
    \vspace*{-12pt}} \\

    \newlength{\oldparskip}
    \setlength{\oldparskip}{\parskip}
    \setlength{\parskip}{\tocparskip}
    \@starttoc{toc}
    \setlength{\parskip}{\oldparskip}
    }

\let\th@tocpage\tableofcontents

%======================================= ABBR. PAGE SETTINGS ========================================== 

\newcommand{\th@abbreviationspage}{
      \BolumSagdaKalsinNolu
      \chapter*{\th@abbreviationsname}
      \phantomsection
      \addtocontents{toc}{\protect\addvspace{-10\p@}}
      \addcontentsline{toc}{chapter}{\th@abbreviationsname}
      \@mkboth{\MakeUppercase\th@abbreviationsname}{\MakeUppercase\th@abbreviationsname}
      \vspace*{6pt}
      \th@abbreviationsstash
}  

%====================================== SYMBOLS PAGE SETTINGS =========================================     

\newcommand{\th@symbolspage}{
      \BolumSagdaKalsinNolu
      \chapter*{\th@symbolsname}
      \phantomsection
      \addtocontents{toc}{\protect\addvspace{-10\p@}}
      \addcontentsline{toc}{chapter}{\th@symbolsname}
      \@mkboth{\MakeUppercase\th@symbolsname}{\MakeUppercase\th@symbolsname}
      \vspace*{6pt}
      \th@symbolsstash
} 

%======================================== LOT PAGE SETTINGS ===========================================
\renewcommand\listoftables{%
    {\BolumSagdaKalsinNolu
    \chapter*{\th@lotname}%
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@lotname}%  
    \@mkboth{\MakeUppercase\th@lotname}{\MakeUppercase\th@lotname}%
    \vspace*{-18pt}%
    \renewcommand{\ULdepth}{4pt}% 
    \renewcommand{\ULthickness}{1.5pt}% 
    \if@ingilizce
      \hfill\vspace*{0truecm}{\bf\uline{Page}}
    \else
    ~ \hfill\vspace*{0truecm}{\bf\uline{Sayfa}}
    \fi
    \vspace*{-12pt}} \\

    \let\orig@numberline\numberline
    \renewcommand*{\numberline}[1]{%
    \orig@numberline{\bf\tablename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}}%
    \setlength{\oldparskip}{\parskip}%
    \setlength{\parskip}{\lotparskip}%
    \@starttoc{lot}%
    \setlength{\parskip}{\oldparskip}%
    \let\numberline\orig@numberline
    }

\let\th@lotpage\listoftables

%======================================== LOF PAGE SETTINGS ===========================================
\renewcommand\listoffigures{%
    {\BolumSagdaKalsinNolu
    \chapter*{\th@lofname}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@lofname}
    \@mkboth{\MakeUppercase\th@lofname}{\MakeUppercase\th@lofname}%
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt}%		
    \renewcommand{\ULthickness}{1.5pt}% 	
    \if@ingilizce
      \hfill\vspace*{0truecm}{\bf\uline{Page}}
    \else
      ~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}
    \fi
    \vspace*{-12pt}} \\

    \let\orig@numberline\numberline
    \renewcommand*{\numberline}[1]{%
    \orig@numberline{\bf\figurename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}}% 
    \setlength{\oldparskip}{\parskip}%
    \setlength{\parskip}{\lofparskip}%
    \@starttoc{lof}%
    \setlength{\parskip}{\oldparskip}%
    \let\numberline\orig@numberline
    }

\let\th@lofpage\listoffigures

%======================================== ÖZET PAGE SETTINGS ==========================================
\newcommand{\th@ozetpage}{
    \BolumSagdaKalsinNolu
    \vspace*{\titlevspace}
      \begin{center}
        \begin{tabular}{c}
          \titleFnt\titlespacing \th@baslikbir \\
          \ifx\th@baslikiki\@empty
          \else
            \titleFnt\titlespacing \th@baslikiki \\
            \ifx\th@baslikuc\@empty
            \else
              \titleFnt\titlespacing \th@baslikuc \\
            \fi
          \fi
        \end{tabular}
      \end{center}
    \chapter*{\vspace*{-\chaptervspace}\centering\th@ozetname}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@ozetname}
    \@mkboth{\MakeUppercase\th@ozetname}{\MakeUppercase\th@ozetname}
    \singlespacing
    \sloppy
    \th@ozetstash   % the actual ozet
}

%======================================= SUMMARY PAGE SETTINGS ========================================
\newcommand{\th@summarypage}{
    \BolumSagdaKalsinNolu
    \vspace*{\titlevspace}
      \begin{center}
        \begin{tabular}{c}
        \titleFnt\titlespacing \th@titleone \\
        \ifx\th@titletwo\@empty
        \else
          \titleFnt\titlespacing \th@titletwo \\
          \ifx\th@titlethree\@empty
          \else
            \titleFnt\titlespacing \th@titlethree \\
          \fi
        \fi
        \end{tabular}
      \end{center}
    \chapter*{\vspace*{-\chaptervspace}\centering\th@summaryname}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@summaryname}
    \@mkboth{\MakeUppercase\th@summaryname}{\MakeUppercase\th@summaryname}
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
  \tocspacing
  \th@tocpage
  \if@abbreviations
  \th@abbreviationspage
  \fi
  \if@symbols
	\th@symbolspage
  \fi
  \if@listoftables
	\lotspacing
	\th@lotpage
  \fi
  \if@listoffigures
	\lofspacing
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

\renewenvironment{thebibliography}[1]{%
    \BolumSagdaKalsinNolu
    \chapter*{\th@bibname}             % Default head from makeschapterhead
    \vspace*{6pt} 							    % Incase to adjust vspace 
    \singlespacing
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@bibname}
    \@mkboth{\MakeUppercase\th@bibname}{\MakeUppercase\th@bibname}
    \list{\@biblabel{\@arabic\c@enumiv}}%
         {\settowidth\labelwidth{\@biblabel{#1}}%
          \leftmargin\labelwidth
          %\advance\leftmargin\labelsep % no labelsep in author year
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

\else

\bibliographystyle{itubib_num}

\renewenvironment{thebibliography}[1]{%
    \BolumSagdaKalsinNolu
    \chapter*{\th@bibname}             % Default head from makeschapterhead
    \vspace*{6pt} 							    % Incase to adjust vspace 
    \singlespacing
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@bibname}
    \@mkboth{\MakeUppercase\th@bibname}{\MakeUppercase\th@bibname}
    \list{\@biblabel{\@arabic\c@enumiv}}
    	     {\settowidth\labelwidth{\@biblabel{#1}}
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \advance\leftmargin by 15mm 
          \setlength{\itemindent}{-15mm}		
          \@openbib@code
          \usecounter{enumiv}
          \let\p@enumiv\@empty
          \renewcommand\theenumiv{\@arabic\c@enumiv}}
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000
    \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
    \endlist}

\fi
%===================================== APPENDIX PAGE SETTINGS =========================

\newcommand{\th@appendixcoverpage}{
    \BolumSagdaKalsinNolu
    \chapter*{\th@appendixname}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@appendixname}%
    \@mkboth{\MakeUppercase\th@appendixname}{\MakeUppercase\th@appendixname}
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
    \chapter*{\th@resumename}
    \phantomsection
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\th@resumename}%
    \@mkboth{\MakeUppercase\th@resumename}{\MakeUppercase\th@resumename}
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