%let dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc glmselect data=&lib..var008;
  class wdr_sfrnd_code_nm(ref="서울") var25(ref="무소속") accnut_year;
  model remainder_ratio=var102 var37 var101 var28 var110 wdr_sfrnd_code_nm var25 accnut_year/selection=none showpvalues stats=all;
run;
proc glmselect data=&lib..var008;
  class wdr_sfrnd_code_nm(ref="서울") var25(ref="무소속") accnut_year;
  model remainder_ratio=var102 var37 var101 var28 var110 wdr_sfrnd_code_nm var25 accnut_year/selection=none showpvalues stats=all;
  where var103=1;
run;
proc glmselect data=&lib..var008;
  class wdr_sfrnd_code_nm(ref="서울") var25(ref="무소속") accnut_year;
  model remainder_ratio=var102 var37 var101 var28 var110 wdr_sfrnd_code_nm var25 accnut_year/selection=none showpvalues stats=all;
  where var103=0;
run;


proc glmselect data=&lib..var008;
  class wdr_sfrnd_code_nm(ref="서울") var25(ref="무소속") accnut_year;
  model carry_ratio=var102 var37 var101 var28 var110 wdr_sfrnd_code_nm var25 accnut_year/selection=none showpvalues stats=all;
run;
proc glmselect data=&lib..var008;
  class wdr_sfrnd_code_nm(ref="서울") var25(ref="무소속") accnut_year;
  model carry_ratio=var102 var37 var101 var28 var110 wdr_sfrnd_code_nm var25 accnut_year/selection=none showpvalues stats=all;
  where var103=1;
run;
proc glmselect data=&lib..var008;
  class wdr_sfrnd_code_nm(ref="서울") var25(ref="무소속") accnut_year;
  model carry_ratio=var102 var37 var101 var28 var110 wdr_sfrnd_code_nm var25 accnut_year/selection=none showpvalues stats=all;
  where var103=0;
run;
