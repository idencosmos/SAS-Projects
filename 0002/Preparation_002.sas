%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

proc sql;
create table J001 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.v8
, a.v9
, a.v10
, a.v11
, a.v12
, a.v13
, a.v14
, a.v21
, b.w10
, b.w11
, b.w14
, b.v15
, b.v16
, b.v17
, b.v18
, b.v19
, b.v20
, b.v22
from
&lib..var003 as a
full join
&lib..var004 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.FLD_CD=b.FLD_CD
and a.FLD_NM=b.FLD_NM
and a.SECT_CD=b.SECT_CD
and a.SECT_NM=b.SECT_NM
and a.PGM_CD=b.PGM_CD
and a.PGM_NM=b.PGM_NM
and a.ACTV_CD=b.ACTV_CD
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table J002 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.v8
, a.v9
, a.v10
, a.v11
, a.v12
, a.v13
, a.v14
, a.v21
, a.w10
, a.w11
, a.w14
, a.v15
, a.v16
, a.v17
, a.v18
, a.v19
, a.v20
, a.v22
, b.v23
, b.v24
from
J001 as a
full join
&lib..var005 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.FLD_CD=b.FLD_CD
and a.FLD_NM=b.FLD_NM
and a.SECT_CD=b.SECT_CD
and a.SECT_NM=b.SECT_NM
and a.PGM_CD=b.PGM_CD
and a.PGM_NM=b.PGM_NM
and a.ACTV_CD=b.ACTV_CD
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table J003 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, b.v1
, b.v2
, b.v3
, b.v4
, b.v5
, b.w3
, b.w4
, b.w5
, a.v8
, a.v9
, a.v10
, a.v11
, a.v12
, a.v13
, a.v14
, a.v21
, a.w10
, a.w11
, a.w14
, a.v15
, a.v16
, a.v17
, a.v18
, a.v19
, a.v20
, a.v22
, a.v23
, a.v24
from
J002 as a
full join
&lib..var001 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.FLD_CD=b.FLD_CD
and a.FLD_NM=b.FLD_NM
and a.SECT_CD=b.SECT_CD
and a.SECT_NM=b.SECT_NM
and a.PGM_CD=b.PGM_CD
and a.PGM_NM=b.PGM_NM
and a.ACTV_CD=b.ACTV_CD
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table &lib..M01 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, a.OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, a.FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, a.FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, a.SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, a.PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, a.ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.v1
, a.v2
, a.v3
, a.v4
, a.v5
, a.w3
, a.w4
, a.w5
, b.v6
, b.v7
, a.v8
, a.v9
, a.v10
, a.v11
, a.v12
, a.v13
, a.v14
, a.v21
, a.w10
, a.w11
, a.w14
, a.v15
, a.v16
, a.v17
, a.v18
, a.v19
, a.v20
, a.v22
, a.v23
, a.v24
from
J003 as a
full join
&lib..var002 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_NM=b.FSCL_NM
and a.FLD_NM=b.FLD_NM
and a.SECT_NM=b.SECT_NM
and a.PGM_NM=b.PGM_NM
and a.ACTV_NM=b.ACTV_NM;
quit;
run;
