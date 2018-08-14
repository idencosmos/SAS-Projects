%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";


proc means data=&lib..M01;
var v21;
class x9;
run;

proc sgplot data=&lib..M02;
  vline x9 / response=v21 y2axis stat=mean;
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
