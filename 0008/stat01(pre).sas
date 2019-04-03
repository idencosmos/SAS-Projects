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
%series001(연도별 집행률, &lib..var005_year, ratio_year);
%series001(연도별 이월액+불용액 비율, &lib..var005_year, rr_year);
%series001(연도별 이월액+불용액, &lib..var005_year, remain_year);
%series001(연도별 이월액, &lib..var005_year, carry_year);
%series001(연도별 이월액 비율, &lib..var005_year, cr_year);
%series001(연도별 불용액, &lib..var005_year, remainder_year);
%series001(연도별 불용액 비율, &lib..var005_year, rrr_year);

%series001(연도별 본청 집행률, &lib..var005_up_year, ratio_year);
%series001(연도별 본청 이월액+불용액 비율, &lib..var005_up_year, rr_year);
%series001(연도별 본청 이월액+불용액, &lib..var005_up_year, remain_year);
%series001(연도별 본청 이월액, &lib..var005_up_year, carry_year);
%series001(연도별 본청 이월액 비율, &lib..var005_up_year, cr_year);
%series001(연도별 본청 불용액, &lib..var005_up_year, remainder_year);
%series001(연도별 본청 불용액 비율, &lib..var005_up_year, rrr_year);

%macro vline001(title, table, y);
proc sgplot data=&table.;
	vline accnut_year / response=&y group=wdr_sfrnd_code_nm datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
  xaxis values=(2010 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  title "&title.";
run;
%mend;
%vline001(지역별 집행률, &lib..var005_year, ratio_year);
%vline001(지역별 이월액+불용액 비율, &lib..var005_year, rr_year);
%vline001(지역별 이월액+불용액, &lib..var005_year, remain_year);
%vline001(지역별 이월액, &lib..var005_year, carry_year);
%vline001(지역별 이월액 비율, &lib..var005_year, cr_year);
%vline001(지역별 불용액, &lib..var005_year, remainder_year);
%vline001(지역별 불용액 비율, &lib..var005_year, rrr_year);
