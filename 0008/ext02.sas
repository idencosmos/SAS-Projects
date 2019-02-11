%let dir=D:\Kwonhee\OneDrive\Github\SAS-Projects\0008\xlsx\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc import out=&lib..xls001 datafile="&dir.부문별 2008.xlsx" dbms=xlsx replace;run;
