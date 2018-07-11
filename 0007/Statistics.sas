%let dir=D:\OneDrive\Github\SAS-Projects\0007\;
%let lib=A0007;

libname &lib "&dir";

proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  where retweet=0 and reply=0;
run;

proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  where no^=88 and no^=82 and retweet=0 and reply=0;
run;

proc means data=&lib..D002 n mean median std min max;
  var favorite retweeted;
  where retweet=0 and reply=0;
run;

proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  class day_num;
  where retweet=0 and reply=0;
run;

proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  where no^=88 and no^=82 and retweet=0 and reply=0;
  class day_num;
run;

proc means data=&lib..D002 n mean median std min max;
  var favorite retweeted;
  class day_num;
  where retweet=0 and reply=0;
run;

proc means data=&lib..D001 n mean median std min max;
  var favorite;
  where no^=88 and no^=82 and retweet=0 and reply=0;
  class day_num;
run;

proc means data=&lib..D002 n mean median std min max;
  var favorite;
  class day_num;
  where retweet=0 and reply=0;
run;

proc means data=&lib..D001 n mean median std min max;
  var retweeted;
  where no^=88 and no^=82 and retweet=0 and reply=0;
  class day_num;
run;

proc means data=&lib..D002 n mean median std min max;
  var retweeted;
  class day_num;
  where retweet=0 and reply=0;
run;

proc anova data=&lib..D001;
class day_num;
model favorite=day_num;
where no^=88 and no^=82 and retweet=0 and reply=0;
means day_num;run;

proc anova data=&lib..D001;
class day_num;
model retweeted=day_num;
where no^=88 and no^=82 and retweet=0 and reply=0;
means day_num;run;

proc anova data=&lib..D002;
class day_num;
model favorite=day_num;
where retweet=0 and reply=0;
means day_num;run;

proc anova data=&lib..D002;
class day_num;
model retweeted=day_num;
where retweet=0 and reply=0;
means day_num;run;

proc sgplot data=&lib..D001;
vbar YM / response=favorite stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=-0.125;
vbar YM / response=retweeted stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=0.125;
xaxis display=(nolabel);
yaxis value=(0 to 1450 by 50) display=(noline) grid;
where no^=88 and no^=82 and retweet=0 and reply=0;
run;

proc sgplot data=&lib..D002;
vbar YM / response=favorite stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=-0.125;
vbar YM / response=retweeted stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=0.125;
xaxis display=(nolabel);
yaxis value=(0 to 1150 by 50) display=(noline) grid;
where retweet=0 and reply=0;
run;

proc sgplot data=&lib..D001;
vbar time / response=favorite stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=-0.125;
vbar time / response=retweeted stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=0.125;
xaxis value=(1 to 24 by 1) display=(nolabel);
yaxis value=(0 to 1600 by 50) display=(noline) grid;
where no^=88 and no^=82 and retweet=0 and reply=0;
run;

proc sgplot data=&lib..D002;
vbar time / response=favorite stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=-0.125;
vbar time / response=retweeted stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=0.125;
xaxis value=(1 to 24 by 1) display=(nolabel);
yaxis value=(0 to 900 by 50) display=(noline) grid;
where retweet=0 and reply=0;
run;

proc sgplot data=&lib..D001;
vbar day_num / response=favorite stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=-0.125;
vbar day_num / response=retweeted stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=0.125;
xaxis display=(nolabel) value=(1 2 3 4 5 6 7) valuesdisplay=("일" "월" "화" "수" "목" "금" "토");
yaxis value=(0 to 900 by 50) display=(noline nolabel) grid;
where no^=88 and no^=82 and retweet=0 and reply=0;
run;

proc sgplot data=&lib..D002;
vbar day_num / response=favorite stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=-0.125;
vbar day_num / response=retweeted stat=mean barwidth=0.25 baselineattrs=(thickness=0) discreteoffset=0.125;
xaxis display=(nolabel) value=(1 2 3 4 5 6 7) valuesdisplay=("일" "월" "화" "수" "목" "금" "토");
yaxis value=(0 to 700 by 50) display=(noline nolabel) grid;
where retweet=0 and reply=0;
run;

proc anova data=&lib..D003;
class name;
model retweeted=name;
where retweeted<19000 and retweet=0 and reply=0;
means name;run;

proc anova data=&lib..D003;
class name;
model favorite=name;
where retweeted<19000 and retweet=0 and reply=0;
means name;run;

proc sgplot data=&lib..D001 noautolegend;
series x=date_ko_ y=no / datalabel=no_month;
scatter x=date_ko_ y=no_month / markerattrs=(symbol=circlefilled size=7);
scatter x=date_ko_ y=no_month / markerattrs=(symbol=circlefilled size=5 color=white);
xaxis type=time ranges=("01JUN2017"d - "08JUN2018"d) display=(nolabel);
yaxis display=(nolabel) grid;
run;

proc sgplot data=&lib..D002 noautolegend;
series x=date_ko_ y=no / datalabel=no_month;
scatter x=date_ko_ y=no_month / markerattrs=(symbol=circlefilled size=7);
scatter x=date_ko_ y=no_month / markerattrs=(symbol=circlefilled size=5 color=white);
xaxis type=time ranges=("01JUN2017"d - "08JUN2018"d) display=(nolabel);
yaxis display=(nolabel) grid;
run;

proc corr data=&lib..D001 plots=scatter;
var favorite retweeted;
where no^=88 and no^=82 and retweet=0 and reply=0;
run;

proc corr data=&lib..D002 plots=scatter;
var favorite retweeted;
where retweet=0 and reply=0;
run;

proc corr data=&lib..D003 plots=scatter;
var favorite retweeted;
where retweeted<19000 and retweet=0 and reply=0;
run;

proc sgplot data=&lib..D009 noautolegend;
series x=time y=no/lineattrs=(color=black);
scatter x=time y=UF_acc/y2axis markerattrs=(symbol=circle size=5 color=red);
series x=time y=F_acc/y2axis datalabel=BC_id datalabelattrs=(color=blue) lineattrs=(color=green);
series x=time y=F_acc/y2axis datalabel=FO_id datalabelattrs=(color=green) lineattrs=(color=green);
xaxis display=(nolabel) grid;
yaxis;
y2axis label="팔로워수(녹색, 누적, 천)";
run;

proc sgplot data=&lib..D011 noautolegend;
series x=time y=no/lineattrs=(color=black);
scatter x=time y=UF_acc/y2axis markerattrs=(symbol=circle size=5 color=red);
series x=time y=F_acc/y2axis datalabel=BC_id datalabelattrs=(color=blue) lineattrs=(color=green);
series x=time y=F_acc/y2axis datalabel=FO_id datalabelattrs=(color=green) lineattrs=(color=green);
xaxis display=(nolabel) grid;
yaxis;
y2axis label="팔로워수(녹색, 누적, 천)";
run;
