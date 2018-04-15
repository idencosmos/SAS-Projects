%let lib=xml;
%let dir=C:\Xml\;
libname &lib "&dir";

%include 'D:\OneDrive\Github\SAS-Projects\환경부 환경통계포털 PM10 미세먼지 시도 및 연도별 비교\env_macro.sas';/*동일 directory 내의 sas를 불러오는 방법을 모르겠습니다. 현재는 env_macro가 있는 위치를 다 작성하여야 합니다.*/

%env(/*95년도부터 15년도까지 연도별 PM10 시도별 미세먼지 관측자료*/

data=PM10_95_15, 
url=http://stat.me.go.kr/nesis/mesp/searchApi/searchApiMainAction.do?task=C&key=8NfRsp8czHw0JtyP5AQ5Yg%3D%3D&tblID=DT_106N_03_0200029&startDate=1995&endDate=2015&dateType=Y&point=default&dataType=data

);

%env(/*01년도부터 17년도까지 월별 PM10 시도별 미세먼지 관측자료*/

data=PM10_01_17, 
url=http://stat.me.go.kr/nesis/mesp/searchApi/searchApiMainAction.do?task=C&key=8NfRsp8czHw0JtyP5AQ5Yg%3D%3D&tblID=DT_106N_03_0200045&startDate=201001&endDate=201709&dateType=M&point=default&dataType=data

);

data xml.Pm10_01_17_02;
set xml.Pm10_01_17;
data=compress(data,'*');
data_num=data+0;
drop PrdDate_ORDINAL data_ORDINAL data_type data_f_str data;
run;

data xml.Pm10_95_15_02;
set xml.Pm10_95_15;
data=compress(data,'*');
data_num=data+0;
if data_num=0 then data_num=.;
drop PrdDate_ORDINAL data_ORDINAL data_type data_f_str data;
run;

proc sql;
create table xml.PM10_01_17_avg as
select distinct a.PrdDate_value, a.data_LeftHakmok0, a.data_TopHakmok0, avg(a.data_num) as avg
from xml.Pm10_01_17_02 as a
group by a.PrdDate_value, a.data_LeftHakmok0;
quit;
run;

proc sql;
create table xml.Pm10_95_15_avg as
select distinct a.PrdDate_value, a.data_LeftHakmok0, a.data_TopHakmok0, avg(a.data_num) as avg
from xml.Pm10_95_15_02 as a
group by a.PrdDate_value, a.data_LeftHakmok0;
quit;
run;

proc sgplot data=xml.Pm10_95_15_avg;
series x=prddate_value y=avg / group=data_LeftHakmok0;	
run;

proc sgplot data=xml.PM10_01_17_avg;
series x=prddate_value y=avg / group=data_LeftHakmok0;
run;

proc sgplot data=xml.PM10_01_17_avg;
series x=prddate_value y=avg / group=data_LeftHakmok0;	
where data_LeftHakmok0="총계" ;
run;

proc sgplot data=xml.PM10_01_17_avg;
series x=prddate_value y=avg / group=data_LeftHakmok0;	
where prddate_value<201500;
run;

