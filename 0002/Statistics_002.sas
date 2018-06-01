%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*1. 불용액이 정권초기에 더 많은가?*/
proc glm data=&lib..M02;
class v22 OFFC_NM x9;
model v21=x9 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
run;

proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=x9 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
run;

/*2. 국회에서 증액된 예산(쪽지예산)은 비효율적으로 집행되는가?*/
proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=v7 x5 v7*x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
run;

proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=v7 x5 v7*x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
where v7^=0;
run;

proc glm data=&lib..M02;
  class v22 OFFC_NM;
  model v21=x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
run;

proc glm data=&lib..M02;
  class v22 OFFC_NM;
  model v21=x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
  where v7^=0;
run;

proc ttest data=&lib..M02;
  class x5;
  var v21;
  where x7^=0;
run;

/*3. 연말에 집중해서 집행되는 예산은 비효율적인가?*/
proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=x7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
run;

proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=v7 x5 x11 v7*x5 v7*x11 x5*x11 v7*x5*x11 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
where v7^=0;
run;

proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=v7 x5 x10 v7*x5 v7*x10 x5*x10 v7*x5*x10 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
where v7^=0;
run;

/*4. 연초에 집행되지 않는 예산은 비효율적인가?*/
proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=x8 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
run;

proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=v7 x5 x15 v7*x5 v7*x15 x5*x15 v7*x5*x15 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
where v7^=0;
run;

proc glm data=&lib..M02;
class v22 OFFC_NM;
model v21=v7 x5 x13 v7*x5 v7*x13 x5*x13 v7*x5*x13 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM x16/solution;
where v7^=0;
run;
