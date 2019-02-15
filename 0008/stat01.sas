%let dir=D:\Kwonhee\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

%macro series001(title, table, y);
proc sgplot data=&table.;
	series x=accnut_year y=&y / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
  xaxis values=(2010 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  title "&title.";
run;
%mend;
%series001(연도별 집행률, &lib..var003_year, ratio_year);
%series001(연도별 이월액+불용액 비율, &lib..var003_year, rr_year);
%series001(연도별 이월액+불용액, &lib..var003_year, remain_year);

%macro vline001(title, table, y);
proc sgplot data=&table.;
	vline accnut_year / response=&y group=wdr_sfrnd_code_nm datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
  xaxis values=(2010 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  title "&title.";
run;
%mend;
%vline001(지역별 집행률, &lib..var003_wdr, ratio_wdr);
%vline001(지역별 이월액+불용액 비율, &lib..var003_wdr, rr_wdr);
%vline001(지역별 이월액+불용액, &lib..var003_wdr, remain_wdr);
