%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*기초통계량*/
proc print data=&lib..M01;
where v7<-10 and v7^=.;
run;
/*국회확정안에서 삭감 비율(v7)이 1/10을 넘어가는 변수가 존재 1/10이상 감소한 변수를 제외한 기초통계량과 비교할 수 있도록 코딩*/

proc means data=&lib..M01;
var v14 v21 v6 v7;
run;
proc means data=&lib..M01;
var v14 v21 v6 v7;
where v7>-10;
run;

proc means data=&lib..M01;
var v14 v21 v6 v7;
class FSCL_YY;
run;
proc means data=&lib..M01;
var v14 v21 v6 v7;
class FSCL_YY;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v14;
vline FSCL_YY / response=v21 y2axis stat=mean;
run;
proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v14;
vline FSCL_YY / response=v21 y2axis stat=mean;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v6;
vline FSCL_YY / response=v7 y2axis stat=mean;
run;
proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v6;
vline FSCL_YY / response=v7 y2axis stat=mean;
where v7>-10;
run;

proc means data=&lib..M01;
var v14 v21 v6 v7;
class OFFC_NM;
run;
proc means data=&lib..M01;
var v14 v21 v6 v7;
class OFFC_NM;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar OFFC_NM / response=v14;
vline OFFC_NM / response=v21 y2axis stat=mean;
run;
proc sgplot data=&lib..M01;
vbar OFFC_NM / response=v14;
vline OFFC_NM / response=v21 y2axis stat=mean;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar OFFC_NM / response=v6;
vline OFFC_NM / response=v7 y2axis stat=mean;
run;
proc sgplot data=&lib..M01;
vbar OFFC_NM / response=v6;
vline OFFC_NM / response=v7 y2axis stat=mean;
where v7>-10;
run;

proc means data=&lib..M01;
var v14 v21 v6 v7;
class v22;
run;
proc means data=&lib..M01;
var v14 v21 v6 v7;
class v22;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar v22 / response=v14;
vline v22 / response=v21 y2axis stat=mean;
run;
proc sgplot data=&lib..M01;
vbar v22 / response=v14;
vline v22 / response=v21 y2axis stat=mean;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar v22 / response=v6;
vline v22 / response=v7 y2axis stat=mean;
run;
proc sgplot data=&lib..M01;
vbar v22 / response=v6;
vline v22 / response=v7 y2axis stat=mean;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v14 group=v22 groupdisplay=cluster;
vline FSCL_YY / response=v21 y2axis stat=mean group=v22 groupdisplay=cluster;
run;
proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v14 group=v22 groupdisplay=cluster;
vline FSCL_YY / response=v21 y2axis stat=mean group=v22 groupdisplay=cluster;
where v7>-10;
run;

proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v6 group=v22 groupdisplay=cluster;
vline FSCL_YY / response=v7 y2axis stat=mean group=v22 groupdisplay=cluster;
run;
proc sgplot data=&lib..M01;
vbar FSCL_YY / response=v6 group=v22 groupdisplay=cluster;
vline FSCL_YY / response=v7 y2axis stat=mean group=v22 groupdisplay=cluster;
where v7>-10;
run;

proc means data=&lib..var007;
var DUSEAMT DUSEAMT_per;
class CITM_CD_Cate;
run;

proc sgplot data=&lib..var007;
vbar CITM_CD_Cate / response=DUSEAMT;
vline CITM_CD_Cate / response=DUSEAMT_per y2axis stat=mean;
run;

proc sgplot data=&lib..var007;
vbar FSCL_YY / response=DUSEAMT group=CITM_CD_Cate groupdisplay=cluster;
vline FSCL_YY / response=DUSEAMT_per y2axis stat=mean group=CITM_CD_Cate groupdisplay=cluster;
run;



/*reg01: 단위사업 당 불용액(비율 사용 X)*/
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
proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v15=v19 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;
/*단위사업 별 분석에서는 관계가 있는 것으로, 소관별에서는 관계가 없는 것으로 나타남*/



/*전년도 불용액과 올해 불용액의 상관관계*/
proc corr data=&lib..M01;
var v21;
with v19;
where v21>0 and v21<1 and v19>0 and v19<1;
run;
proc sgplot data=&lib..M01;
scatter x=v19 y=v21;
where v21>0 and v21<1 and v19>0 and v19<1;
run;



/*예산 지출분류에 따른 불용액 차이 유무*/
proc glm data=&lib..var007;
class CITM_CD_Cate;
model DUSEAMT_per=CITM_CD_Cate/solution noint;
run;



/*완성된 회귀분석 식*/
proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x7 x8 v22 FSCL_YY OFFC_NM/solution noint;
run;



/*reg04/x6를 이용, 더미변수가 증감액의 감소*/
proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x6 v7*x6 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x6 v7*x6 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x7 x8 FSCL_YY OFFC_NM/solution noint;
run;



/*reg04/x5를 이용, 더미변수가 증감액의 증가*/
proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x5 v7*x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x5 v7*x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x7 x8 FSCL_YY OFFC_NM/solution noint;
run;



/*reg05*/
proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x7 v7*x7 x8 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x8 v7*x8 x7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 FSCL_YY OFFC_NM/solution noint;
run;



/*reg06/정권초: 정권 1년차*/
proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x3 v7*x3 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x3 v7*x3 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x7 x8 FSCL_YY OFFC_NM/solution noint;
run;



/*reg06/정권초: 정권 1, 2년차*/
proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x4 v7*x4 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M02;
class v22 FSCL_YY OFFC_NM;
model v21=v7 x4 v7*x4 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x7 x8 FSCL_YY OFFC_NM/solution noint;
run;
