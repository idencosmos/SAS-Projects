%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*테이블 간 데이터 비교를 위해 만든 코드, 하지만 변수가 너무 많고 세부적인 부분에서 다른 부분이 다수 있어서 조정을 포기하고 결측치로 남을 것으로 예상.*/

proc sql;
create table &lib..Num_OFFC_004 as select distinct OFFC_CD as OF_CD_004, OFFC_NM as OF_004 from &lib..Longdata_004 order by OFFC_NM;
create table &lib..Num_FSCL_004 as select distinct FSCL_CD as FS_CD_004, FSCL_NM as FS_004 from &lib..Longdata_004 order by FSCL_NM;
create table &lib..Num_ACCT_004 as select distinct ACCT_CD as AC_CD_004, ACCT_NM as AC_004 from &lib..Longdata_004 order by ACCT_NM;
create table &lib..Num_FLD_004 as select distinct FLD_CD as FL_CD_004, FLD_NM as FL_004 from &lib..Longdata_004 order by FLD_NM;
create table &lib..Num_SECT_004 as select distinct SECT_CD as SE_CD_004, SECT_NM as SE_004 from &lib..Longdata_004 order by SECT_NM;
create table &lib..Num_PGM_004 as select distinct PGM_CD as PG_CD_004, PGM_NM as PG_004 from &lib..Longdata_004 order by PGM_NM;
create table &lib..Num_ACTV_004 as select distinct ACTV_CD as AC_CD_004, ACTV_NM as AC_004 from &lib..Longdata_004 order by ACTV_NM;
quit;
run;

proc sql;
create table &lib..Num_OFFC_001 as select distinct OFFC_CD as OF_CD_001, OFFC_NM as OF_001 from &lib..Longdata_001 order by OFFC_NM;
create table &lib..Num_FSCL_001 as select distinct FSCL_CD as FS_CD_001, FSCL_NM as FS_001 from &lib..Longdata_001 order by FSCL_NM;
create table &lib..Num_ACCT_001 as select distinct ACCT_CD as AC_CD_001, ACCT_NM as AC_001 from &lib..Longdata_001 order by ACCT_NM;
create table &lib..Num_FLD_001 as select distinct FLD_CD as FL_CD_001, FLD_NM as FL_001 from &lib..Longdata_001 order by FLD_NM;
create table &lib..Num_SECT_001 as select distinct SECT_CD as SE_CD_001, SECT_NM as SE_001 from &lib..Longdata_001 order by SECT_NM;
create table &lib..Num_PGM_001 as select distinct PGM_CD as PG_CD_001, PGM_NM as PG_001 from &lib..Longdata_001 order by PGM_NM;
create table &lib..Num_ACTV_001 as select distinct ACTV_CD as AC_CD_001, ACTV_NM as AC_001 from &lib..Longdata_001 order by ACTV_NM;
quit;
run;

proc sql;
create table &lib..Num_OFFC_002 as select distinct OFFC_NM as OF_002 from &lib..Longdata_002 order by OFFC_NM;
create table &lib..Num_FSCL_002 as select distinct FSCL_NM as FS_002 from &lib..Longdata_002 order by FSCL_NM;
create table &lib..Num_ACCT_002 as select distinct ACCT_NM as AC_002 from &lib..Longdata_002 order by ACCT_NM;
create table &lib..Num_FLD_002 as select distinct FLD_NM as FL_002 from &lib..Longdata_002 order by FLD_NM;
create table &lib..Num_SECT_002 as select distinct SECT_NM as SE_002 from &lib..Longdata_002 order by SECT_NM;
create table &lib..Num_PGM_002 as select distinct PGM_NM as PG_002 from &lib..Longdata_002 order by PGM_NM;
create table &lib..Num_ACTV_002 as select distinct ACTV_NM as AC_002 from &lib..Longdata_002 order by ACTV_NM;
quit;
run;

proc sql;
create table &lib..Num_OFFC as select a.*, b.* from &lib..Num_OFFC_001 as a full join &lib..Num_OFFC_004 as b on a.OF_001=b.OF_004 and a.OF_CD_001=b.OF_CD_004;
create table &lib..Num_FSCL as select a.*, b.* from &lib..Num_FSCL_001 as a full join &lib..Num_FSCL_004 as b on a.FS_001=b.FS_004 and a.FS_CD_001=b.FS_CD_004;
create table &lib..Num_ACCT as select a.*, b.* from &lib..Num_ACCT_001 as a full join &lib..Num_ACCT_004 as b on a.AC_001=b.AC_004 and a.AC_CD_001=b.AC_CD_004;
create table &lib..Num_FLD as select a.*, b.* from &lib..Num_FLD_001 as a full join &lib..Num_FLD_004 as b on a.FL_001=b.FL_004 and a.FL_CD_001=b.FL_CD_004;
create table &lib..Num_SECT as select a.*, b.* from &lib..Num_SECT_001 as a full join &lib..Num_SECT_004 as b on a.SE_001=b.SE_004 and a.SE_CD_001=b.SE_CD_004;
create table &lib..Num_PGM as select a.*, b.* from &lib..Num_PGM_001 as a full join &lib..Num_PGM_004 as b on a.PG_001=b.PG_004 and a.PG_CD_001=b.PG_CD_004;
create table &lib..Num_ACTV as select a.*, b.* from &lib..Num_ACTV_001 as a full join &lib..Num_ACTV_004 as b on a.AC_001=b.AC_004 and a.AC_CD_001=b.AC_CD_004;
quit;
run;
