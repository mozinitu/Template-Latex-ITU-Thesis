\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{itutez}[2024/12/31]

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

%====================================== TEZ DERLEME SEÇENEKLERİ ======================================
% LANGUAGE:
\newif\if@yazaryil
\@yazaryilfalse
\DeclareOption{yazaryil}{\@yazaryiltrue}
\DeclareOption{numarali}{\@yazaryilfalse}
% LANGUAGE:
\newif\if@ingilizce
\@ingilizcefalse
\DeclareOption{ingilizce}{\@ingilizcetrue}
\DeclareOption{turkce}{\@ingilizcefalse}
% DEGREE:
\newif\if@Doktora
\newif\if@YuksekLisans
\newif\if@Lisans
\DeclareOption{doktora}{\@Doktoratrue}
\DeclareOption{yukseklisans}{\@YuksekLisanstrue}
\DeclareOption{lisans}{\@Lisanstrue}
% PRINT TYPE:
\newif\if@Onluarkali
\@Onluarkalitrue
\DeclareOption{onluarkali}{\PassOptionsToClass{twoside}{report}\@Onluarkalitrue}
\DeclareOption{tekyonlu}{\PassOptionsToClass{oneside}{report}\@Onluarkalifalse}
% COVER TYPE:
\newif\if@Hardcopy
\@Hardcopytrue
\DeclareOption{online}{\@Hardcopyfalse}
\DeclareOption{bez}{\@Hardcopytrue}
% INSTITUTE- FOR GRADUATE DEGREES:
\newif\if@Bilisim
\newif\if@Avrasya
\newif\if@Lisansustu
\newif\if@SosyalBilimler
\newif\if@Enerji
\DeclareOption{bilisim}{\@Bilisimtrue}
\DeclareOption{avrasya}{\@Avrasyatrue}
\DeclareOption{lisansustu}{\@Lisansustutrue}
\DeclareOption{sosyalbilimler}{\@SosyalBilimlertrue}
\DeclareOption{enerji}{\@Enerjitrue}
% FACULTY - FOR UNDERGRADUATE DEGREES:
\newif\if@UcakUzay
\newif\if@ElektrikElektronik 								% Elektrik-Elektronik Fakültesi - SBÖ
\newif\if@Makina
\DeclareOption{ucakuzay}{\@UcakUzaytrue}
\DeclareOption{elektrikelektronik}{\@ElektrikElektroniktrue} 			% Elektrik-Elektronik Fakültesi - SBÖ
\DeclareOption{makina}{\@Makinatrue} 			% Elektrik-Elektronik Fakültesi - SBÖ
\ProcessOptions
%=================================== LOADING CLASS AND PACKAGES =====================================
\LoadClass[a4paper,onecolumn,12pt]{report}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc} % Türkçe karakter girebiliriz
% \RequirePackage[showframe,showcrop]{geometry}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{mathptmx} % MS Times font
\RequirePackage[open,openlevel=1]{bookmark}
\RequirePackage{hyperref}\hypersetup{hidelinks}
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
% Not required
% \RequirePackage{appendix} % maybe in the future
% \RequirePackage{ifthen} % goodbye
% \RequirePackage{cite} % old cite package

%========================================= CAPTION SETTINGS =========================================
\DeclareCaptionLabelSeparator{colon}{ \bf{:} } 				% Proper colomn separation in the figure labels - SBÖ
\DeclareCaptionLabelFormat{subfigure}{\figurename#1~\thefigure\alph{subfigure}}
\captionsetup[table]{labelfont=bf,labelsep=colon,position=top,justification=justified,skip=6pt}
\captionsetup[figure]{labelfont=bf,labelsep=colon,position=bottom,justification=justified,skip=6pt} % -12
\subcaptionsetup[figure]{labelformat=subfigure,labelfont=bf,font=normalsize,labelsep=colon,position=bottom,justification=justified,skip=6pt}

%========================================= EQUATION SETTINGS =========================================


%========================================= ENUMARATE SETTINGS ========================================
\renewcommand\labelitemi{\normalsize$\bullet$} % Set the bullet size similar to the word template
% \setlist{itemsep=6pt, parsep=6pt, topsep=6pt}
\setlength{\labelsep}{.5em}            % Enumeration  
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
\newlength{\ChapterUstenBosluk}
\setlength{\ChapterUstenBosluk}{18mm} 
\newlength{\UstenBosluk}
\setlength{\UstenBosluk}{14mm} 

%============================= TOC, LOT AND LOF RELATED PARAGPRAPH SKIPS ============================
\newlength{\LoFparskip}     %% List of Figure parskip 08-05-2006
\setlength{\LoFparskip}{0em}

\newlength{\LoTparskip}     %% List of Table parskip 08-05-2006
\setlength{\LoTparskip}{0em}

\newlength{\ToCparskip}     %% Table of Content parskip 08-05-2006
\setlength{\ToCparskip}{0em}

%============================== SETTINGS BETWEEN onaypage AND CHAPTERS ==============================
\newif\if@SembolListesiVar  %% Sembol Listesi Olsun mu?
\@SembolListesiVarfalse

\newif\if@KisaltmaListesiVar%% Kisaltma Listesi Olsun mu?
\@KisaltmaListesiVarfalse

\newif\if@TabloListesiVar   %% Tablo Listesi Olsun mu?
\@TabloListesiVartrue       %% Default = Var

\newif\if@SekilListesiVar   %% Sekil Listesi Olsun mu?
\@SekilListesiVartrue       %% Default = Var

\newif\if@ToCisDotted       %% ToC Noktalı / Noktasız
\@ToCisDottedfalse          %% Default = Noktasız      - First false then at page 8 it is set to true

\newif\if@ChapterBoldToC    %% ToC da BÖLÜM 1-2.. bold mu?
\@ChapterBoldToCfalse       %% Default = Bold Değil

\newif\if@IthafVar       %% Ithaf var mı?
\@IthafVarfalse          %% Default = False         

\newif\if@OnsozVar       %% Onzoz var mı?
\@OnsozVarfalse          %% Default = False

\newcommand*{\TabloListesiYok}{\@TabloListesiVarfalse}
\newcommand*{\SekilListesiYok}{\@SekilListesiVarfalse}
\newcommand*{\KisaltmaListesiYok}{\@KisaltmaListesiVarfalse}

%====================================== SETTINGS OF KAPAK PAGES ====================================== 
% \newcommand{\th@StoreIn}[2]{\gdef#1{#2}}  % Goodbye

\newcommand*{\baslik}[3]{% If undefined create warning check
  \ifx\relax#1\relax
  \else
  \gdef\@baslikciltbir{#1}
  \fi
  \gdef\@baslikciltiki{#2}
  \gdef\@baslikciltuc{#3}
}

\renewcommand*{\title}[3]{
  \ifx\relax#1\relax
  \else
  \gdef\@titlecoverone{#1}
  \fi
  \gdef\@titlecovertwo{#2}
  \gdef\@titlecoverthree{#3}
}

\newcommand*{\yazar}[2]{
  \ifx\relax#1\relax
  \else
    \ifx\relax#2\relax
    \else
    \gdef\@isimsoyisim{#1 #2}
    \gdef\@soyisimisim{#2, #1}
    \fi
  \fi
}

\newcommand*{\ogrencino}[1]{\gdef\@ogrencino{#1}}

\newcommand*{\unvan}[1]{\gdef\@Unvan{#1}}

\newcommand*{\anabilimdali}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\@AnaBilimDali{#1}
  \fi
  \gdef\@Department{#2}
}

\newcommand*{\program}[2]{
  \gdef\@Program{#1}
  \gdef\@Programme{#2}
}

\newcommand*{\ithaf}[1]{\@IthafVartrue\gdef\@Ithaf{#1}}

\newcommand{\danisman}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\@danisman{#1}
  \fi
  \gdef\@danismanuniv{#2}
}

\newcommand{\advisor}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\@advisor{#1}
  \fi
  \gdef\@advisoruniv{#2}
}

\newcommand*{\esdanisman}[2]{
  \gdef\@esdanisman{#1}
  \gdef\@esdanismanuniv{#2}
}

\newcommand*{\coadvisor}[2]{
  \gdef\@coadvisor{#1}
  \gdef\@coadvisoruniv{#2}
}

\newcommand*{\juriBir}[2]{
  \gdef\@juribir{#1}
  \gdef\@juribiruniv{#2}
}

\newcommand*{\juriIki}[2]{
  \gdef\@juriiki{#1}
  \gdef\@juriikiuniv{#2}
}

\newcommand*{\juriUc}[2]{
  \gdef\@juriuc{#1}
  \gdef\@juriucuniv{#2}
}

\newcommand*{\juriDort}[2]{
  \gdef\@juridort{#1}
  \gdef\@juridortuniv{#2}
}

\newcommand*{\juriBes}[2]{
  \gdef\@juribes{#1}
  \gdef\@juribesuniv{#2}
}

\newcommand*{\tarih}[2]{
  \ifx\relax#1\relax
  \else
  \gdef\@tarih{#1}
  \fi
  \gdef\@date{#2}
}

\newcommand*{\tarihKucuk}[2]{
  \gdef\@tarihKucuk{#1}
  \gdef\@dateKucuk{#2}
}

\newcommand*{\tezvermetarih}[2]{
  \gdef\@tezvermetarih{#1}
  \gdef\@submissiondate{#2}
}

\newcommand*{\tezsavunmatarih}[2]{
  \gdef\@tezsavunmatarih{#1}
  \gdef\@defencedate{#2}
}

%====================================== INSTITUTES SETTINGS =========================================
     \if@Bilisim
      \def\@Enstitubir{Bilişim Enstitüsü}
      \def\@Enstituiki{}	
      \def\@Institutebir{Informatics Institute}
      \def\@Instituteiki{} 							
    \fi
    \if@Lisansustu
      \def\@Enstitubir{Lisansüstü Eğitim Enstitüsü}
      \def\@Enstituiki{}		
      \def\@Institutebir{Graduate School}
      \def\@Instituteiki{} 									% FBE ingilizce yeni baslik icin
    \fi
    \if@SosyalBilimler
      \def\@Enstitubir{Sosyal Bilimler Enstitüsü}
      \def\@Enstituiki{}		      
      \def\@Institutebir{The Graduate School of Arts}            		
      \def\@Instituteiki{and Social Sciences} 					
    \fi
    \if@Enerji
      \def\@Enstitubir{Enerji Enstitüsü}
      \def\@Enstituiki{}		
      \def\@Institutebir{Institute of Energy}
      \def\@Instituteiki{} 									
    \fi
    \if@Avrasya
      \def\@Enstitubir{Avrasya Yer Bilimleri}
      \def\@Enstituiki{Enstitüsü}		
      \def\@Institutebir{Eurasia Institute of}                   	
      \def\@Instituteiki{Earth Sciences} 						
    \fi
%======================================= FACULTIES SETTINGS =========================================
    \if@UcakUzay
	    \def\@Enstitubir{Uçak ve Uzay Bilimleri Fakültesi}
	    \def\@Enstituiki{}		
	    \def\@Institutebir{FACULTY OF AERONAUTICS AND}
	    \def\@Instituteiki{ASTRONAUTICS}
    \fi
    \if@ElektrikElektronik 									% Added recently - SBÖ
    	\def\@Enstitubir{Elektrik-Elektronik Fakültesi}
	    \def\@Enstituiki{}		
    	\def\@Institutebir{FACULTY OF ELECTRICAL AND}
    	\def\@Instituteiki{ELECTRONICS}
    \fi
    \if@Makina									
    	\def\@Enstitubir{Makina Fakültesi}
	    \def\@Enstituiki{}		
    	\def\@Institutebir{FACULTY OF MECHANICAL}
    	\def\@Instituteiki{ENGINEERING}
    \fi

%========================= KAPAK AND EKLERIN INGILIZCE TURKCE TANIMLAMALARI ==========================
\if@Doktora
  \def\TezSeviyesiEN{Ph.D. THESIS}
  \def\TezSeviyesiTR{DOKTORA TEZİ}
  \def\TezUnvanEN{Ph.D.}
  \def\TezUnvanTR{Doktora}
  \def\TezIsimEN{dissertation}
  \def\TezIsimTR{tezini}
\fi
\if@YuksekLisans
  \def\TezSeviyesiEN{M.Sc. THESIS}
  \def\TezSeviyesiTR{YüKSEK LİSANS TEZİ}
  \def\TezUnvanEN{M.Sc.}
  \def\TezUnvanTR{Yüksek Lisans}
  \def\TezIsimEN{thesis}
  \def\TezIsimTR{tezini}
\fi
\if@Lisans
  \def\TezSeviyesiEN{GRADUATION THESIS}
  \def\TezSeviyesiTR{BİTİRME ÇALIŞMASI}
  \def\TezUnvanEN{B.Sc.}
  \def\TezUnvanTR{Lisans}
  \def\TezIsimEN{graduation project}
  \def\TezIsimTR{bitirme çalışmasını}
\fi
\def\@EnstituEN{
  \ifx\@Instituteiki\@empty
  \@Institutebir
  \else
  \@Institutebir\ \@Instituteiki
  \fi
}
\def\@EnstituUpperEN{
  ISTANBUL TECHNICAL UNIVERSITY
  \raisebox{1.6pt}{\footnotesize$\bigstar$}
  \MakeUppercase{\@Institutebir}
}
\def\@EnstituLowerEN{
  \MakeUppercase{\@Instituteiki}
}
\def\@EnstituTR{
  \ifx\@Enstituiki\@empty
  \@Enstitubir
  \else
  \@Enstitubir\ \@Enstituiki
  \fi
}
\def\@EnstituUpperTR{
  İSTANBUL TEKNİK ÜNİVERSİTESİ
  \raisebox{1.6pt}{\footnotesize$\bigstar$}
  \MakeUppercase{\@Enstitubir}
}
\def\@EnstituLowerTR{
  \MakeUppercase{\@Enstituiki}
}
\def\BaslikEN{
  \@titlecoverone
  \ifx\@titlecovertwo\@empty
  \else
  \ \@titlecovertwo
  \ifx\@titlecoverthree\@empty
  \else
  \ \@titlecoverthree
  \fi
  \fi
  }
\def\BaslikTR{
  \@baslikciltbir
  \ifx\@baslikciltiki\@empty
  \else
  \ \@baslikciltiki
  \ifx\@baslikciltuc\@empty
  \else
  \ \@baslikciltuc
  \fi
  \fi
  }
\def\AnabilimBaslikEN{Department}
\def\AnabilimBaslikTR{Anabilim Dalı}
\def\ProgramBaslikEN{Programme}
\def\ProgramBaslikTR{Program}
\def\VermeTarihiBaslikEN{Date of Submission}
\def\VermeTarihiBaslikTR{Tezin Enstitüye Verildiği Tarih}
\def\SavunmaTarihiBaslikEN{Date of Defense Examination}
\def\SavunmaTarihiBaslikTR{Tezin Savunulduğu Tarih}
\def\DanismanBaslikEN{Thesis Advisor}
\def\DanismanBaslikTR{Tez Danışmanı}
\def\EsDanismanBaslikEN{Co-Advisor}
\def\EsDanismanBaslikTR{Eş Danışman}
\def\JuriBaslikEN{Members of the Examining Committee}
\def\JuriBaslikTR{Diğer Jüri Üyeleri}
\def\EklerinBasligiEN{APPENDICES}
\def\EklerinBasligiTR{EKLER}
\def\TarihBuyukEN{\@date}
\def\TarihBuyukTR{\@tarih} 	

\if@ingilizce
  \def\TezSeviyesi{\TezSeviyesiEN}
  \def\@Enstitu{\@EnstituEN}
  \def\@EnstituUpper{\@EnstituUpperEN}
  \def\@EnstituLower{\@EnstituLowerEN}
  \def\Baslik{\BaslikEN}
  \def\Anabilim{\@Department}
  \def\AnabilimBaslik{\AnabilimBaslikEN}
  \def\Program{\@Programme}
  \def\ProgramBaslik{\ProgramBaslikEN}
  \def\TarihBuyuk{\TarihBuyukEN}
  \def\TarihKucuk{\@dateKucuk}
  \def\VermeTarihi{\@submissiondate}
  \def\VermeTarihiBaslik{\VermeTarihiBaslikEN}
  \def\SavunmaTarihi{\@defencedate}
  \def\SavunmaTarihiBaslik{\SavunmaTarihiBaslikEN}
  \def\DanismanBaslik{\DanismanBaslikEN}
  \def\JuriBaslik{\JuriBaslikEN}
  \def\EklerinBasligi{\EklerinBasligiEN}
\else
  \def\TezSeviyesi{\TezSeviyesiTR}
  \def\@Enstitu{\@EnstituTR}
  \def\@EnstituUpper{\@EnstituUpperTR}
  \def\@EnstituLower{\@EnstituLowerTR}
  \def\Baslik{\BaslikTR}
  \def\Baslikbir{\@baslikciltbir}
  \def\Baslikiki{\@baslikciltiki}
  \def\Baslikuc{\@baslikciltuc}
  \def\Anabilim{\@AnaBilimDali}
  \def\AnabilimBaslik{\AnabilimBaslikTR}
  \def\Program{\@Program}
  \def\ProgramBaslik{\ProgramBaslikTR}
  \def\TarihBuyuk{\TarihBuyukTR}
  \def\TarihKucuk{\@tarihKucuk}
  \def\VermeTarihi{\@tezvermetarih}
  \def\VermeTarihiBaslik{\VermeTarihiBaslikTR}
  \def\SavunmaTarihi{\@tezsavunmatarih}
  \def\SavunmaTarihiBaslik{\SavunmaTarihiBaslikTR}
  \def\DanismanBaslik{\DanismanBaslikTR}
  \def\JuriBaslik{\JuriBaslikTR}
  \def\EklerinBasligi{\EklerinBasligiTR}
\fi

%==================== CHAPTER VE SECTION TÜRKÇE/İNGİLİZCE İSİM TANIMLARI ======================
% \newcommand*{\DoChapCenter}{}
% \newcommand*{\ChapHead}[1]{\protect\ChFnt \protect\DoChapCenter #1}
\newcommand*{\abstractnameToC}{SUMMARY}
\newcommand*{\ozetnameToC}{ÖZET}
\newcommand*{\onaynameToC}{KABUL VE ONAY}
\def\abstractname{SUMMARY}
\def\ozetname{ÖZET}
\if@ingilizce
\newcommand*{\chapternameToC}{CHAPTER}
\newcommand*{\contentsnameToC}{TABLE OF CONTENTS}
\newcommand*{\listtablenameToC}{LIST OF TABLES}
\newcommand*{\listfigurenameToC}{LIST OF FIGURES}
\newcommand*{\onsoznameToC}{FOREWORD}
\newcommand*{\ozgecmisnameToC}{CURRICULUM VITAE}
\newcommand*{\appendixnameToC}{APPENDICES}
\newcommand*{\symbolnameToC}{SYMBOLS}
\newcommand*{\bibnameToC}{REFERENCES}
\newcommand*{\kisaltmanameToC}{ABBREVIATIONS}
\def\chaptername{CHAPTER}
\def\contentsname{TABLE OF CONTENTS}
\def\listtablename{LIST OF TABLES}
\def\listfigurename{LIST OF FIGURES}
\def\prefacename{FOREWORD}
\def\ozgecmisname{CURRICULUM VITAE}
\def\appendixname{APPENDIX}
\def\symbolname{SYMBOLS}
\def\bibname{REFERENCES}
\def\kisaltmaname{ABBREVIATIONS} 
\def\indexname{INDEX}
\def\figurename{Figure}
\def\tablename{Table}
\def\partname{PART}
\def\glossaryname{DICTIONARY}
\else
\newcommand*{\chapternameToC}{BÖLÜM}
\newcommand*{\contentsnameToC}{İÇİNDEKİLER}
\newcommand*{\listtablenameToC}{ÇİZELGE LİSTESİ}
\newcommand*{\listfigurenameToC}{ŞEKİL LİSTESİ}
\newcommand*{\onsoznameToC}{ÖNSÖZ}
\newcommand*{\ozgecmisnameToC}{ÖZGEÇMİŞ}
\newcommand*{\appendixnameToC}{EKLER}
\newcommand*{\symbolnameToC}{SEMBOLLER}
\newcommand*{\bibnameToC}{KAYNAKLAR}
\newcommand*{\kisaltmanameToC}{KISALTMALAR}
\def\chaptername{BÖLÜM}
\def\contentsname{İÇİNDEKİLER}
\def\listfigurename{ŞEKİL LİSTESİ}
\def\listtablename{ÇİZELGE LİSTESİ} 
\def\prefacename{ÖNSÖZ}
\def\ozgecmisname{ÖZGEÇMİŞ}
\def\appendixname{EK}
\def\symbolname{SEMBOLLER}
\def\bibname{KAYNAKLAR}
\def\kisaltmaname{KISALTMALAR}
\def\indexname{DİZİN}
\def\figurename{Şekil}
\def\tablename{Çizelge}
\def\partname{KISIM}
\def\glossaryname{TERİMLER SÖZLÜĞÜ}
\fi

%====================================== SETTINGS OF FONT SIZES ======================================= 
\newcommand*{\titleFnt}{%% Title Font Boyutu
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}             
\newcommand*{\titleAnaBilimDaliFnt}{%% Anabilimdalı Font Boyutu
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}
\newcommand*{\DestekFnt}{%% Destek Font Boyutu
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}            
\newcommand*{\TOCFnt}{
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}
\newcommand*{\HdFnt}{%% Başlıklar Kalın (Bold) olacak
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}                       
  \newcommand*{\ChFnt}{%% Chapter Font Boyutu 
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}                  
\newcommand*{\ScFnt}{%% Section Font Boyutu
  % \normalfont\normalsize
  \fontfamily{ptm}\fontseries{b}\fontsize{12}{12}
  \selectfont}   

%================================ CHAPTER VE SECTION NUMARA TANIMLARI ===================================
% \newcommand*{\ChapterStyle}{\ChFnt}
% \newcommand*{\SectionStyle}{\ScFnt}

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

%=============================== SATIR ARASI BOŞLUKLARININ TANIMLARI =================================
\newlength{\defbaselineskip}
\setlength{\defbaselineskip}{\baselineskip} % Actually \baselineskip is 1.2 linespacing = 14.5pt
\newcommand{\setlinespacing}[1]{\setlength{\baselineskip}{#1\defbaselineskip}}         %% Not used
\newcommand{\doublespacing}{\setlength{\baselineskip}{2.0\defbaselineskip}}           %%\doublespacing = 2
\newcommand{\singlespacing}{\setlength{\baselineskip}{\defbaselineskip}}               %%\singlespacing = 1.2
\newcommand{\oneandonehalf}{\setlength{\baselineskip}{1.5\defbaselineskip}}           %%\oneandonehalf = 1.5
\newcommand{\LoFspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}               %%\LoFspacing = 1.2
\newcommand{\LoTspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}               %%\LoTspacing = 1.2
\newcommand{\ToCspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}               %%\ToCspacing = 1.2
\newcommand{\Baslikspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}            %%\Baslikspacing = 1.2

%================================ TOC, LOT VE LOF YAPISI OLUŞTURULUYOR ================================

\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{4}
\newcommand*{\ToCLineisDotted}{\@ToCisDottedtrue}
\ToCLineisDotted

% Above and Below the Chapter TOC Settings - SBÖ
% Part settings in TOC
\renewcommand*\l@part[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{1.5em}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      #1\nobreak
       \if@ToCisDotted
        \leaders\hbox{$\m@th\hbox{.}$} 							% cleaders is more flush than leaders - SBÖ
       \fi 
      \hfil\nobreak#2\par 										% Added to make the dots come next to the page numbers - SBÖ
      \penalty\@highpenalty
    \endgroup
  \fi
}

% Chapter Settings in TOC - SBÖ  
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
     \if@ToCisDotted
       \leaders\hbox{$\m@th\hbox{.}$} 							% cleaders is more flush than leaders - SBÖ
     \fi
    \hfil\nobreak#2\par % Added to make the dots come next to the page numbers - SBÖ
    \penalty\@highpenalty
   \endgroup
  \fi}

% section, subsection, subsubsection Settings in TOC  
\def\@tocline#1#2#3#4#5{
  \vskip 1\p@
  \ifnum #1=\c@tocdepth \else
    \vskip \z@ \@plus.2\p@  
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M 
     \leavevmode %\bfseries 										% sub sections unbolded - SBÖ
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
      \if@ToCisDotted
       \leaders\hbox{$\m@th\hbox{.}$}   					%cleaders or xleaders is more flush than leaders - SBÖ
       \fi
     \hfill
     \hfil\nobreak#5 % Added to make the dots come next to the page numbers - SBÖ
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

\newif\if@loflotpagebold
\@loflotpageboldtrue % If LOF and LOT page numbers are bold or not - SBÖ
% \@loflotpageboldfalse % If the page numbers in LOF and LOT are unbold - SBÖ

% LOT ve LOF Settings - SBÖ
\def\@lofline#1#2#3#4#5{
	\vskip 1\p@
	\ifnum #1=\c@tocdepth \else
	\vskip \z@ \@plus.2\p@
	{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
		\parindent #2\relax\@afterindenttrue
		\interlinepenalty\@M \normalsize  					% normalsize font - SBÖ
		\leavevmode %\bfseries 								% Figure and table captions are not bold
		\@tempdima #3\relax
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{#4}\nobreak
		\if@ToCisDotted
		\leaders\hbox{$\m@th\hbox{.}$} 						%cleaders or xleaders is more flush than leaders - SBÖ
		\fi
		\hfill
		\hfil\nobreak\if@loflotpagebold\bfseries\fi#5 % Added to make the dots come next to the page numbers with bold page numbers - SBÖ
		\par}
	\fi}

%==================== WARNINGS IF SOME IMPORTANT PARTS ARE MISSING WHEN COMPILED ======================

\newcommand*{\@baslikciltbir}{
     \ClassError{itutez}{*** You must specify the TITLE of your thesis! ***}
     {Use the \protect\baslik{} command in the preamble.}}

\newcommand*{\@titlecoverone}{
     \classerror{itutez}{*** you must specify the english title of your thesis! ***}
     {use the \protect\title{} command in the preamble.}}

\newcommand*{\@tarih}{
    \ClassError{itutez}{*** You must specify the DATE of your thesis! ***}
    {Use the \protect\tarih{} command in the preamble.}}

\newcommand*{\@advisor}{
    \ClassError{itutez}{*** You must specify the ADVISOR of your thesis! ***}
    {Use the \protect\advisor{} command in the preamble.}}

\newcommand*{\@danisman}{
    \ClassError{itutez}{*** You must specify the DANISMAN of your thesis! ***}
    {Use the \protect\danisman{} command in the preamble.}}

\newcommand*{\@isimsoyisim}{
    \ClassError{itutez}{*** You must specify the AUTHOR of your thesis! ***}
    {Use the \protect\yazar{}{} command in the \MessageBreak
        preamble. The first arg is your first name and \MessageBreak
        middle initial.  The second arg is your last name.}}

\newcommand{\@AnaBilimDali}{
    \ClassError{itutez}{*** You must specify an AnaBilimDali! ***}
    {Use the \protect\anabilimdali[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\@abstractStash}{
    \ClassError{itutez}{*** You must specify an abstract! ***}
    {Use the \protect\abstractpage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\@ozetStash}{
    \ClassError{itutez}{*** You must specify an ozet! ***}
    {Use the \protect\OzetPage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\@ozgecmisStash}{
    \ClassError{itutez}{*** You must specify an ozgecmis ***}
    {Use the \protect\OzgecmisPage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\@sirtStash}{
    \ClassError{itutez}{*** You must specify an kapak sirti ***}
    {Use the \protect\SirtPage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

%==================================== NEW COMMANDS ARE DEFINED ========================================
% Tesekkur, symbol lists, and abbreviation lists were set to false earlier now they are all true - SBÖ
\newcommand{\summary}[1]{\gdef\@abstractStash{#1}}
\newcommand{\ozet}[1]{\gdef\@ozetStash{#1}}
\newcommand{\ozgecmis}[1]{\gdef\@ozgecmisStash{#1}}
\newcommand{\sirt}[1]{\gdef\@sirtStash{#1}}
\newcommand{\onsoz}[1]{\@OnsozVartrue\gdef\@onsozStash{#1}}
\newcommand{\sembollistesi}[1]{\@SembolListesiVartrue\gdef\@symbollistStash{#1}}
\newcommand{\kisaltmalistesi}[1]{\@KisaltmaListesiVartrue\gdef\@kisaltmalistStash{#1}}

%================================ SAYFA YAPISI İLE İLGİLİ TANIMLAMALAR ================================
% \geometry{driver=pdftex}
\if@Onluarkali
\geometry{a4paper,onecolumn,twoside,paperheight=297mm,paperwidth=210mm}
\else
\geometry{a4paper,onecolumn,paperheight=297mm,paperwidth=210mm}
\fi
\geometry{bindingoffset=0mm,foot=12mm}
\geometry{textheight=247mm,textwidth=145mm,top=25mm,bottom=25mm,left=40mm,right=25mm}
\setlength{\parindent}{0pt}             %% Paragrafların ilk satırlarının ne kadar içeri gireceği
\setlength\parskip{6pt} 
\raggedbottom
% \flushbottom

%=================================== HEADER AND FOOTNOTE SETTINGS ===================================
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt} 
% Needs to be checked
\setlength{\skip\footins}{1cm}
\setlength\footnotemargin{.35em}
\addtolength{\footnotesep}{1mm}

%========================================== PAGE SETTINGS ===========================================
% Setting of even pages that do not have page numbers and odd page setting that does have a page number - SBÖ
\def\BolumSagdaKalsin{
  \clearpage
  \if@twoside
    \ifodd\c@page 											% Count the page - SBÖ
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
% Setting of odd pages and even pages that do have a page number - SBÖ
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
\newif\if@appendix\@appendixfalse
\newif\if@eklerkapak\@eklerkapakfalse

\def\@makechapterhead#1{%
    \vspace*{\ChapterUstenBosluk}	
    {\parindent \z@ \raggedright
    % \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@appendix
        \interlinepenalty\@M 
        % \ChFnt #1
        \ChFnt \appendixname\ \thechapter\ :\ \normalfont #1
        \par\nobreak
        \vskip 18\p@ 	% Due to single space
      \else
        \interlinepenalty\@M
        \ChFnt \thechapter. \;#1 
        \par\nobreak
        \vskip 12\p@ 								% This is the Chapter 18 pt spacing after the title - SBÖ
      \fi
    \else
    \fi
  }
}

%==================================== UNNUMBERED CHAPTER TITLE SETTINGS ==========================================

\def\@makeschapterhead#1{%
  \vspace*{\ChapterUstenBosluk}	
  {\parindent \z@ \raggedright
    % \normalfont
    \if@eklerkapak
      \interlinepenalty\@M
      \ChFnt #1
      \par\nobreak
      \vskip 18\p@  % due to single space
    \else
      \interlinepenalty\@M
      \ChFnt #1
      \par\nobreak
      \vskip 12\p@
    \fi
  }
}

%======================== SECTION, SUBSECTION, AND SUBSUBSECTION SETTINGS =============================
% Skip settings by SBÖ are true 
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
  \if@appendix % Appendix için
  \vspace*{18pt}\goodbreak
  \refstepcounter{section}
  \noindent
  \leavevmode
  \begingroup
  \ScFnt
  \appendixname\ \thesection\ :\ \normalfont #2 % \quad
  % \appendixname\ \thesection % \quad
  \endgroup\goodbreak 
  \vskip 12pt\nobreak  
  \addcontentsline{toc}{section}{\appendixname\ \protect\numberline{\thesection}}
  \else
  \vspace*{12pt}\goodbreak
  \refstepcounter{section}
  \noindent
  \leavevmode
  \begingroup
  \ScFnt
  \thesection\;\ 
  #2\quad
  \endgroup\goodbreak 
  \vskip 6pt\nobreak  
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}
  \fi
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
% Numbered and Unnumbered subsubsection settings - SBÖ
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
% Unnumbered subsubsubsection settings - SBÖ
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

% TOC'de part tanımları - SBÖ 
\def\@part[#1]#2{
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}
      \addcontentsline{toc}{part}{#1}
    \else
       \relax  
    \fi
    {\centering
     \interlinepenalty \@M
    %  \normalfont
     \ifnum \c@secnumdepth >-2\relax
      \ChFnt \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
    \ChFnt #2\par}
    \@endpart
}

% Chapter settings - SBÖ
\renewcommand\chapter{
                      \global\@topnum\z@ 		% Prevents figures from going at top of page. - SBÖ
                      \@afterindentfalse 		% No indent in first paragraph. - SBÖ
                      \secdef\@chapter\@schapter}


% TOC'de Chapter tanımları - SBÖ 
\def\@chapter[#1]#2{
  \BolumSagdaKalsinNolu
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}
    \if@appendix
      \addtocontents{toc}{\protect\addvspace{0\p@}}							
      % \addcontentsline{toc}{section}{#1}										
      \addcontentsline{toc}{section}{\appendixname\ \thechapter}										
	  \else
      \addtocontents{toc}{\protect\addvspace{-10\p@}}
      \addcontentsline{toc}{chapter}{\thechapter. #1}
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

%======================================== DIŞ KAPAK SETTINGS ==========================================

\newcommand*{\DisKapakPage}{
    \thispagestyle{empty}

    \if@Hardcopy 
    \else
    \color{black} % appliesto 2nd page
    \if@Doktora
    \begin{textblock*}{\textwidth}[0,0](40mm,10mm)
    \pagecolor{black}
    \color[rgb]{0.5529,0.4549,0.2941}
    \end{textblock*}
    \fi
    \if@YuksekLisans
    \begin{textblock*}{\textwidth}[0,0](40mm,10mm)
    \pagecolor[rgb]{0,0.1569,0.3373}
    \color[rgb]{0.5529,0.4549,0.2941}
    \end{textblock*}
    \fi
    \fi

    \if@Lisansustu
    \begin{textblock*}{\textwidth}[0,0](39mm,30.5mm)
    \fi
    \if@Bilisim	
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@SosyalBilimler
    \begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
    \fi
    \if@Avrasya
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@UcakUzay
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@ElektrikElektronik
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@Makina
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    	\singlespacing  			
    	\renewcommand{\ULdepth}{2.75pt} 	
    	\renewcommand{\ULthickness}{1.5pt} 
    	\centering
      \uline{\bf\@EnstituUpper}	
	\end{textblock*}

  \if@ingilizce
    \ifx\@Instituteiki\@empty
    \else
      \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
      \singlespacing
      \renewcommand{\ULdepth}{2.75pt} 	
      \renewcommand{\ULthickness}{1.5pt} 	
      \centering
      \uline{\MakeUppercase{\bf\@EnstituLowerEN}}
      \end{textblock*}
    \fi
  \else % Turkce
    \ifx\@Enstituiki\@empty
    \else
      \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
      \singlespacing
      \renewcommand{\ULdepth}{2.75pt} 	
      \renewcommand{\ULthickness}{1.5pt} 	
      \centering
      \uline{\MakeUppercase{\bf\@EnstituLowerTR}}
      \end{textblock*}
    \fi
  \fi

  \if@ingilizce  
  \begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    \titleFnt\Baslikspacing \@titlecoverone \\
    \ifx\@titlecovertwo\@empty
    \else
      \titleFnt\Baslikspacing \@titlecovertwo \\
      \ifx\@titlecoverthree\@empty
      \else
        \titleFnt\Baslikspacing \@titlecoverthree \\
      \fi
    \fi
	\end{textblock*}
  \else % Turkce
  \begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    		\titleFnt\Baslikspacing \@baslikciltbir \\
        \ifx\@baslikciltiki\@empty
        \else
		      \titleFnt\Baslikspacing \@baslikciltiki \\
          \ifx\@baslikciltuc\@empty
          \else
            \titleFnt\Baslikspacing \@baslikciltuc \\
          \fi
        \fi
	\end{textblock*}
  \fi

	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
	    \centering
	    \titleFnt \TezSeviyesi  \\
	\end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
	    \centering
        \titleFnt \@isimsoyisim  \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
	   \centering
	   \titleAnaBilimDaliFnt \Anabilim\\
    \end{textblock*}
 
 	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
 	   \centering
 	   \titleAnaBilimDaliFnt \Program \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	   \centering
       \titleFnt \TarihBuyuk \\
    \end{textblock*}

\vspace*{\fill}

\if@Hardcopy
\else
\newpage
\nopagecolor
\fi

}

%======================================== İÇ KAPAK SETTINGS =========================================== 
\newcommand*{\IcKapakPageEN}{			
	\BolumSagdaKalsin
	\thispagestyle{empty}
	\if@Lisansustu
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@Bilisim	
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@SosyalBilimler
		\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
	\fi
	\if@Avrasya
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@UcakUzay
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@ElektrikElektronik
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
  \if@Makina
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
  \fi
		\singlespacing  				
		\renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.5pt} 	
		\centering
		\uline{{\bf\@EnstituUpperEN}} \\ 
	\end{textblock*}

  \ifx\@Instituteiki\@empty
  \else
  \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\singlespacing
    \renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.5pt} 	
		\centering
		\uline{\MakeUppercase{\bf\@EnstituLowerEN}}
	\end{textblock*}
  \fi
      
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    \titleFnt\Baslikspacing \@titlecoverone \\
    \ifx\@titlecovertwo\@empty
    \else
      \titleFnt\Baslikspacing \@titlecovertwo \\
      \ifx\@titlecoverthree\@empty
      \else
        \titleFnt\Baslikspacing \@titlecoverthree \\
      \fi
    \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\titleFnt \TezSeviyesiEN  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\titleFnt \@isimsoyisim  \\
		\titleFnt (\@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\titleAnaBilimDaliFnt \@Department \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\titleAnaBilimDaliFnt \@Programme \\
	\end{textblock*}
	
  \begin{textblock*}{\textwidth}[0,0](40mm,230mm)
	  \centering
    \titleFnt\DanismanBaslikEN : \titleFnt \@advisor \\
	\end{textblock*}

  \begin{textblock*}{\textwidth}[0,0](40mm,235mm)
	  \centering
    \ifx\@coadvisor\@empty
    \else
	  \titleFnt\EsDanismanBaslikEN : \titleFnt \@coadvisor \\
    \fi
  \end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\titleFnt \TarihBuyukEN \\
	\end{textblock*}
	
	\vspace*{\fill}
}

%===================================== TÜRKÇE İÇ KAPAK SETTINGS =======================================
\newcommand*{\IcKapakPageTR}{	
	\BolumSagdaKalsin
	\thispagestyle{empty}
	\if@Lisansustu
		\begin{textblock*}{\textwidth}[0,0](39mm,30.5mm)
	\fi
	\if@Bilisim	
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@SosyalBilimler
		\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
	\fi
	\if@Avrasya
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@UcakUzay
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@ElektrikElektronik
		\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
  \if@Makina
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
  \fi
		\singlespacing  					
		\renewcommand{\ULdepth}{2.75pt} 
		\renewcommand{\ULthickness}{1.5pt}
		\centering
		\uline{{\bf\@EnstituUpperTR}}
	\end{textblock*}

  \ifx\@Enstituiki\@empty
  \else
  \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\singlespacing
    \renewcommand{\ULdepth}{2.75pt} 	
		\renewcommand{\ULthickness}{1.5pt} 	
		\centering
		\uline{\MakeUppercase{\bf\@EnstituLowerTR}}
	\end{textblock*}
  \fi
	
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
    		\titleFnt\Baslikspacing \@baslikciltbir \\
        \ifx\@baslikciltiki\@empty
        \else
		      \titleFnt\Baslikspacing \@baslikciltiki \\
          \ifx\@baslikciltuc\@empty
          \else
            \titleFnt\Baslikspacing \@baslikciltuc \\
          \fi
        \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\titleFnt \TezSeviyesiTR  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\titleFnt \@isimsoyisim  \\
		\titleFnt (\@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\titleAnaBilimDaliFnt \@AnaBilimDali \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\titleAnaBilimDaliFnt \@Program \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,230mm)
		\centering
		\titleFnt\DanismanBaslikTR : \titleFnt \@danisman \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,235mm)
		\centering
    \ifx\@esdanisman\@empty
    \else
    \titleFnt\EsDanismanBaslikTR : \titleFnt \@esdanisman \\
    \fi
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\titleFnt \TarihBuyukTR \\
	\end{textblock*}
	
	\vspace*{\fill}
}

%========================================= ONAY PAGE SETTINGS ========================================= - SBÖ
\newcommand{\OnayPage}{	
\BolumSagdaKalsin
\hyphenpenalty=5000
\singlespacing
\if@ingilizce 			
	\begin{textblock*}{\textwidth}[0,0](40mm,50.5mm)
	\@isimsoyisim,\ a \TezUnvanEN\ student of ITU \@Enstitu\ student ID \@ogrencino,\ successfully defended the \TezIsimEN\ entitled ``\Baslik'', which he/she prepared after fulfilling the requirements specified in the associated legislations, before the jury whose signatures are below.
  \end{textblock*}
 
  \begin{textblock*}{\textwidth}[0,0](40mm,100.5mm)
	\begin{tabular}{@{}p{33mm} l l}
		\bf{Thesis Advisor :}& \bf{\@advisor} & 
		\hspace*{44pt} \hfill........................  \\	
		& \@advisoruniv  &  \\
    \ifx\@coadvisor\@empty
    \else  
    &  &  \\
		&  &  \\
		\bf{Co-advisor :}& \bf{\@coadvisor} & 
		\hspace*{44pt}\hfill........................   \\	
		& \@coadvisoruniv  &  \\
    \fi
		&  &  \\
		&  &  \\
		\bf{Jury Members :}& \bf{\@juribir} & 
		\hspace*{44pt}	\hfill........................     \\	
		& \@juribiruniv  &  \\
		&  &  \\
		&  &  \\
    & \bf{\@juriiki} & 
		\hspace*{44pt}\hfill........................  \\	
	 	& \@juriikiuniv  &  \\
		&  &  \\
	  &  &  \\	
    \ifx\@juriuc\@empty
    \else
    & \bf{\@juriuc} & 
		\hspace*{44pt}\hfill........................  \\	
		& \@juriucuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\@juridort\@empty
    \else
    &	\bf{\@juridort} & 
		\hspace*{44pt}\hfill........................  \\
		& \@juridortuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\@juribes\@empty
    \else
    & \bf{\@juribes} & 
		\hspace*{44pt}	\hfill........................\\
		& \@juribesuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
	\end{tabular}
  \end{textblock*}

  \begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	\begin{tabular}{@{}l l}
		\bf{Date of Submission~~:} &\hspace*{-10pt}\hfill\bf{\@submissiondate} \\
		\bf{Date of Defense\hspace*{25pt}\hfill:} &\hspace*{-10pt}\hfill\bf{\@defencedate}  \\
	\end{tabular}
  \end{textblock*}

\else
	
  \begin{textblock*}{\textwidth}[0,0](40mm,50.5mm)
  İTÜ, \@Enstitu'nün \@ogrencino\ numaralı \TezUnvanTR\ öğrencisi \@isimsoyisim, ilgili yönetmeliklerin belirlediği gerekli tüm şartları yerine getirdikten sonra hazırladığı ``\Baslik'' başlıklı \TezIsimTR\ aşağıdaki imzaları olan jüri önünde başarı ile sunmuştur.
  \end{textblock*}

\begin{textblock*}{\textwidth}[0,0](40mm,100.5mm)
	\begin{tabular}{@{}p{33mm} l l}
		\bf{Tez Danışmanı :}& \bf{\@danisman} & 
		\hspace*{44pt}\hfill........................ \\
		& \@danismanuniv  &  \\
    \ifx\@esdanisman\@empty
    \else
    &  &  \\
    &  &  \\
    \bf{Eş Danışman :}& \bf{\@esdanisman} & 
    \hspace*{44pt}\hfill........................ \\
    & \@esdanismanuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
		\bf{Jüri Üyeleri :}& \bf{\@juribir} & 
		\hspace*{44pt}\hfill........................ \\
		& \@juribiruniv  &  \\
		&  &  \\
		&  &  \\
		& \bf{\@juriiki} & 
		\hspace*{44pt}\hfill........................ \\
		& \@juriikiuniv  &  \\
		&  &  \\
		&  &  \\
    \ifx\@juriuc\@empty
    \else
    & \bf{\@juriuc} & 
    \hspace*{44pt}\hfill........................ \\
    & \@juriucuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\@juridort\@empty
    \else
    & \bf{\@juridort} & 
		\hspace*{44pt}\hfill........................ \\
		& \@juridortuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
		\ifx\@juribes\@empty
    \else
    & \bf{\@juribes} & 
		\hspace*{44pt}\hfill........................ \\
		& \@juribesuniv  &  \\
    \fi
		&  &  \\
		&  &  \\
	\end{tabular}
\end{textblock*}	

\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	\begin{tabular}{@{}l l}
		\bf{Teslim Tarihi~~:} & \bf{\@tezvermetarih}  \\
		\bf{Savunma Tarihi\hspace*{25pt}\hfill:} & \bf{\@tezsavunmatarih}  \\
	\end{tabular}
\end{textblock*}
	\fi
	\sloppy 
	\vspace*{\fill}
}

%================================== KAPAK PAGE SETTINGS ==================================  

\newcommand{\KapakPage}{
    \if@ingilizce
      \DisKapakPage
      \IcKapakPageEN
      \IcKapakPageTR
      \OnayPage
    \else
      \DisKapakPage
      \IcKapakPageTR
      \IcKapakPageEN
      \OnayPage
    \fi
}

%======================================== İTHAF PAGE SETTINGS ========================================= - SBÖ
\newcommand{\IthafPage}{
  \BolumSagdaKalsinNolu 	
	\vspace*{0.3\textheight}
  \begin{flushright}
	\textbf{\emph{\@Ithaf}}
  \end{flushright}
}

%======================================== ÖNSÖZ PAGE SETTINGS ========================================= - SBÖ
\newcommand{\OnsozPage}{
    \BolumSagdaKalsinNolu
    \chapter*{\prefacename}
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\onsoznameToC}
    \@mkboth{\MakeUppercase\prefacename}{\MakeUppercase\prefacename}
    \vspace*{6pt}
    \singlespacing
    \hyphenpenalty=5000
    \sloppy
    \@onsozStash   % tex file
    \vspace{30pt} \\
    \TarihKucuk \hfill \@isimsoyisim \\
    \vspace*{-2.54mm} \hfill \@Unvan \\
}

%======================================== TOC PAGE SETTINGS =========================================== - SBÖ
\renewcommand\tableofcontents{
    {\BolumSagdaKalsinNolu
    \chapter*{\contentsname}
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\contentsnameToC}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
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
    \setlength{\parskip}{\ToCparskip}
    \@starttoc{toc}
    \setlength{\parskip}{\oldparskip}
    }

\let\TOCPage\tableofcontents

%======================================= ABBR. PAGE SETTINGS ========================================== 

\newcommand{\KisaltmaPage}{
      \BolumSagdaKalsinNolu
      \chapter*{\kisaltmaname}
      \addtocontents{toc}{\protect\addvspace{-10\p@}}
      \addcontentsline{toc}{chapter}{\kisaltmanameToC}
      \@mkboth{\MakeUppercase\kisaltmaname}{\MakeUppercase\kisaltmaname}
      \vspace*{6pt}
      \@kisaltmalistStash
}  

%====================================== SYMBOLS PAGE SETTINGS =========================================     

\newcommand{\SymbolPage}{
      \BolumSagdaKalsinNolu
      \chapter*{\symbolname}
      \addtocontents{toc}{\protect\addvspace{-10\p@}}
      \addcontentsline{toc}{chapter}{\symbolnameToC}
      \@mkboth{\MakeUppercase\symbolname}{\MakeUppercase\symbolname}
      \vspace*{6pt}
      \@symbollistStash
} 

%======================================== LOT PAGE SETTINGS ===========================================
\renewcommand\listoftables{%
    {\BolumSagdaKalsinNolu
    \chapter*{\listtablename}%
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\listtablenameToC}%  
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
    % \vspace*{-18pt}%
    \renewcommand{\ULdepth}{4pt}% 
    \renewcommand{\ULthickness}{1.5pt}% 
    \if@ingilizce
      \hfill\vspace*{0truecm}{\bf\uline{Page}}
    \else
    ~ \hfill\vspace*{0truecm}{\bf\uline{Sayfa}}
    \fi
    \vspace*{-6pt}
    } \\
    \let\orig@numberline\numberline
    \renewcommand*{\numberline}[1]{%
    \orig@numberline{\bf\tablename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}}%
    \setlength{\oldparskip}{\parskip}%
    \setlength{\parskip}{\LoTparskip}%
    \@starttoc{lot}%
    \setlength{\parskip}{\oldparskip}%
    \let\numberline\orig@numberline
    }

\let\LOTPage\listoftables

%======================================== LOF PAGE SETTINGS =========================================== - SBÖ  
\renewcommand\listoffigures{%
    {\BolumSagdaKalsinNolu
    \chapter*{\listfigurename}
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\listfigurenameToC}
    \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}%
    % \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt}%		
    \renewcommand{\ULthickness}{1.5pt}% 	
    \if@ingilizce
      \hfill\vspace*{0truecm}{\bf\uline{Page}}
    \else
      ~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}
    \fi
    \vspace*{-6pt}
    } \\

    \let\orig@numberline\numberline
    \renewcommand*{\numberline}[1]{%
    \orig@numberline{\bf\figurename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}}% 
    \setlength{\oldparskip}{\parskip}%
    \setlength{\parskip}{\LoFparskip}%
    \@starttoc{lof}%
    \setlength{\parskip}{\oldparskip}%
    \let\numberline\orig@numberline
    }

\let\LOFPage\listoffigures

%======================================== ÖZET PAGE SETTINGS ========================================== - SBÖ
\newcommand{\OzetPage}{
    \BolumSagdaKalsinNolu
    \vspace*{\UstenBosluk}
      \begin{center}
        \begin{tabular}{c}
          \titleFnt\Baslikspacing \@baslikciltbir \\
          \ifx\@baslikciltiki\@empty
          \else
            \titleFnt\Baslikspacing \@baslikciltiki \\
            \ifx\@baslikciltuc\@empty
            \else
              \titleFnt\Baslikspacing \@baslikciltuc \\
            \fi
          \fi
        \end{tabular}
      \end{center}
    % \chapter*{\vspace*{-\ChapterUstenBosluk + 18pt}\centering\ozetname} 
    \chapter*{\vspace*{-\ChapterUstenBosluk}\centering\ozetname}
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\ozetnameToC}
    \@mkboth{\MakeUppercase\ozetname}{\MakeUppercase\ozetname}
    \singlespacing
    % \vspace*{18pt}
    % \vspace*{12pt}
    \sloppy
    \@ozetStash   % the actual ozet
}

%======================================= SUMMARY PAGE SETTINGS ======================================== - SBÖ
\newcommand{\SummaryPage}{
    \BolumSagdaKalsinNolu
    \vspace*{\UstenBosluk}
       \begin{center}
        \begin{tabular}{c}
        \titleFnt\Baslikspacing \@titlecoverone \\
        \ifx\@titlecovertwo\@empty
        \else
          \titleFnt\Baslikspacing \@titlecovertwo \\
          \ifx\@titlecoverthree\@empty
          \else
            \titleFnt\Baslikspacing \@titlecoverthree \\
          \fi
        \fi
        \end{tabular}
      \end{center}
    % \chapter*{\vspace*{-\ChapterUstenBosluk + 18pt}\centering\abstractname} 
    \chapter*{\vspace*{-\ChapterUstenBosluk}\centering\abstractname} 
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\abstractnameToC}
    \@mkboth{\MakeUppercase\abstractname}{\MakeUppercase\abstractname}
    \singlespacing
    % \vspace*{18pt}
    % \vspace*{12pt}
    \sloppy
    \@abstractStash   % the actual abstract
}

%========================================= ALL PAGES CALLED ===========================================
\newcommand{\MakeThesisPrologue}{
  \KapakPage
  \pagenumbering{roman}								
  \renewcommand*{\thepage}{\small{\roman{page}}} 
  \setcounter{page}{\if@Onluarkali 5 \else 3 \fi}
  \singlespacing

  \if@IthafVar
  \IthafPage
  \fi
  \if@OnsozVar
	\OnsozPage
  \fi
  \ToCspacing
  \tableofcontents
  \if@KisaltmaListesiVar
  \KisaltmaPage
  \fi
  \if@SembolListesiVar
	\SymbolPage
  \fi
  \if@TabloListesiVar
	\LoTspacing
	\LOTPage
  \fi
  \if@SekilListesiVar
	\LoFspacing
	\LOFPage
  \fi
  \if@ingilizce
  \SummaryPage
  \OzetPage
	\else % Turkce
	\OzetPage		
	\SummaryPage
	\fi

  \BolumSagdaKalsinNolu
  \oneandonehalf
  \pagenumbering{arabic}
  \renewcommand*{\thepage}{\small{\arabic{page}}}
}

%====================================== BIBTEX ICIN TANIMLAMALAR =====================================
\if@ingilizce
  \def\baglac{and}
  \def\etal{et~al.}
  \def\duzenciler{editors}
  \def\duzenci{editor}
  \def\duzenleyen{edited by}
  \def\surum{edition}
  \def\cilt{volume}
  \def\kisasayi{no.}
  \def\sayi{number}
  \def\ssayfa{pp.}
  \def\sayfa{p.}
  \def\bolum{chapter}
  \def\teknikrapor{Technical Report}
  \def\lisanstezi{B.Sc. Thesis}
  \def\yuksektezi{M.Sc. Thesis}
  \def\doktoratezi{Ph.D. Dissertation}
\else
  \def\baglac{ve}
  \def\etal{ve diğerleri}
  \def\duzenciler{(düzenleyenler)}
  \def\duzenci{(düzenleyen)}
  \def\duzenleyen{düzenleyen}
  \def\surum{sürüm}
  \def\cilt{cilt}
  \def\kisasayi{sayı}
  \def\sayi{sayı}
  \def\ssayfa{s.}
  \def\sayfa{s.}
  \def\bolum{bölüm}
  \def\teknikrapor{Teknik Rapor}
  \def\lisanstezi{Lisans Tezi}
  \def\yuksektezi{{\it {Yüksek Lisans Tezi}}}
  \def\doktoratezi{{\it {Doktora Tezi}}}
\fi

%==================================== BIBLIOGRAPHY PAGE SETTINGS ======================================

\renewenvironment{thebibliography}[1]{%
    \BolumSagdaKalsinNolu
    \chapter*{\bibname}             % Default head from makeschapterhead
    \vspace*{6pt} 							    % Incase to adjust vspace 
    \singlespacing
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\bibnameToC}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
    \list{\@biblabel{\@arabic\c@enumiv}}
         {\settowidth\labelwidth{\@biblabel{#1}}
          \leftmargin\labelwidth
          \advance\leftmargin\dimexpr\labelsep
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


%===================================== APPENDICES PAGE SETTINGS =======================================

\newcommand{\EklerKapak}{
    \global \@eklerkapaktrue
    \BolumSagdaKalsinNolu
    \chapter*{\EklerinBasligi}
    \singlespacing
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\appendixnameToC}%
    \@mkboth{\MakeUppercase\appendixnameToC}{\MakeUppercase\appendixnameToC}
  
}

\newcommand{\EklerBolum}{
    \global \@appendixtrue
    \singlespacing
    \appendix
    \renewcommand\thechapter{\@Alph\c@chapter} 		
    \renewcommand\thesection{\thechapter.\arabic{section}} 						
	  \renewcommand{\theequation}{{\bf \thechapter.\arabic{equation}}}
    }


%====================================== ÖZGEÇMİŞ PAGE SETTINGS ======================================== - SBÖ
\newcommand{\OzgecmisPage}{
    \BolumSagdaKalsinNolu
    \chapter*{\ozgecmisname}
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\ozgecmisnameToC}%
    \@mkboth{\MakeUppercase\ozgecmisname}{\MakeUppercase\ozgecmisname}
	  \singlespacing
    \sloppy
    \@ozgecmisStash   % the actual ozgecmis
}

%====================================== SIRT PAGE SETTINGS ======================================== - SBÖ
\newcommand{\SirtPage}{
	\singlespacing
  \sloppy
  \@sirtStash   % the actual Sirt
}

%====================================== THE END ========================================