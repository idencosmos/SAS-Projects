%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*연도별 예산과 불용액*/
proc sql;
  create table &lib..table_ld004_YEAR as select
  FSCL_YY
  , sum(ANEXP_BDG_CAMT)/1000000000000 as sum_ANEXP_BDG_CAMT
  , sum(DUSEAMT)/1000000000000 as sum_DUSEAMT
  from &lib..longdata_004
  group by FSCL_YY
  ;
quit;
run;

/*지출목별 예산과 불용액*/
proc sql;
  create table &lib..table_ld004_ANEXP as select
  CITM_CD
  , sum(ANEXP_BDG_CAMT)/1000000000000 as sum_ANEXP_BDG_CAMT
  , sum(DUSEAMT)/1000000000000 as sum_DUSEAMT
  from  &lib..longdata_004
  group by CITM_CD
  ;
quit;
run;

/*회계별 예산과 불용액*/
proc sql;
  create table &lib..table_ld004_FSCL as select
  a.FSCL_CD
  , sum(a.ANEXP_BDG_CAMT)/1000000000000 as sum_ANEXP_BDG_CAMT
  , sum(a.DUSEAMT)/1000000000000 as sum_DUSEAMT
  from  &lib..longdata_004 as a
  group by a.FSCL_CD
  ;
quit;
run;

/*변수 기초통계량*/
proc means data=&lib..M02 n mean std;
  var v21 v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16;
  where v19^=. and v21^=. and v7^=. and v15^=. and v24^=. and v100^=.;
run;

/*상관관계*/
proc corr data=&lib..M02;
  var v21 v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16;
  where v19^=. and v21^=. and v7^=. and v15^=. and v24^=. and v100^=.;
run;

/*정권 연차별 예산대비 불용액 비율*/
proc sql;
  create table &lib..table004 as select
  a.x9 label="연차"
  , avg(a.v21) as avgv21 format 8.4 label="예산대비 불용액 비율"
  from &lib..M01 as a
  group by a.x9
  ;
quit;
run;

proc sgplot data=&lib..Table004;
  vbar x9 / response=avgv21 datalabel datalabelattrs=(size=12pt) barwidth=0.5;
  xaxis valueattrs=(size=12pt) labelattrs=(size=12pt);
  yaxis valueattrs=(size=12pt) labelattrs=(size=12pt);
run;

proc ttest data=&lib..M01;
  class x3;
  var v21;
run;

proc ttest data=&lib..M01;
  class x31;
  var v21;
run;

proc ttest data=&lib..M01;
  class x4;
  var v21;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x3(ref="0");
model v21=x3 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v22 OFFC_NM/selection=none showpvalues stats=all;
where v19^=. and v21^=. and v7^=.;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x31(ref="0");
model v21=x31 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v22 OFFC_NM/selection=none showpvalues stats=all;
where v19^=. and v21^=. and v7^=.;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x4(ref="0");
model v21=x4 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v22 OFFC_NM/selection=none showpvalues stats=all;
where v19^=. and v21^=. and v7^=.;
run;

/*국회심의과정 예산변동에 따른 불용액*/
proc sql;
  create table &lib..table005 as select
  a.x5
  , a.x6
  , avg(case when a.x6=1 then a.v21 else 0 end) as minus_avg label="예산대비 불용액 비율_감소"
  , avg(case when a.x5=1 then a.v21 else 0 end) as plus_avg label="예산대비 불용액 비율_증가"
  , avg(case when a.x5=0 and a.x6=0 then a.v21 else 0 end) as same_avg label="예산대비 불용액 비율_불변"
  , avg(case when a.x6=1 then a.v14 else 0 end)/1000000000 as minus label="예산대비 불용액_감소"
  , avg(case when a.x5=1 then a.v14 else 0 end)/1000000000 as plus label="예산대비 불용액_증가"
  , avg(case when a.x5=0 and a.x6=0 then a.v14 else 0 end)/1000000000 as same label="예산대비 불용액_불변"
  from &lib..M02 as a
  where v21^=. and v7^=.
  group by a.x5, a.x6
  ;
quit;
run;

proc ttest data=&lib..M02;
  class x5;
  var v21;
  where v19^=. and v21^=. and v7^=. and v6^=0;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=x5 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7^=0 and v7^=.;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7<0;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7>0;
run;
