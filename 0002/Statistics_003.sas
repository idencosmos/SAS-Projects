%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*변수 기초통계량*/
proc means data=&lib..M02 n mean std min max;
  var v21 v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16;
run;

/*상관관계*/
proc corr data=&lib..M02;
  var v21 v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16;
run;

/*1. 불용액이 정권초기에 더 많은가?*/
  /*불용액, 세출예산, 국회증감액, 국회증액, 국회감액 기초통계량*/
  proc means data=&lib..M02 n mean std min max;
    var v14 v10 v6;
  run;

  proc means data=&lib..M02 n mean std min max;
    var v6;
    where v6>0;
  run;

  proc means data=&lib..M02 n mean std min max;
    var v6;
    where v6<0;
  run;

  %let option001=stat=mean datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
  proc sgplot data=&lib..M02;
    vline FSCL_YY / response=v10 &option001.;
    xaxis display=(nolabel);
    yaxis display=(nolabel) grid;
    title "연도별 세출예산";
  run;

  %let option001=stat=mean datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
  proc sgplot data=&lib..M02;
    vline FSCL_YY / response=v14 &option001.;
    vline FSCL_YY / response=v6 &option001.;
    xaxis display=(nolabel);
    yaxis display=(nolabel) grid;
    title "연도별 불용액, 국회증감액";
  run;

  /*월별 예산 집행액*/
  proc means data=&lib..longdata_001 n mean std min max;
    var EP_AMT;
    class EXE_M;
  run;

  /*지출분류에 따른 세출예산현액, 불용액*/
  proc means data=&lib..M02 n mean std min max;
    var v80-v86 v70-v76;
  run;

  proc means data=&lib..M02 n mean std min max;
    var v80-v86 v70-v76;
    class FSCL_YY;
  run;

  /*회귀분석*/
  proc glm data=&lib..M02;
  class v22 OFFC_NM x9;
  model v21=x9 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/solution;
  run;

  proc glm data=&lib..M02;
  class v22 OFFC_NM;
  model v21=x9 v19 v15 v24 x16 v100 v101 v102 v103 v104 v105 v106 v22 OFFC_NM/solution;
  run;


/*2. 국회에서 증액된 예산(쪽지예산)은 비효율적으로 집행되는가?*/
  /*국회증액과 국회감액, 변동없음의 불용액 기초통계량*/
  proc means data=&lib..M02 n mean std min max;
    var v21;
    where v6>0;
  run;
  proc means data=&lib..M02 n mean std min max;
    var v21;
    where v6<0;
  run;
  proc means data=&lib..M02 n mean std min max;
    var v21;
    where v6=0;
  run;
  proc means data=&lib..M02 n mean std min max;
    var v21;
  run;

  /*회귀분석*/
  proc glm data=&lib..M02;
  class v22 OFFC_NM;
  model v21=v7 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16 v22 OFFC_NM/solution;
  where v7^=0;
  run;

  proc glm data=&lib..M02;
  class v22 OFFC_NM;
  model v21=v7 v7*x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16 v22 OFFC_NM/solution;
  where v7^=0;
  run;

  proc glm data=&lib..M02;
  class v22 OFFC_NM;
  model v21=v7 x5 v7*x5 v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16 v22 OFFC_NM/solution;
  where v7^=0;
  run;

  proc ttest data=&lib..M02;
    class x5;
    var v21;
    where v7^=0;
  run;
