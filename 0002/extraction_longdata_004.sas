%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=json;
%let String01=WBQMR1000052520180323030651FWHGU;/*apiKey*/
%let var_want=FSCL_YY
OFFC_CD
OFFC_NM
FSCL_CD
FSCL_NM
ACCT_CD
ACCT_NM
FLD_CD
FLD_NM
SECT_CD
SECT_NM
PGM_CD
PGM_NM
ACTV_CD
ACTV_NM
CITM_CD
CITM_NM
ANEXP_BDGAMT_F
ANEXP_BDGAMT_M
PREY_BFWAMT
OVR_EP_AMT
RSVF_EP_DCS_IAMT
RSVF_EP_DCS_MAMT
BDTR_IAMT
BDTR_MAMT
AVDV_IAMT
AVDV_MAMT
FNT_IAMT
FNT_MAMT
ANEXP_BDG_CAMT
EP_AMT
EP_NAMT
NEXT_YY_BFWAMT
DUSEAMT
;

libname &lib "&dir";

%macro json(String05, date_s, date_e);

	%do date_want=&date_s %to &date_e;
	data L001_&date_want;run;

		%let string02=1;
		%do %until (&check=200);

		%let url=&string05?FSCL_YY=&date_want&key=&string01&type=json&pindex=&string02&psize=1000;

		filename out "&dir.SeriesDataOut.txt" recfm=v lrecl=999999999;
		proc http out=out url="&url" method="post" ct="application/json";
		run;

		data raw;
		infile "&dir.SeriesDataOut.txt" dsd lrecl=999999999 dlm='{}[]:,';
		input raw : $2000.@@;
		if _n_=5 then call symput('check', scan(raw,2));
		run;

		data temp;
		merge raw raw(firstobs=2 rename=(raw=_raw));
		if mod(_n_,2) eq 0;
		run;

		data temp;
		set temp;
		if raw='' then group+1;
		run;

		proc transpose data=temp out=data_one(drop=_:);
		by group;
		id raw;
		var _raw;
		run;

		data L001_&date_want;
		set L001_&date_want data_one;
		run;

		%let string02=%eval(&string02+1);

		%end;

	%end;

%mend;

%json(String05=http://openapi.openfiscaldata.go.kr/ExpendituresSettlement, date_s=2000, date_e=2018);

/*변수명, 변수 형태 변경_start*/
data &lib .longdata_004;
set L001_2000-L001_2018;
label FSCL_YY	=회계연도;
label OFFC_CD	=소관;
label OFFC_NM	=소관명;
label FSCL_CD	=회계;
label FSCL_NM=	회계명;
label ACCT_CD=	계정;
label ACCT_NM	=계정명;
label FLD_CD	=분야;
label FLD_NM	=분야명;
label SECT_CD	=부문;
label SECT_NM=	부문명;
label PGM_CD=	프로그램;
label PGM_NM	=프로그램명;
label ACTV_CD	=단위사업;
label ACTV_NM=	단위사업명;
label CITM_CD=	지출목;
label CITM_NM=	지출목명;
label ANEXP_BDGAMT_F=	세출예산액/당초지출계획액(원);
label ANEXP_BDGAMT_M	=세출예산액/수정지출계획액(원);
label PREY_BFWAMT=	전년도이월액(원);
label OVR_EP_AMT=	초과지출승인액(원);
label RSVF_EP_DCS_IAMT	=예비비지출결정증액(원);
label RSVF_EP_DCS_MAMT=	예비비지출결정감액(원);
label BDTR_IAMT	=전용증액(원);
label BDTR_MAMT	=전용감액(원);
label AVDV_IAMT	=이용증액(원);
label AVDV_MAMT	=이용감액(원);
label FNT_IAMT=	이체증액(원);
label FNT_MAMT	=이체감액(원);
label ANEXP_BDG_CAMT	=세출예산현액/지출계획현액(원);
label EP_AMT=	지출액(원);
label EP_NAMT	=지출순액(원);
label NEXT_YY_BFWAMT=	다음년도이월액(원);
label DUSEAMT=	불용액(원);
keep &var_want;
if FSCL_YY="" then delete;
run;
/*변수명, 변수 형태 변경_end*/
