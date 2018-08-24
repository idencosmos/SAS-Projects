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
, b.m1
, b.m2
, b.q11
, b.q13
, b.q21
, b.q23
, b.x10
, b.x11
, b.x12
, b.x13
, b.x14
, b.x15
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
, a.v70
, a.v71
, a.v72
, a.v73
, a.v74
, a.v75
, a.v76
, a.v120
, a.v121
, a.v122
, a.v123
, a.v124
, a.v125
, a.v126
, a.v130
, a.v131
, a.v132
, a.v133
, a.v134
, a.v135
, a.v136
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
, SUM(v1)/SUM(w3) as w1
, a.v2
, SUM(v2)/SUM(w3) as w2
, a.v3
, a.v4
, a.v5
, a.w3
, a.w4
, a.w5
, a.m1
, a.m2
, a.q11
, a.q13
, a.q21
, a.q23
, a.x10
, a.x11
, a.x12
, a.x13
, a.x14
, a.x15
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
, a.v70
, a.v71
, a.v72
, a.v73
, a.v74
, a.v75
, a.v76
, a.v120
, a.v121
, a.v122
, a.v123
, a.v124
, a.v125
, a.v126
, a.v130
, a.v131
, a.v132
, a.v133
, a.v134
, a.v135
, a.v136
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

proc sql;
create table M02_pre as
select *
, case when FSCL_YY>2007 and FSCL_YY<2013 then 1 else 0 end as x1
, case when FSCL_YY>2012 and FSCL_YY<2018 then 1 else 0 end as x2
, case when FSCL_YY=2008 or FSCL_YY=2013 then 1 else 0 end as x3
, case when FSCL_YY=2009 or FSCL_YY=2014 then 1 else 0 end as x31
, case when FSCL_YY=2008 or FSCL_YY=2009 or FSCL_YY=2013 or FSCL_YY=2014 then 1 else 0 end as x4
, case when v6>0 then 1 else 0 end as x5
, case when v6<0 then 1 else 0 end as x6
, w4-w1 as x7
, w5-w2 as x8
, case when FSCL_YY=2008 or FSCL_YY=2013 or FSCL_YY=2018 then 1
when FSCL_YY=2009 or FSCL_YY=2014 then 2
when FSCL_YY=2010 or FSCL_YY=2015 then 3
when FSCL_YY=2011 or FSCL_YY=2016 then 4
when FSCL_YY=2007 or FSCL_YY=2012 or FSCL_YY=2017 then 5 else . end as x9

, v70/v80 as v140
, v71/v81 as v141
, v72/v82 as v142
, v73/v83 as v143
, v74/v84 as v144
, v75/v85 as v145
, v76/v86 as v146
from &lib..M01;
quit;
run;

proc sql;
  create table &lib..M02 as
  select a.*, b._NAME5 as x16
  from M02_pre as a left join &lib..longdata_GDP as b
  on a.FSCL_YY=b._NAME5__NAME6;
quit;
run;
