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



/*ongdata_001-longdata_004를 full join한 테이블을 만드는 코드, 비효율적이고 필요없는 작업으로 폐기*/

proc sql;
create table &lib..pre004 as
select distinct *
, sum(input(ANEXP_BDGAMT_F, 32.)) as ANEXP_BDGAMT_F_S
, sum(input(ANEXP_BDGAMT_M, 32.)) as ANEXP_BDGAMT_M_S
, sum(input(PREY_BFWAMT, 32.)) as PREY_BFWAMT_S
, sum(input(OVR_EP_AMT, 32.)) as OVR_EP_AMT_S
, sum(input(RSVF_EP_DCS_IAMT, 32.)) as RSVF_EP_DCS_IAMT_S
, sum(input(RSVF_EP_DCS_MAMT, 32.)) as RSVF_EP_DCS_MAMT_S
, sum(input(BDTR_IAMT, 32.)) as BDTR_IAMT_S
, sum(input(BDTR_MAMT, 32.)) as BDTR_MAMT_S
, sum(input(AVDV_IAMT, 32.)) as AVDV_IAMT_S
, sum(input(AVDV_MAMT, 32.)) as AVDV_MAMT_S
, sum(input(FNT_IAMT, 32.)) as FNT_IAMT_S
, sum(input(FNT_MAMT, 32.)) as FNT_MAMT_S
, sum(input(ANEXP_BDG_CAMT, 32.)) as ANEXP_BDG_CAMT_S
, sum(input(EP_AMT, 32.)) as EP_AMT_S
, sum(input(EP_NAMT, 32.)) as EP_NAMT_S
, sum(input(NEXT_YY_BFWAMT, 32.)) as NEXT_YY_BFWAMT_S
, sum(input(DUSEAMT, 32.)) as DUSEAMT_S
from &lib..Longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, ACCT_CD
, ACCT_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM;
quit;
run;

proc sql;
create table &lib..Pre0104 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, input(a.EXE_M, 32.) as EXE_M
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, b.ACCT_CD
, b.ACCT_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, input(a.ANEXP_BDG_CAMT, 32.) as ANEXP_BDG_CAMT
, input(a.EP_AMT, 32.) as EP_AMT
, input(a.THISM_AGGR_EP_AMT, 32.) as THISM_AGGR_EP_AMT
, b.*
from &lib..longdata_001 as a full join &lib..pre004 as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.FSCL_CD=b.FSCL_CD
and a.FLD_CD=b.FLD_CD
and a.SECT_CD=b.SECT_CD
and a.PGM_CD=b.PGM_CD
and a.ACTV_CD=b.ACTV_CD;
quit;
run;

proc sql;
create table &lib..Pre010402 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.ACCT_NM, b.ACCT_NM) as ACCT_NM
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, input(b.Y_YY_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_MEDI_KCUR_AMT
, input(b.Y_YY_DFN_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_DFN_MEDI_KCUR_AMT
, a.*
, b.*
from &lib..pre0104 as a full join &lib..longdata_002 as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_NM=b.FSCL_NM
and a.ACCT_NM=b.ACCT_NM
and a.FLD_NM=b.FLD_NM
and a.SECT_NM=b.SECT_NM
and a.PGM_NM=b.PGM_NM
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table &lib..Pre01040203 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, b.REVN_BDG_CAMT
, b.RC_AMT
, b.REVN_RC_AMT
, b.ANEXP_BDG_CAMT as ANEXP_BDG_CAMT_T
, b.EP_AMT as EP_AMT_T
, b.ANEXP_EP_AMT
, b.ELUC_BFWAMT
, b.DUSEAMT as DUSEAMT_T
, a.*
from &lib..pre010402 as a full join &lib..longdata_003 as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM;
quit;
run;

proc sql;
create table &lib..Prefinal as
select FSCL_YY label="회계연도"
, EXE_M label="집행월"
, OFFC_CD label="소관"
, OFFC_NM label="소관명"
, FSCL_CD label="회계"
, FSCL_NM label="회계명"
, ACCT_CD label="계정"
, ACCT_NM label="계정명"
, FLD_CD label="분야코드"
, FLD_NM label="분야명"
, SECT_CD label="부문코드"
, SECT_NM label="부문명"
, PGM_CD label="프로그램코드"
, PGM_NM label="프로그램명"
, ACTV_CD label="단위사업"
, ACTV_NM label="단위사업명"
, CITM_CD label="지출목"
, CITM_NM label="지출목명"
, input(ANEXP_BDGAMT_F, 32.) label="세출예산액/당초지출계획액(원)"
, ANEXP_BDGAMT_F_S label="당초지출계획액(원)/단위사업별"
, input(ANEXP_BDGAMT_M, 32.) label="세출예산액/수정지출계획액(원)"
, ANEXP_BDGAMT_M_S label="수정지출계획액(원)/단위사업별"
, input(PREY_BFWAMT, 32.) label="전년도이월액(원)"
, PREY_BFWAMT_S label="전년도이월액(원)/단위사업별"
, input(OVR_EP_AMT, 32.) label="초과지출승인액(원)"
, OVR_EP_AMT_S label="초과지출승인액(원)/단위사업별"
, input(RSVF_EP_DCS_IAMT, 32.) label="예비비지출결정증액(원)"
, RSVF_EP_DCS_IAMT_S label="예비비지출결정증액(원)/단위사업별"
, input(RSVF_EP_DCS_MAMT, 32.) label="예비비지출결정감액(원)"
, RSVF_EP_DCS_MAMT_S label="예비비지출결정감액(원)/단위사업별"
, input(BDTR_IAMT, 32.) label="전용증액(원)"
, BDTR_IAMT_S label="전용증액(원)/단위사업별"
, input(BDTR_MAMT, 32.) label="전용감액(원)"
, BDTR_MAMT_S label="전용감액(원)/단위사업별"
, input(FNT_IAMT, 32.) label="이체증액(원)"
, FNT_IAMT_S label="이체증액(원)/단위사업별"
, input(FNT_MAMT, 32.) label="이체감액(원)"
, FNT_MAMT_S label="이체감액(원)/단위사업별"
, input(AVDV_IAMT, 32.) label="이용증액(원)"
, AVDV_IAMT_S label="이용증액(원)/단위사업별"
, input(AVDV_MAMT, 32.) label="이용감액(원)"
, AVDV_MAMT_S label="이용감액(원)/단위사업별"
, ANEXP_BDG_CAMT label="세출예산현액/지출계획현액(원)"
, ANEXP_BDG_CAMT_S label="세출예산현액(원)/단위사업별"
, EP_AMT label="당월집행액(원)"
, THISM_AGGR_EP_AMT label="누계집행액(원)"
, EP_AMT_S label="지출액(원)/단위사업별"
, input(EP_NAMT, 32.) label="지출순액(원)"
, EP_NAMT_S label="지출순액(원)/단위사업별"
, input(NEXT_YY_BFWAMT, 32.) label="다음년도이월액(원)"
, NEXT_YY_BFWAMT_S label="다음년도이월액(원)/단위사업별"
, input(DUSEAMT, 32.) label="불용액(원)"
, DUSEAMT_S label="불용액(원)/단위사업별"
, input(REVN_BDG_CAMT, 32.) label="(세입)예산현액"
, input(RC_AMT, 32.) label="(세입)수납액(원)"
, input(REVN_RC_AMT, 32.) label="(세입)증감액(원)"
, input(ANEXP_BDG_CAMT_T, 32.) label="세출예산현액(원)/소관별"
, input(EP_AMT_T, 32.) label="지출액(원)/소관별"
, input(ANEXP_EP_AMT, 32.) label="(세출)증감액(원)"
, input(ELUC_BFWAMT, 32.) label="다음년도이월액(원)"
, input(DUSEAMT_T, 32.) label="불용액(원)/소관별"
, Y_YY_DFN_MEDI_KCUR_AMT label="금년도국회확정(천원)"
, Y_YY_MEDI_KCUR_AMT label="금년도정부안(천원)"
from &lib..Pre01040203;
quit;
run;
