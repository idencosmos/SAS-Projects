data work02.H1;
set work02.longdata;
if label0='�α�(��)' and var2='��';
run;

proc sgplot data=work02.H1 (where=(var1='����' or var1='����Ư����' or var1='��⵵'));
series x=label y=value / group=var1;	
run;

data work02.h2_all;
set work02.h1;if var1='����';keep var1 label value;rename value=value_all;
run;

data work02.h2_city;
set work02.h1;if var1='����Ư����' or var1='��⵵';keep var1 label value;
run;

proc sql;
create table work02.h2 as
(select a.var1, a.label, a.value, b.value_all from work02.h2_city as a left join work02.h2_all as b on a.label=b.label);
run;

data work02.h3;
set work02.h2;
value_ratio=value/value_all;
run;

proc sgplot data=work02.H3;
series x=label y=value_ratio / group=var1;	
run;
