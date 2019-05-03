%let dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 comp2 var102 var37 var101 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate4 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 comp2 var102 var37 var101 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate4 rate5/selection=none showpvalues stats=all;
  where var103=0;
run;

/*
proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp3 comp4 var102 var37 var101 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate4 rate5/selection=none showpvalues stats=all;
run;
*/

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 rate4 comp1*rate4 comp2 var102 var37 var101 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 rate4 comp1*rate4 comp2 var102 var37 var101 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate5/selection=none showpvalues stats=all;
  where var103=0;
run;

/*여당, 광역 자치단체장과 정당일치 여부만 판별*/
proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 var102 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate4 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 rate4 comp1*rate4 var102 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 rate4 var102*rate4 var102 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate5/selection=none showpvalues stats=all;
run;

/*여당, 광역 자치단체장과 정당일치 여부 각각 판별*/
proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate4 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=comp1 rate4 comp1*rate4 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=var102 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate4 rate5/selection=none showpvalues stats=all;
run;

proc glmselect data=&lib..var009;
  class wdr_sfrnd_nm(ref="서울") var25(ref="무소속") accnut_year;
  model ratio_remainder=var102 rate4 var102*rate4 wdr_sfrnd_nm var25 accnut_year dt rate1 rate2 rate3 rate5/selection=none showpvalues stats=all;
run;
