%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
%let Str01=2e03c601603e4026ad254a417381f602;/*apiKey*/
libname &lib "&dir";

%macro json(name, url);

filename out temp;proc http url="&url" method="get" out=out;run;
libname raw json fileref=out;

proc copy in=raw out=work;run;

data Alldata01;
set Alldata;
if V=0 then group+1;
run;

option validvarname=any;
proc transpose data=Alldata01 out=Alldata02(drop=_: group);
by group;
id P3;
var Value;
run;

proc sort data=Alldata02(where=(date^=""));
by date;
run;

proc sql;
create table &lib..&name as
select b.formName, b.unitName, a.* from Alldata02 as a union join Result_data as b;quit;run;
%mend;

/*(신)주택보급률*/
%json(LD_001_01, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&Str01&form_id=2100&style_num=1&start_dt=2005&end_dt=2016);
  data &lib..Ld_001_01;
  rename
  주택수=v4
  가구수=v3
  구분=v2
  보급률=v5
  date=v1
  '가구수(등록센서스)'n=v13
  '보급률(등록센서스)'n=v15
  '주택수(등록센서스)'n=v14;
  set &lib..Ld_001_01;
  run;

/*(종전)주택보급률*/
%json(LD_001_02, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&Str01&form_id=592&style_num=672&start_dt=1995&end_dt=2014);
  data &lib..Ld_001_02;
  rename
  주택수=v4
  가구수=v3
  구분=v2
  보급률=v5
  date=v1;
  set &lib..Ld_001_02;
  run;

/*전용면적별사용검사실적_월계*/
%json(LD_006_02, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&Str01&form_id=5374&style_num=1&start_dt=201007&end_dt=201803);
  data &lib..Ld_006_02;
  rename
  사용검사실적=v4
  '구  분'n=v2
  규모별=v3
  date=v1;
  set &lib..Ld_006_02;
  run;

/*(일반가구)행정구역별 점유형태*/
%json(LD_007_01, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&Str01&form_id=5402&style_num=1&start_dt=2006&end_dt=2017);
  data &lib..Ld_007_01;
  rename
  사글세=v8
  '보증금 있는 월세'n=v6
  무상=v9
  구분=v2
  전세=v5
  '보증금 없는 월세'n=v7
  계=v3
  date=v1
  자가=v4;
  set &lib..Ld_007_01;
  run;
