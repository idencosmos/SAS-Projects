%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
%let String01=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=;/*apiKey*/
libname &lib "&dir";

/*서울, 수도권, 전국 주택수 변화(2005~2016)*/
proc sgplot data=&lib..D_001_01;
vline v1 / response=v4 group=v2;
vline v1 / response=v14 group=v2;
where v2="전국" or v2="수도권" or v2="서울";
run;

/*서울, 수도권, 지방, 전국 주택수 변화(1995~2014)*/
proc sgplot data=&lib..D_001_02;
vline v1 / response=v4 group=v2;
where v2="전국" or v2="수도권" or v2="서울" or v2="지방";
run;

/*아파트 가격지수(전국)*/
proc sgplot data=&lib..D_003_02;
scatter x=v1 y=v9 / group=v4;
where v2="전국";
run;

/*아파트 가격지수(서울)*/
proc sgplot data=&lib..D_003_02;
scatter x=v1 y=v9 / group=v4;
where v2="서울";
run;

/*가계 자산 비중*/
proc sgplot data=&lib..D_005_01(where=(v4="전국"));
vline v1 / response=v9 group=v6;
where v6="자산" or v6="부채" or v6="경상소득" or v6="근로소득";
run;

/*가계 자산 비중*/
proc sgplot data=&lib..D_005_01(where=(v4="서울"));
vline v1 / response=v9 group=v6;
where v6="자산" or v6="부채" or v6="경상소득" or v6="근로소득";
run;

/*가계 자산 비중*/
proc sgplot data=&lib..D_005_01(where=(v4="수도권"));
vline v1 / response=v9 group=v6;
where v6="자산" or v6="부채" or v6="경상소득" or v6="근로소득";
run;

/*가계 자산 비중*/
proc sgplot data=&lib..D_005_01(where=(v4="비수도권"));
vline v1 / response=v9 group=v6;
where v6="자산" or v6="부채" or v6="경상소득" or v6="근로소득";
run;

/*서울, 수도권, 전국 주택보급률 변화(2005~2016)*/
proc sgplot data=&lib..D_001_01;
vline v1 / response=v5 group=v2;
vline v1 / response=v15 group=v2;
where v2="전국" or v2="수도권" or v2="서울";
run;

/*서울, 수도권, 지방, 전국 주택보급률 변화(1995~2014)*/
proc sgplot data=&lib..D_001_02;
vline v1 / response=v5 group=v2;
where v2="전국" or v2="수도권" or v2="서울" or v2="지방";
run;

/*주택 건설 호수 추이*/
proc sgplot data=&lib..D_006_01;
vline v1 / response=v9 group=v2;
where v2="실적" or v2="서울" or v2="수도권";
run;

/*주택 건설 호수 추이(총계)*/
proc sgplot data=&lib..D_006_02;
scatter x=v1 y=v4 / group=v3;
where v2="총계";
run;

/*주택 건설 호수 추이(서울)*/
proc sgplot data=&lib..D_006_02;
scatter x=v1 y=v4 / group=v3;
where v2="서울";
run;

/*주택 건설 호수 추이(수도권)*/
proc sgplot data=&lib..D_006_02;
scatter x=v1 y=v4 / group=v3;
where v2="수도권소계";
run;

/*주택 건설 호수 추이(지방)*/
proc sgplot data=&lib..D_006_02;
scatter x=v1 y=v4 / group=v3;
where v2="지방소계";
run;

/*점유 형태별 가구 수 비율*/
proc sgplot data=&lib..D_007_01;
vline v1 / response=v4;
vline v1 / response=v5;
vline v1 / response=v6;
vline v1 / response=v7;
vline v1 / response=v8;
vline v1 / response=v9;
where v2="전국";
run;

/*점유 형태별 가구 수 비율*/
proc sgplot data=&lib..D_007_01;
vline v1 / response=v4;
vline v1 / response=v5;
vline v1 / response=v6;
vline v1 / response=v7;
vline v1 / response=v8;
vline v1 / response=v9;
where v2="서울";
run;

/*점유 형태별 가구 수 비율*/
proc sgplot data=&lib..D_007_01;
vline v1 / response=v4;
vline v1 / response=v5;
vline v1 / response=v6;
vline v1 / response=v7;
vline v1 / response=v8;
vline v1 / response=v9;
where v2="경기";
run;
