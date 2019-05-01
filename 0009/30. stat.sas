%let dir=D:\OneDrive\Github\SAS-Projects\0009\sas7bdat\;
%let lib=A0009;

libname &lib "&dir";

proc sql;
  create table &lib..final as
  select *
  from &lib..var006
  where m1^=. and m5^=. and ANEXP_BDG_CAMT^=. and c5^=.;
quit;
run;

proc glmselect data=&lib..final;
class fscl(ref="일반회계") OFFC_NM FSCL_YY;
model v1=v8 c4 c5 c7 cr11 cr12 cr13 cr14 cr15 cr16 cr17 fscl OFFC_NM FSCL_YY/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..final;
class fscl(ref="일반회계") OFFC_NM FSCL_YY;
model v1=v7 c4 c5 c7 cr11 cr12 cr13 cr14 cr15 cr16 cr17 fscl OFFC_NM FSCL_YY/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..final;
class fscl(ref="일반회계") OFFC_NM FSCL_YY;
model v1=v7 c4 c5 c7 cr11 cr12 cr13 cr14 cr15 cr16 cr17 fscl OFFC_NM FSCL_YY/selection=none showpvalues stats=all;
where v8=1;
run;



proc glmselect data=&lib..final;
class fscl(ref="일반회계") OFFC_NM FSCL_YY;
model v1=v8 v4 v8*v4 c4 c5 c7 cr11 cr12 cr13 cr14 cr15 cr16 cr17 fscl OFFC_NM FSCL_YY/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..final;
class fscl(ref="일반회계") OFFC_NM FSCL_YY;
model v1=v7 v4 v7*v4 c4 c5 c7 cr11 cr12 cr13 cr14 cr15 cr16 cr17 fscl OFFC_NM FSCL_YY/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..final;
class fscl(ref="일반회계") OFFC_NM FSCL_YY;
model v1=v7 v4 v7*v4 c4 c5 c7 cr11 cr12 cr13 cr14 cr15 cr16 cr17 fscl OFFC_NM FSCL_YY/selection=none showpvalues stats=all;
where v8=1;
run;
