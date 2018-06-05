%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
%let String01=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=;/*apiKey*/
libname &lib "&dir";

/*총조사 주택총괄(행정구역/주택의 종류/ 거주가구수/ 총방수별)*/
%macro Rd00201(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/101/DT_1JU0001/2/1/20180528173906&prdSe=Y&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd00201(data_final=Rd_002_01, date_s=1975, date_e=2018);

/*유형별 매매가격지수 현재 서버 오류로 테이블 추출 불가능*/
%macro Rd00301(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/408/DT_40803_N0001/2/1/20180528202316&prdSe=M&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd00301(data_final=Rd_003_01, date_s=200311, date_e=201804);

/*유형별 주택매매가격지수(2011.6=100)*/
%macro Rd00302(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/408/DT_304N_04_00001/2/1/20180528202619&prdSe=M&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd00302(data_final=Rd_003_02, date_s=198601, date_e=201212);

/*시도별 자산, 부채, 소득 현황*/
%macro Rd00501(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/101/DT_1HDCA01/2/1/20180528203937&prdSe=Y&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd00501(data_final=Rd_005_01, date_s=2012, date_e=2017);

/*지역별 주택건설 인허가실적*/
%macro Rd00601(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/116/DT_MLTM_666/2/1/20180528204401&prdSe=Y&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd00601(data_final=Rd_006_01, date_s=1990, date_e=2017);

/*(일반가구)지역별 소득계층별 점유형태(2006~2016)*/
%macro Rd00701(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/116/DT_MLTM_5405/2/1/20180528205131&prdSe=Y&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd00701(data_final=Rd_007_01, date_s=2006, date_e=2016);

/*건축물거래현황_년도별 유형별(2006~2017)*/
%macro Rd01001(data_final, url, date_s, date_e);data &lib..&data_final;run;	%do date_want=&date_s %to &date_e;

	%let url=http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=NjdhZTg3ZTM1OGEzZGMyOGIyZWE0ZmIxZTBiMDg0ZTg=&format=json&jsonVD=Y&userStatsId=idencosmos/408/DT_408_2006_S0027/2/1/20180605180633&prdSe=Y&startPrdDe=&date_want&endPrdDe=&date_want;

filename out temp;proc http url="&url" method="get" out=out;run;libname raw json fileref=out;data temp;set raw.alldata;if p1='TBL_NM' then group+1;proc transpose data=temp out=data_one(drop=_:);by group;id P1;var Value;run;data data_one;set data_one;run;data &lib..&data_final;set &lib..&data_final data_one;run;%end;data &lib..&data_final;set &lib..&data_final;if _n_=1 then delete;run;
%mend;%Rd01001(data_final=Rd_010_01, date_s=2006, date_e=2017);
