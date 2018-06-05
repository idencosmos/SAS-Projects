%let dir=D:\OneDrive\Github\SAS-Projects\0003\;
%let lib=A0003;
libname &lib "&dir";

/*주거안정성_자가점유율_(일반가구)지역별 소득계층별 점유형태(2006~2017)*/
proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / group=v2 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  where v3="전체";
  title "지역별 자가점유율";
run;

proc sgplot data=&lib..D_007_03;
  series x=v1 y=v4 / group=v3 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  where v2="전국";
  title "소득계층별 자가점유율";
run;

/*주거안정성_자가보유율*/
proc sgplot data=&lib..D_002_05;
  series x=v1 y=v4 / group=v2 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  where v3="전체";
  title "지역별 자가보유율";
run;

proc sgplot data=&lib..D_002_05;
  series x=v1 y=v4 / group=v3 markers datalabel;
  xaxis values=(2006 to 2017) display=(nolabel);
  yaxis display=(noline nolabel) grid;
  where v2="전국";
  title "소득계층별 자가보유율";
run;

/*주거안정성_점유형태_(일반가구)지역별 소득계층별 점유형태(2006~2017)*/
%macro series001(table, title, v2, v3);
proc sgplot data=&table.;
	series x=v1 y=v4 / &option.;
	series x=v1 y=v5 / &option.;
	series x=v1 y=v6 / &option.;
	series x=v1 y=v7 / &option.;
	series x=v1 y=v8 / &option.;
	series x=v1 y=v9 / &option.;
	xaxis &xaxis.;
	yaxis &yaxis.;
  where v2="&v2." and v3="&v3.";
  title "&title.(&v2., &v3.)";
run;
%mend;

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=display=(nolabel) grid;
%series001(&lib..D_007_03, 점유형태, 전국, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(0 to 70 by 10) display=(nolabel) grid;
%series001(&lib..D_007_03, 점유형태, 전국, 전체);
%series001(&lib..D_007_03, 점유형태, 수도권, 전체);
%series001(&lib..D_007_03, 점유형태, 광역시, 전체);
%series001(&lib..D_007_03, 점유형태, 도지역, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(0 to 80 by 10) display=(nolabel) grid;
%series001(&lib..D_007_03, 점유형태, 전국, 전체);
%series001(&lib..D_007_03, 점유형태, 전국, 저소득층);
%series001(&lib..D_007_03, 점유형태, 전국, 중소득층);
%series001(&lib..D_007_03, 점유형태, 전국, 고소득층);

/*주거안정성_주택유형_(일반가구)지역별 소득계층별 점유형태(2006~2017)*/
%macro series001(table, title, v2, v3);
proc sgplot data=&table.;
	series x=v1 y=v4 / &option.;
	series x=v1 y=v5 / &option.;
	series x=v1 y=v6 / &option.;
	series x=v1 y=v7 / &option.;
	series x=v1 y=v8 / &option.;
	series x=v1 y=v9 / &option.;
	xaxis &xaxis.;
	yaxis &yaxis.;
  where v2="&v2." and v3="&v3.";
  title "&title.(&v2., &v3.)";
run;
%mend;

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=display=(nolabel) grid;
%series001(&lib..D_007_04, 주택유형, 전국, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(0 to 60 by 10) display=(nolabel) grid;
%series001(&lib..D_007_04, 주택유형, 전국, 전체);
%series001(&lib..D_007_04, 주택유형, 수도권, 전체);
%series001(&lib..D_007_04, 주택유형, 광역시, 전체);
%series001(&lib..D_007_04, 주택유형, 도지역, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(0 to 80 by 10) display=(nolabel) grid;
%series001(&lib..D_007_04, 주택유형, 전국, 전체);
%series001(&lib..D_007_04, 주택유형, 전국, 저소득층);
%series001(&lib..D_007_04, 주택유형, 전국, 중소득층);
%series001(&lib..D_007_04, 주택유형, 전국, 고소득층);

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

/*주거비부담_주택유형_(일반가구)지역별 소득별 최초주택마련소요년수(2006~2017)*/
%macro series001(table, title, v2, v3);
proc sgplot data=&table.;
	series x=v1 y=v4 / &option.;
	series x=v1 y=v5 / &option.;
	series x=v1 y=v6 / &option.;
	series x=v1 y=v7 / &option.;
	series x=v1 y=v8 / &option.;
	series x=v1 y=v9 / &option.;
	xaxis &xaxis.;
	yaxis &yaxis.;
  where v2="&v2." and v3="&v3.";
  title "&title.(&v2., &v3.)";
run;
%mend;

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=display=(nolabel) grid;
%series001(&lib..D_002_02, 최초주택마련소요년수, 전국, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(0 to 55 by 5) display=(nolabel) grid;
%series001(&lib..D_002_02, 최초주택마련소요년수, 전국, 전체);
%series001(&lib..D_002_02, 최초주택마련소요년수, 수도권, 전체);
%series001(&lib..D_002_02, 최초주택마련소요년수, 광역시, 전체);
%series001(&lib..D_002_02, 최초주택마련소요년수, 도지역, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(0 to 50 by 5) display=(nolabel) grid;
%series001(&lib..D_002_02, 최초주택마련소요년수, 전국, 전체);
%series001(&lib..D_002_02, 최초주택마련소요년수, 전국, 저소득층);
%series001(&lib..D_002_02, 최초주택마련소요년수, 전국, 중소득층);
%series001(&lib..D_002_02, 최초주택마련소요년수, 전국, 고소득층);

/*주거비부담_PIR*/
%macro series001(table, title, v2, v3);
proc sgplot data=&table.;
	series x=v1 y=v4 / &option.;
	series x=v1 y=v5 / &option.;
	xaxis &xaxis.;
	yaxis &yaxis.;
  where v2="&v2." and v3="&v3.";
  title "&title.(&v2., &v3.)";
run;
%mend;

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=display=(nolabel) grid;
%series001(&lib..D_002_03, PIR, 전국, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(2.5 to 11) display=(nolabel) grid;
%series001(&lib..D_002_03, PIR, 전국, 전체);
%series001(&lib..D_002_03, PIR, 수도권, 전체);
%series001(&lib..D_002_03, PIR, 광역시, 전체);
%series001(&lib..D_002_03, PIR, 도지역, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(3 to 12) display=(nolabel) grid;
%series001(&lib..D_002_03, PIR, 전국, 전체);
%series001(&lib..D_002_03, PIR, 전국, 저소득층);
%series001(&lib..D_002_03, PIR, 전국, 중소득층);
%series001(&lib..D_002_03, PIR, 전국, 고소득층);

/*주거비부담_RIR*/
%macro series001(table, title, v2, v3);
proc sgplot data=&table.;
	series x=v1 y=v4 / &option.;
	series x=v1 y=v5 / &option.;
	xaxis &xaxis.;
	yaxis &yaxis.;
  where v2="&v2." and v3="&v3.";
  title "&title.(&v2., &v3.)";
run;
%mend;

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=display=(nolabel) grid;
%series001(&lib..D_002_04, RIR, 전국, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(14 to 31) display=(nolabel) grid;
%series001(&lib..D_002_04, RIR, 전국, 전체);
%series001(&lib..D_002_04, RIR, 수도권, 전체);
%series001(&lib..D_002_04, RIR, 광역시, 전체);
%series001(&lib..D_002_04, RIR, 도지역, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(15 to 37 by 2) display=(nolabel) grid;
%series001(&lib..D_002_04, RIR, 전국, 전체);
%series001(&lib..D_002_04, RIR, 전국, 저소득층);
%series001(&lib..D_002_04, RIR, 전국, 중소득층);
%series001(&lib..D_002_04, RIR, 전국, 고소득층);

/*주거비부담_임대료 및 대출금상환 부담*/
%macro series001(table, title, v2, v3);
proc sgplot data=&table.;
	series x=v1 y=v4 / &option.;
	series x=v1 y=v5 / &option.;
  series x=v1 y=v6 / &option.;
  series x=v1 y=v7 / &option.;
	xaxis &xaxis.;
	yaxis &yaxis.;
  where v2="&v2." and v3="&v3.";
  title "&title.(&v2., &v3.)";
run;
%mend;

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=display=(nolabel) grid;
%series001(&lib..D_002_06, LTV_대출가구 대상, 전국, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(21 to 43) display=(nolabel) grid;
%series001(&lib..D_002_06, LTV_대출가구 대상, 전국, 전체);
%series001(&lib..D_002_06, LTV_대출가구 대상, 수도권, 전체);
%series001(&lib..D_002_06, LTV_대출가구 대상, 광역시, 전체);
%series001(&lib..D_002_06, LTV_대출가구 대상, 도지역, 전체);

%let option=datalabel curvelabel curvelabelloc=outside curvelabelpos=end;
%let xaxis=values=(2006 to 2017) display=(nolabel);
%let yaxis=values=(23 to 42) display=(nolabel) grid;
%series001(&lib..D_002_06, LTV_대출가구 대상, 전국, 전체);
%series001(&lib..D_002_06, LTV_대출가구 대상, 전국, 저소득층);
%series001(&lib..D_002_06, LTV_대출가구 대상, 전국, 중소득층);
%series001(&lib..D_002_06, LTV_대출가구 대상, 전국, 고소득층);


/*추가*/
proc sort data=&lib..D_010_01; by v1 v4 v5 v6;run;
proc sgplot data=&lib..D_010_01;
  vbar v1 / response=v5 group=v2 grouporder=data datalabel groupdisplay=cluster;
  where v2^="전국";
  title "지역별 주택거래현황";
run;

proc sgplot data=&lib..D_010_01;
  vbar v1 / response=v6 group=v2 grouporder=data datalabel groupdisplay=cluster;
  where v2^="전국";
  title "지역별 주택거래현황";
run;
