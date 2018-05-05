%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

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
, a.v80
, a.v90
, a.v81
, a.v91
, a.v82
, a.v92
, a.v83
, a.v93
, a.v84
, a.v94
, a.v85
, a.v95
, a.v86
, a.v96
, a.v10
, a.v11
, a.v100
, a.v110
, a.v101
, a.v111
, a.v102
, a.v112
, a.v103
, a.v113
, a.v104
, a.v114
, a.v105
, a.v115
, a.v106
, a.v116
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
&lib..var345 as a
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
, a.v80
, a.v90
, a.v81
, a.v91
, a.v82
, a.v92
, a.v83
, a.v93
, a.v84
, a.v94
, a.v85
, a.v95
, a.v86
, a.v96
, a.v10
, a.v11
, a.v100
, a.v110
, a.v101
, a.v111
, a.v102
, a.v112
, a.v103
, a.v113
, a.v104
, a.v114
, a.v105
, a.v115
, a.v106
, a.v116
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
