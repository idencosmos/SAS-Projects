%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";
/**/
proc glm data=&lib..M01;
class FSCL_YY;
model v14=v6 v10 v17 v8 v3 v1 v2 FSCL_YY/solution; run;
quit;

proc reg data=&lib..M01;
model v14=v6 v10 v17 v8 v3 v1 v2; run;
quit;

proc glm data=&lib..M01;
class FSCL_YY;
model v14=v6 v10 v17 v8 FSCL_YY/solution; run;
quit;

proc reg data=&lib..M01;
model v14=v6 v10 v17 v8; run;
quit;

/**/
proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v12 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v12 w4 w5 v22 FSCL_YY OFFC_NM/solution noint;
run;

/*전년도 예산 불용과 예산 삭감에 관계가 있는가?*/
proc glm data=&lib..M01 plots(maxpoints=none);
model v15=v19;
where v15>-1;
run;
proc corr data=&lib..M01;
var v15;
with v19;
where v15>-1;
run;
proc corr data=&lib..M01;
var v21;
with v19;
where v21>0 and v21<1 and v19>0 and v19<1;
run;
proc sgplot data=&lib..M01;
scatter x=v19 y=v21;
where v21>0 and v21<1 and v19>0 and v19<1;
run;



proc glm data=&lib..var006;
model v40=w41;
where v40>-1;
run;
proc corr data=&lib..var006;
var v40;
with w41;
where v40>-1;
run;


/*예산 지출분류에 따른 불용액 차이 유무*/
proc glm data=&lib..var007;
class CITM_CD_Cate;
model DUSEAMT_per=CITM_CD_Cate/solution noint;
run;

proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 w4 w5 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v15=v19 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;
