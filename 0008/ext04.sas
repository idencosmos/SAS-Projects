%let dir=D:\OneDrive\Github\SAS-Projects\0008\kosis\;
%let lib_dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;

libname &lib "&lib_dir";

%let var_want=PRD_DE/*연도*/ DT/*수*/ C1 C1_NM;

%macro json(data_final, date_s, date_e);
data &lib..&data_final;run;
	%do data_want=&date_s %to &date_e;
	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/101/DT_1YL20631/2/1/20190403155153&prdSe=Y&startPrdDe=&data_want&endPrdDe=&data_want;

	filename out temp;proc http url="&url" method="get" out=out;run;
	libname raw json fileref=out;

	data "&dir.temp";set raw.alldata;if p1='TBL_NM' then group+1;run;

	proc transpose data="&dir.temp" out="&dir.data_one"(drop=_:);by group;id P1;var Value;run;

	data "&dir.data_one";set "&dir.data_one"(keep=&var_want);run;

	data &lib..&data_final;set &lib..&data_final "&dir.data_one";run;
	%end;
data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;

%json(data_final=table007, date_s=2000, date_e=2018);

data &lib..table007(where=(length(C1)>2));
set &lib..table007;
num=substr(C1,1,2);
run;

data local;
input num$ wdr$;
cards;
11 서울
21 부산
22 대구
23 인천
24 광주
25 대전
26 울산
29 세종
31 경기
32 강원
33 충북
34 충남
35 전북
36 전남
37 경북
38 경남
39 제주
;
run;

proc sql;
  create table &lib..var007 as
  select a.*, b.*
  from &lib..table007 as a left join local as b
  on a.num=b.num;
quit;
run;

data &lib..var007;
  set &lib..var007;
  sfrnd_nm_korean=cats(wdr,C1_NM);
  keep sfrnd_nm_korean prd_de dt;
run;

proc sql;
create table &lib..var007 as
select input(PRD_DE, best32.) as PRD_DE
, input(DT, best32.) as DT
, sfrnd_nm_korean
from &lib..var007;
quit;
run;
