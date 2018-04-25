%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";
/**/
proc glm data=&lib..M01;
class FSCL_YY;
model v14=v6 v10 v17 v8 v3 v1 v2 FSCL_YY/solution; run;
quit;

proc reg data=&lib..M01;
model v14=v6 v10 v17 v8 v3 v1 v2; run;
quit;

proc glm data=&lib..M01;
class FSCL_YY;
model v14=v6 v10 v17 v8 FSCL_YY/solution; run;
quit;

proc reg data=&lib..M01;
model v14=v6 v10 v17 v8; run;
quit;

/**/
proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v12 v22 FSCL_YY OFFC_NM/solution noint;
run;

proc glm data=&lib..M01;
class v22 FSCL_YY OFFC_NM;
model v21=v7 v19 v15 v24 v12 w4 w5 v22 FSCL_YY OFFC_NM/solution noint;
run;
