%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=json;
%let String01=WBQMR1000052520180323030651FWHGU;/*apiKey*/
%let var_want=FSCL_YY
EXE_M
OFFC_CD
OFFC_NM
FSCL_CD
FSCL_NM
FLD_CD
FLD_NM
SECT_CD
SECT_NM
PGM_CD
PGM_NM
ACTV_CD
ACTV_NM
ANEXP_BDG_CAMT
EP_AMT
THISM_AGGR_EP_AMT
;

libname &lib "&dir";

%macro json(String05, date_s, date_e);

	%do date_want=&date_s %to &date_e;
	data L001_&date_want;run;

		%let string02=1;
		%do %until (&check=200);

		%let url=&string05?OFFC_CD=&date_want&key=&string01&type=json&pindex=&string02&psize=1000;

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

%json(String05=http://openapi.openfiscaldata.go.kr/VWFOEM, date_s=000, date_e=200);

/*변수명, 변수 형태 변경_start*/
data combine;
set L001_0-L001_200;
keep &var_want;
if FSCL_YY="" then delete;
run;
/*변수명, 변수 형태 변경_end*/

proc sql;
create table &lib..longdata_001 as
select input(FSCL_YY, best32.) as FSCL_YY label="회계년도"
, input(EXE_M, best32.) as EXE_M label="집행월"
, OFFC_CD as OFFC_CD label="소관"
, OFFC_NM as OFFC_NM label="소관명"
, FSCL_CD as FSCL_CD label="회계"
, FSCL_NM as FSCL_NM label="회계명"
, FLD_CD as FLD_CD label="분야코드"
, FLD_NM as FLD_NM label="분야명"
, SECT_CD as SECT_CD label="부문코드"
, SECT_NM as SECT_NM label="부문명"
, PGM_CD as PGM_CD label="프로그램코드"
, PGM_NM as PGM_NM label="프로그램명"
, ACTV_CD as ACTV_CD label="단위사업코드"
, ACTV_NM as ACTV_NM label="단위사업명"
, input(ANEXP_BDG_CAMT, best32.) as ANEXP_BDG_CAMT label="예산(원)"
, input(EP_AMT, best32.) as EP_AMT label="당월집행액(원)"
, input(THISM_AGGR_EP_AMT, best32.) as THISM_AGGR_EP_AMT label="누계집행액(원)"
from combine;
quit;
run;
