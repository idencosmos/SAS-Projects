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
%json(LD_007_02, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&Str01&form_id=5402&style_num=1&start_dt=2006&end_dt=2017);
  data &lib..Ld_007_02;
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
  set &lib..Ld_007_02;
  run;

/*(일반가구)지역별 소득계층별 점유형태(2006~2017)*/
%json(LD_007_03, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&STR01&form_id=5405&style_num=1&start_dt=2006&end_dt=2017);
  data &lib..Ld_007_03;
  rename
  사글세=v8
  '보증부 월세'n=v6
  무상=v9
  시도구분=v2
  소득구분=v3
  전세=v5
  월세n=v7
  계=v10
  date=v1
  자가=v4;
  set &lib..Ld_007_03;
  run;

/*(일반가구)지역별 소득계층별 주택유형(2006~2017)*/
%json(LD_007_04, http://stat.molit.go.kr/portal/openapi/service/rest/getList.do?key=&Str01&form_id=5727&style_num=1&start_dt=2006&end_dt=2017);
  data &lib..Ld_007_04;
  rename
  다세대주택=v7
  연립주택=v6
  시도구분=v2
  단독주택=v4
  계=v10
  '주택이외의 거처'n=v9
  소득구분=v3
  date=v1
  '비거주용 건물내주택'n=v8
  아파트=v5;
  set &lib..Ld_007_04;
  run;

/*(일반가구)지역별 소득별 최초주택마련소요년수(2006~2017)*/
proc import out=&lib..Ld_002_02 datafile="&dir.\테이블(직접 다운로드)\(일반가구)지역별 소득별 최초주택마련소요년수(2006~2017).csv" dbms=csv replace;
run;
  proc sort data=&lib..Ld_002_02;by '년(Annual)'n 시도구분 소득구분; run;
  proc transpose data=&lib..Ld_002_02 out=&lib..Ld_002_02;
    by '년(Annual)'n 시도구분 소득구분;
    id LEVEL1;
    var 값;
  run;
  data &lib..Ld_002_02;
  rename
  '년(Annual)'n=v1
  시도구분=v2
  소득구분=v3
  계=v10
  '3년 미만'n=v4
  '3~5년미만'n=v5
  '5~10년미만'n=v6
  '10~15년미만'n=v7
  '15~20년미만'n=v8
  '20년 이상'n=v9;
  set &lib..Ld_002_02;
  run;

/*연소득 대비 주택가격 비율(PIR)(2006~2017)*/
proc import out=&lib..Ld_002_03 datafile="&dir.\테이블(직접 다운로드)\연소득 대비 주택가격 비율(PIR).csv" dbms=csv replace;
run;
  data &lib..Ld_002_03;
  rename
  date=v1
  시도구분=v2
  소득구분=v3
  중위수=v4
  평균=v5;
  set &lib..Ld_002_03;
  run;

/*월소득 대비 임대료 비율(RIR)(2006~2017)*/
proc import out=&lib..Ld_002_04 datafile="&dir.\테이블(직접 다운로드)\월소득 대비 임대료 비율(RIR).csv" dbms=csv replace;
run;
  data &lib..Ld_002_04;
  rename
  date=v1
  시도구분=v2
  소득구분=v3
  중위수=v4
  평균=v5;
  set &lib..Ld_002_04;
  run;

/*지역별 소득계층별 자가보유율(2006~2017)*/
proc import out=&lib..Ld_002_05 datafile="&dir.\테이블(직접 다운로드)\지역별 소득계층별 자가보유율.csv" dbms=csv replace;
run;
  data &lib..Ld_002_05;
  rename
  date=v1
  시도구분=v2
  소득구분=v3
  자가보유율=v4;
  set &lib..Ld_002_05;
  run;

/*소득계층별 주택가격 대비 대출금 비율(LTV)(2006~2017)*/
proc import out=&lib..Ld_002_06 datafile="&dir.\테이블(직접 다운로드)\소득계층별 주택가격 대비 대출금 비율(LTV).csv" dbms=csv replace;
run;
  data &lib..Ld_002_06;
  rename
  date=v1
  시도구분=v2
  소득구분=v3
  LTV11=v4
  LTV12=v5
  LTV13=v6
  LTV14=v7
  LTV21=v8
  LTV22=v9
  LTV23=v10
  LTV24=v11;
  set &lib..Ld_002_06;
  run;
