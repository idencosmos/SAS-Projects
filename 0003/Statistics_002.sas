%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
libname &lib "&dir";

/*주거안정성_자가점유율_(일반가구)지역별 소득계층별 점유형태(2006~2017)*/
proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / group=v2 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis values=(30 to 75 by 5) display=(noline) grid;
  where v3="전체";
  title "지역별 자가점유율";
run;

proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / group=v3 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis values=(30 to 75 by 5) display=(noline) grid;
  where v2="전국";
  title "소득계층별 자가점유율";
run;

proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / group=v3 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis values=(30 to 75 by 5) display=(noline) grid;
  where v2="수도권";
  title "수도권 소득계층별 자가점유율";
run;

/*주거안정성_자가보유율*/

/*주거안정성_점유형태_(일반가구)지역별 소득계층별 점유형태(2006~2017)*/
proc sgplot data=&lib..D_007_03;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 70 by 10) display=(nolabel) grid;
  where v2="전국" and v3="전체";
  title "점유형태(전국)";
run;

proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 70 by 10) display=(nolabel) grid;
  where v2="수도권" and v3="전체";
  title "점유형태(수도권)";
run;

proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 70 by 10) display=(nolabel) grid;
  where v2="광역시" and v3="전체";
  title "점유형태(광역시)";
run;

proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 70 by 10) display=(nolabel) grid;
  where v2="도지역" and v3="전체";
  title "점유형태(도지역)";
run;

/*vbar를 사용하면 안되는 시계열 그래프*/
/*
proc sgplot data=&lib..D_007_03;
	vbar v1 / response=v4 datalabel
		dataskin=pressed barwidth=0.2
		baselineattrs=(thickness=0)
		discreteoffset=-0.25;

	vbar v1 / response=v5 datalabel
		dataskin=pressed barwidth=0.2
		baselineattrs=(thickness=0)
		discreteoffset=-0.15;

	vbar v1 / response=v6 datalabel
		dataskin=pressed barwidth=0.2
		baselineattrs=(thickness=0)
		discreteoffset=-0.05;

	vbar v1 / response=v7
		dataskin=pressed barwidth=0.2
		baselineattrs=(thickness=0)
		discreteoffset=0.05;

	vbar v1 / response=v8
		dataskin=pressed barwidth=0.2
		baselineattrs=(thickness=0)
		discreteoffset=0.15;

	vbar v1 / response=v9
		dataskin=pressed barwidth=0.2
		baselineattrs=(thickness=0)
		discreteoffset=0.25;

  where v2="전국" and v3="전체";
  title "점유형태(전국)";
run;
*/

/*주거비부담_PIR*/

/*주거비부담_RIR*/

/*주거비부담_생애최초 주택마련 소요연수*/
proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="전국" and v3="전체";
  title "생애최초 주택마련 소요연수(전국)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="수도" and v3="전체";
  title "생애최초 주택마련 소요연수(수도)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="광역" and v3="전체";
  title "생애최초 주택마련 소요연수(광역)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="도지" and v3="전체";
  title "생애최초 주택마련 소요연수(도지)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="수도" and v3="전체";
  title "생애최초 주택마련 소요연수(수도, 전체)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="수도" and v3="저소득층";
  title "생애최초 주택마련 소요연수(수도, 저소득층)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="수도" and v3="중소득층";
  title "생애최초 주택마련 소요연수(수도, 중소득층)";
run;

proc sgplot data=&lib..D_002_02;
	series x=v1 y=v4 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v5 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v6 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v7 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v8 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	series x=v1 y=v9 / datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
	xaxis values=(2006 to 2017) display=(nolabel);
	yaxis values=(0 to 55 by 5) display=(nolabel) grid;
  where v2="수도" and v3="고소득층";
  title "생애최초 주택마련 소요연수(수도, 고소득층)";
run;

/*주거비부담_임대료 및 대출금상환 부담*/
