%let dir=D:\Kwonhee\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc sql;
  create table &lib..var002 as
  select * from &lib..table003
  where level_no=1;
quit;
run;

proc sql;
  create table &lib..var003 as
  select *, sum(remain) as remain_year label="연도별 이월액+불용액", avg(remain_ratio) as rr_year label="연도별 이월액+불용액 비율", avg(ratio) as ratio_year label="연도별 집행률"
  from
  (
    select *, sum(remain) as remain_wdr label="지역별 이월액+불용액", avg(remain_ratio) as rr_wdr label="지역별 이월액+불용액 비율", avg(ratio) as ratio_wdr label="지역별 집행률"
    from
    (
      select distinct coalesce(a.accnut_year, b.accnut_year) as accnut_year label="회계연도"
      , coalesce(a.wdr_sfrnd_code, b.wdr_sfrnd_code) as wdr_sfrnd_code label="지역코드"
      , coalesce(a.wdr_sfrnd_nm, b.wdr_sfrnd_code_nm) as wdr_sfrnd_code_nm label="지역명"
      , coalesce(a.sfrnd_code, b.sfrnd_code) as sfrnd_code label="자치단체코드"
      , coalesce(a.sfrnd_nm_korean, b.sfrnd_nm_korean) as sfrnd_nm_korean label="자치단체명"
      , a.amt1-sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam) as remain label="이월액+불용액"
      , (a.amt1-sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam))/a.amt1 as remain_ratio label="이월액+불용액 비율"
      , sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam)/a.amt1 as ratio label="집행률"
      , a.amt1
      , a.amt2
      , a.amt3
      , a.amt4
      , sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam) as sum label="세출총계"
      , b.gnrl_anexptr_stacntam
      , b.etc_anexptr_stacntam
      , b.pblcorp_anexptr_stacntam
      from &lib..var002 as a left join &lib..table001 as b
      on a.accnut_year=b.accnut_year
      and a.wdr_sfrnd_code=b.wdr_sfrnd_code
      and a.wdr_sfrnd_nm=b.wdr_sfrnd_code_nm
      and a.sfrnd_code=b.sfrnd_code
      and a.sfrnd_nm_korean=b.sfrnd_nm_korean
    )
    group by accnut_year
    , wdr_sfrnd_code
    , wdr_sfrnd_code_nm
  )
  group by accnut_year;
quit;
run;

proc sql;
  create table &lib..var003_wdr as
  select distinct accnut_year
  , wdr_sfrnd_code
  , wdr_sfrnd_code_nm
  , remain_wdr
  , rr_wdr
  , ratio_wdr
  from &lib..var003;
quit;
run;

proc sql;
  create table &lib..var003_year as
  select distinct accnut_year
  , remain_year
  , rr_year
  , ratio_year
  from &lib..var003;
quit;
run;
