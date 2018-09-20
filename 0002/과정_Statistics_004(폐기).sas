%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*연도별 예산과 불용액*/
proc sql;
  create table &lib..table_ld004_FSCL as select
  a.FSCL_YY
  , sum(a.ANEXP_BDG_CAMT) as sum_ANEXP_BDG_CAMT
  , sum(a.DUSEAMT) as sum_DUSEAMT
  from  &lib..longdata_004 as a
  group by a.FSCL_YY
  ;
quit;
run;

/*지출목별 예산과 불용액*/
proc sql;
  create table &lib..table_ld004 as select
  a.CITM_CD
  , sum(a.ANEXP_BDG_CAMT) as sum_ANEXP_BDG_CAMT
  , sum(a.DUSEAMT) as sum_DUSEAMT
  from  &lib..longdata_004 as a
  group by a.CITM_CD
  ;
quit;
run;

/*회계별 예산과 불용액*/
proc sql;
  create table &lib..table_ld004_fscl as select
  a.FSCL_CD
  , sum(a.ANEXP_BDG_CAMT) as sum_ANEXP_BDG_CAMT
  , sum(a.DUSEAMT) as sum_DUSEAMT
  from  &lib..longdata_004 as a
  group by a.FSCL_CD
  ;
quit;
run;

proc sql;
  create table &lib..table001 as select
  a.x9
  , sum(a.v14) as UnencumberedBalance
  , avg(a.v14) as UnencumberedBalance_avg
  , avg(a.v21) as UnencumberedBalance_per
  , avg(a.v10) as budget_avg
  , sum(a.v10) as budget
  , sum(a.v14)/sum(a.v10) as UnencumberedBalance_budget
  from &lib..M02 as a
  group by a.x9
  ;
quit;
run;

proc sql;
  create table &lib..table001_02 as select
  a.FSCL_YY
  , sum(a.v14) as UnencumberedBalance
  , avg(a.v14) as UnencumberedBalance_avg
  , avg(a.v21) as UnencumberedBalance_per
  , avg(a.v10) as budget_avg
  , sum(a.v10) as budget
  , sum(a.v14)/sum(a.v10) as UnencumberedBalance_budget
  from &lib..M02 as a
  group by a.FSCL_YY
  ;
quit;
run;

proc sql;
  create table &lib..table001_03 as select
  a.v22
  , sum(a.v14) as UnencumberedBalance
  , avg(a.v14) as UnencumberedBalance_avg
  , avg(a.v21) as UnencumberedBalance_per
  , avg(a.v10) as budget_avg
  , sum(a.v10) as budget
  , sum(a.v14)/sum(a.v10) as UnencumberedBalance_budget
  from &lib..M02 as a
  group by a.v22
  ;
quit;
run;

proc sql;
  create table &lib..table001_04 as select
  a.FSCL_YY
  , avg(a.v140) as avg140
  , avg(a.v141) as avg141
  , avg(a.v142) as avg142
  , avg(a.v143) as avg143
  , avg(a.v144) as avg144
  , avg(a.v145) as avg145
  , avg(a.v146) as avg146
  from &lib..M02 as a
  group by a.FSCL_YY
  ;
quit;
run;

proc sql;
  create table &lib..table001_05 as select
  avg(a.v140) as avg140
  , avg(a.v141) as avg141
  , avg(a.v142) as avg142
  , avg(a.v143) as avg143
  , avg(a.v144) as avg144
  , avg(a.v145) as avg145
  , avg(a.v146) as avg146
  from &lib..M02 as a
  ;
quit;
run;

proc sql;
  create table &lib..table002 as select
  case when v6>0 then 'increase' when v6<0 then 'decrease' when v6=0 then 'same' end as variance
  , avg(a.v14) as UnencumberedBalance
  , avg(a.v21) as UnencumberedBalance_per
  , avg(a.v10) as budget
  , sum(a.v14)/sum(a.v10) as UnencumberedBalance_budget
  from &lib..M02 as a
  group by variance
  ;
quit;
run;

proc sql;
  create table &lib..table003 as select
  a.FSCL_YY
  , sum(a.v70) as sum70
  , sum(a.v71) as sum71
  , sum(a.v72) as sum72
  , sum(a.v73) as sum73
  , sum(a.v74) as sum74
  , sum(a.v75) as sum75
  , sum(a.v76) as sum76

  , avg(a.v70) as avg70
  , avg(a.v71) as avg71
  , avg(a.v72) as avg72
  , avg(a.v73) as avg73
  , avg(a.v74) as avg74
  , avg(a.v75) as avg75
  , avg(a.v76) as avg76

  , sum(a.v80) as sum80
  , sum(a.v81) as sum81
  , sum(a.v82) as sum82
  , sum(a.v83) as sum83
  , sum(a.v84) as sum84
  , sum(a.v85) as sum85
  , sum(a.v86) as sum86

  , avg(a.v80) as avg80
  , avg(a.v81) as avg81
  , avg(a.v82) as avg82
  , avg(a.v83) as avg83
  , avg(a.v84) as avg84
  , avg(a.v85) as avg85
  , avg(a.v86) as avg86

  , avg(a.v100) as avg100
  , avg(a.v101) as avg101
  , avg(a.v102) as avg102
  , avg(a.v103) as avg103
  , avg(a.v104) as avg104
  , avg(a.v105) as avg105
  , avg(a.v106) as avg106

  , avg(a.v120) as avg120
  , avg(a.v121) as avg121
  , avg(a.v122) as avg122
  , avg(a.v123) as avg123
  , avg(a.v124) as avg124
  , avg(a.v125) as avg125
  , avg(a.v126) as avg126
  from &lib..M02 as a
  group by a.FSCL_YY
  ;
quit;
run;

/*회귀분석*/
proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x9;
model v21=x9 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x3(ref="0");
model v21=x3 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=x9 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v22^="기타";
run;

/*회귀분석*/
proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7^=0 and v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 v7*x5 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7^=0 and v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 x5 v7*x5 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7^=0 and v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7>0 and v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7<0 and v22^="기타";
run;
