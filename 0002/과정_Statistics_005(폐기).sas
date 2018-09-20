%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";


proc means data=&lib..M01;
var v21;
class x9;
run;

proc sql;
  create table &lib..table004 as select
  a.x9 label="연차"
  , avg(a.v21) as avgv21 label="예산대비 불용액 비율"
  from &lib..M02 as a
  group by a.x9
  ;
quit;
run;

proc sgplot data=&lib..Table004;
  vbar x9 / response=avgv21 datalabel datalabelattrs=(size=12pt) barwidth=0.5;
  xaxis valueattrs=(size=12pt) labelattrs=(size=12pt);
  yaxis valueattrs=(size=12pt) labelattrs=(size=12pt);
run;

/*불용액/세출예산현액*/
proc sql;
  create table &lib..table005 as select
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

/*불용액/세출예산현액*/
proc sql;
  create table &lib..table006 as select
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

proc ttest data=&lib..M02;
  class x5;
  var v21;
  where v6^=0;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=x5 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7^=0 and v22^="기타";
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM;
model v21=v7 x5 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v7^=0 and v22^="기타";
run;



proc ttest data=&lib..M02;
  class x3;
  var v21;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x3(ref="0");
model v21=x3 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v22^="기타";
run;

proc ttest data=&lib..M02;
  class x31;
  var v21;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x31(ref="0");
model v21=x31 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v22^="기타";
run;

proc ttest data=&lib..M02;
  class x4;
  var v21;
run;

proc glmselect data=&lib..M02;
class v22(ref="일반회계") OFFC_NM x4(ref="0");
model v21=x4 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/selection=none showpvalues stats=all;
where v22^="기타";
run;
