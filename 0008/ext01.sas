%let dir=D:\Kwonhee\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

%macro json(String05, table, date_s, date_e);

	%do date_want=&date_s %to &date_e;
	data L001_&date_want;run;

		%let string02=1;
		%do %until (&check=200);

		%let url=&string05?key=&string01&type=json&pindex=&string02&psize=100&accnut_year=&date_want;

		filename out "&dir.SeriesDataOut.txt" recfm=v lrecl=999999999;
		proc http out=out url="&url" method="post" ct="application/json";
		run;

		data raw;
		infile "&dir.SeriesDataOut.txt" dsd lrecl=999999999 dlm='{}[]:,';
		input raw : $2000.@@;
		if _n_=5 then call symput('check', scan(raw,2));
		run;

		data temp;
		merge raw raw(firstobs=2 rename=(raw=_raw));
		if mod(_n_,2) eq 0;
		run;

		data temp;
		set temp;
		if raw='' then group+1;
		run;

		proc transpose data=temp out=data_one(drop=_:);
		by group;
		id raw;
		var _raw;
		run;

		data L001_&date_want;
		set L001_&date_want data_one;
		run;

		%let string02=%eval(&string02+1);

		%end;

	%end;

  data &table(drop=group RESULT CODE MESSAGE ARBGT list_total_count);
  set L001_&date_s-L001_&date_e;
  if accnut_year="" then delete;
  run;

%mend;

%json(String05=http://lofin.mois.go.kr/HUB/CDDFA, table=table001, date_s=2010, date_e=2017);
%json(String05=http://lofin.mois.go.kr/HUB/GGNSE, table=table002, date_s=2010, date_e=2017);
%json(String05=http://lofin.mois.go.kr/HUB/FIACRV, table=table003, date_s=2010, date_e=2017);
%json(String05=http://lofin.mois.go.kr/HUB/HEDFC, table=table008, date_s=2010, date_e=2017);
%json(String05=http://lofin.mois.go.kr/HUB/JFIED, table=table009, date_s=2010, date_e=2017);

/*아래는 변수 변환과 변수명 입력*/

proc sql;
create table &lib..table001 as
select input(accnut_year, best32.) as accnut_year label="회계연도"
, input(wdr_sfrnd_code, best32.) as wdr_sfrnd_code label="지역코드"
, wdr_sfrnd_code_nm as wdr_sfrnd_code_nm label="지역명"
, input(sfrnd_code, best32.) as sfrnd_code label="자치단체코드"
, sfrnd_nm_korean as sfrnd_nm_korean label="자치단체명"
, input(gnrl_anexptr_stacntam, best32.) as gnrl_anexptr_stacntam label="일반회계"
, input(etc_anexptr_stacntam, best32.) as etc_anexptr_stacntam label="기타특별회계"
, input(pblcorp_anexptr_stacntam, best32.) as pblcorp_anexptr_stacntam label="공기업특별회계"
from table001;
quit;
run;

proc sql;
create table &lib..table002 as
select input(accnut_year, best32.) as accnut_year label="회계연도"
, input(wdr_sfrnd_code, best32.) as wdr_sfrnd_code label="지역코드"
, wdr_sfrnd_code_nm as wdr_sfrnd_code_nm label="지역명"
, input(sfrnd_code, best32.) as sfrnd_code label="자치단체코드"
, sfrnd_nm_korean as sfrnd_nm_korean label="자치단체명"
, realm_code as realm_code label="분야코드"
, realm_nm as realm_nm label="분야명"
, input(p_amt, best32.) as p_amt label="정책사업"
, input(a_amt, best32.) as a_amt label="재무활동"
, input(f_amt, best32.) as f_amt label="행정운영경비"
, creat_dt as creat_dt label="생성날짜"
, crtr_id as crtr_id label="생성아이디"
from table002;
quit;
run;

proc sql;
create table &lib..table003 as
select input(accnut_year, best32.) as accnut_year label="회계연도"
, input(wdr_sfrnd_code, best32.) as wdr_sfrnd_code label="지역코드"
, wdr_sfrnd_nm as wdr_sfrnd_nm label="지역명"
, input(sfrnd_code, best32.) as sfrnd_code label="자치단체코드"
, sfrnd_nm_korean as sfrnd_nm_korean label="자치단체명"
, armok_code as armok_code label="세목코드"
, armok_code_nm_korean as armok_code_nm_korean label="세목명"
, input(level_no, best32.) as level_no label="레벨번호"
, input(amt1, best32.) as amt1 label="총계합계"
, input(amt2, best32.) as amt2 label="일반회계총계"
, input(amt3, best32.) as amt3 label="공기업특별회계총계"
, input(amt4, best32.) as amt4 label="기타특별회계총계"
, input(amt5, best32.) as amt5 label="순계합계"
, input(amt6, best32.) as amt6 label="일반회계순계"
, input(amt7, best32.) as amt7 label="공기업특별회계순계"
, input(amt8, best32.) as amt8 label="기타특별회계순계"
from table003;
quit;
run;

proc sql;
create table &lib..table008 as
select input(accnut_year, best32.) as accnut_year label="회계연도"
, input(wdr_sfrnd_code, best32.) as wdr_sfrnd_code label="지역코드"
, wdr_sfrnd_code_nm as wdr_sfrnd_code_nm label="지역명"
, input(sfrnd_code, best32.) as sfrnd_code label="자치단체코드"
, sfrnd_nm_korean as sfrnd_nm_korean label="자치단체명"
, input(amt1, best32.) as amt1 label="채무잔액"
, input(amt2, best32.) as amt2 label="최종예산액"
, input(rate1, best32.) as rate1 label="예산대비채무비율"
from table008;
quit;
run;

proc sql;
create table &lib..table009 as
select input(accnut_year, best32.) as accnut_year label="회계연도"
, input(wdr_sfrnd_code, best32.) as wdr_sfrnd_code label="지역코드"
, wdr_sfrnd_code_nm as wdr_sfrnd_code_nm label="지역명"
, input(sfrnd_code, best32.) as sfrnd_code label="자치단체코드"
, sfrnd_nm_korean as sfrnd_nm_korean label="자치단체명"
, input(amt1, best32.) as amt1 label="자체수입"
, input(amt2, best32.) as amt2 label="자치단체 예산규모"
, input(rate1, best32.) as rate1 label="재정자립도"
from table009;
quit;
run;
