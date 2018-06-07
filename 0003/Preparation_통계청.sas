%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
%let String01=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=;/*apiKey*/
libname &lib "&dir";

data &lib..D_002_01;
set &lib..RD_002_01(keep=PRD_DE C1_NM C1 C2_NM C2 C3_NM C3 ITM_NM DT UNIT_NM);
v1=PRD_DE+0;
v2=C1_NM;
v3=C1;
v4=C2_NM;
v5=C2+0;
v6=C3_NM;
v7=C3+0;
v8=ITM_NM;
v9=DT+0;
v10=UNIT_NM;
keep v1-v10;
run;

data &lib..D_003_02;
set &lib..RD_003_02(keep=PRD_DE C1_NM C1 C2_NM C2 ITM_NM DT);
v1=PRD_DE;
v2=C1_NM;
v3=C1;
v4=C2_NM;
v5=C2;
v8=ITM_NM;
v9=DT+0;
keep v1-v10;
run;

data &lib..D_005_01;
set &lib..RD_005_01(keep=PRD_DE C1_NM C1 C2_NM C2 C3_NM C3 ITM_NM DT UNIT_NM);
v1=PRD_DE+0;
v2=C1_NM;
v3=C1;
v4=C2_NM;
v5=C2;
v6=C3_NM;
v7=C3;
v8=ITM_NM;
v9=DT+0;
v10=UNIT_NM;
keep v1-v10;
run;

data &lib..D_006_01;
set &lib..RD_006_01(keep=PRD_DE C1_NM C1 ITM_NM DT UNIT_NM);
v1=PRD_DE+0;
v2=C1_NM;
v3=C1;
v8=ITM_NM;
v9=DT+0;
v10=UNIT_NM;
keep v1-v10;
run;

data &lib..D_007_01;
set &lib..RD_007_01(keep=PRD_DE C1_NM C1 C2_NM C2 ITM_NM DT UNIT_NM);
v1=PRD_DE+0;
v2=C1_NM;
v3=C1;
v4=C2_NM;
v5=C2;
v8=ITM_NM;
v9=DT+0;
v10=UNIT_NM;
keep v1-v10;
run;

data &lib..RD_010_01;
set &lib..RD_010_01(keep=PRD_DE C1_NM C1 C2_NM C2 ITM_NM DT UNIT_NM);
v1=PRD_DE+0;
v2=C1_NM;
v3=C1;
v4=C2_NM;
v5=C2;
v8=ITM_NM;
v9=DT+0;
v10=UNIT_NM;
keep v1-v10;
run;
proc sort data=&lib..RD_010_01; by v1 v2 v4 v10;
run;
proc transpose data=&lib..RD_010_01 out=&lib..RD_010_01;
  by v1 v2 v4 v10;
  id v8;
  var v9;
run;
proc sql;
create table &lib..D_010_01 as select
v1 label="date"
, v2 label="행정구역"
, v4 label="구분"
, v10 label="단위"
, '동(호)수'n as v5 label="동(호)수"
, 면적 as v6 label="면적"
from &lib..Rd_010_01;

create table &lib..D_010_02 as select
v1
, v4
, v10
, sum(case when v2="서울특별시" or v2="경기도" or v2="인천광역시" then v5 else 0 end) as v11 label="수도권"
, sum(case when v2^="전국" and v2^="서울특별시" and v2^="경기도" and v2^="인천광역시" then v5 else 0 end) as v12 label="수도권 외"
, sum(case when v2="서울특별시" or v2="경기도" or v2="인천광역시" then v6 else 0 end) as v21 label="수도권"
, sum(case when v2^="전국" and v2^="서울특별시" and v2^="경기도" and v2^="인천광역시" then v6 else 0 end) as v22 label="수도권 외"
from &lib..D_010_01 group by v1, v4, v10;
quit;
run;
