%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
%let String01=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=;/*apiKey*/
libname &lib "&dir";

proc sql;

create table &lib..D_001_01 as select formName
, unitName
, input(v1, best32.) as v1 label="date"
, v2 label="구분"
, input(v3, best32.) as v3 label="가구수"
, input(v4, best32.) as v4 label="주택수"
, input(v5, best32.) as v5 label="보급률"
, input(v13, best32.) as v13 label="가구수(등록센서스)"
, input(v14, best32.) as v14 label="주택수(등록센서스)"
, input(v15, best32.) as v15 label="보급률(등록센서스)"
from &lib..Ld_001_01;

create table &lib..D_001_02 as select formName
, unitName
, input(v1, best32.) as v1 label="date"
, v2 label="구분"
, input(v3, best32.) as v3 label="가구수"
, input(v4, best32.) as v4 label="주택수"
, input(v5, best32.) as v5 label="보급률"
from &lib..Ld_001_02;

create table &lib..D_006_02 as select formName
, unitName
, v1 label="date"
, v2 label="구분"
, v3 label="규모별"
, input(v4, best32.) as v4 label="사용검사실적"
from &lib..Ld_006_02;

create table &lib..D_007_02 as select formName
, unitName
, input(v1, best32.) as v1 label="date"
, v2 label="구분"
, input(v3, best32.) as v3 label="계"
, input(v4, best32.) as v4 label="자가"
, input(v5, best32.) as v5 label="전세"
, input(v6, best32.) as v6 label="보증금 있는 월세"
, input(v7, best32.) as v7 label="보증금 없는 월세"
, input(v8, best32.) as v8 label="사글세"
, input(v9, best32.) as v9 label="무상"
from &lib..Ld_007_02;

create table &lib..D_007_03 as select formName
, unitName
, input(v1, best32.) as v1 label="date"
, v2 label="시도구분"
, v3 label="소득구분"
, input(v10, best32.) as v10 label="계"
, input(v4, best32.) as v4 label="자가"
, input(v5, best32.) as v5 label="전세"
, input(v6, best32.) as v6 label="보증부 월세"
, input(v7, best32.) as v7 label="월세"
, input(v8, best32.) as v8 label="사글세"
, input(v9, best32.) as v9 label="무상"
from &lib..Ld_007_03;

create table &lib..D_002_02 as select
v1 label="date"
, v2 label="시도구분"
, v3 label="소득구분"
, v4 label="3년 미만"
, v5 label="3~5년 미만"
, v6 label="5~10년 미만"
, v7 label="10~15년 미만"
, v8 label="15~20년 미만"
, v9 label="20년 이상"
from &lib..Ld_002_02;

create table &lib..D_002_03 as select
v1 label="date"
, v2 label="시도구분"
, v3 label="소득구분"
, v4 label="중위수"
, v5 label="평균"
from &lib..Ld_002_03;

create table &lib..D_002_04 as select
v1 label="date"
, v2 label="시도구분"
, v3 label="소득구분"
, v4 label="중위수"
, v5 label="평균"
from &lib..Ld_002_04;

create table &lib..D_002_05 as select
v1 label="date"
, v2 label="시도구분"
, v3 label="소득구분"
, v4 label="자가보유율"
from &lib..Ld_002_05;

quit;
run;
