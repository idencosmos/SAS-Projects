%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*기초통계량*/
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

proc means data=&lib..longdata_001 n mean std min max;
  var EP_AMT;
  class EXE_M;
run;

proc means data=&lib..M02 n mean std min max;
  var v70-v76 v80-v86 v90-v96;
run;



proc means data=&lib..M02 n mean std min max;
  var v19 v15 v24 v100 v101 v102 v103 v104 v105 v106 x16;

run;
