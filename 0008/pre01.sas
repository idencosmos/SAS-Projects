%let dir=D:\Kwonhee\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc sql;
  create table &lib..var001 as
  select * from &lib..table003
  where level_no=1;
quit;
run;

proc sql;
  create table &lib..var002 as
  select a.*, b.rate1/100 as rate1, b.rate2/100 as rate2
  from &lib..var001 as a left join
  (
    select a.*, b.rate1 as rate2
    from &lib..table008 as a left join &lib..table009 as b
    on a.accnut_year=b.accnut_year
    and a.wdr_sfrnd_code=b.wdr_sfrnd_code
    and a.wdr_sfrnd_code_nm=b.wdr_sfrnd_code_nm
    and a.sfrnd_code=b.sfrnd_code
    and a.sfrnd_nm_korean=b.sfrnd_nm_korean
  ) as b
  on a.accnut_year=b.accnut_year
  and a.sfrnd_code=b.sfrnd_code;
quit;
run;

proc sql;
  create table &lib..var004 as
  select year-1 as accnut_year
  , case when sfrnd_nm_korean="경남창원시(통합)" then "경남창원시" else sfrnd_nm_korean end as sfrnd_nm_korean label="자치단체명"
  , a*1000 as a label="국고보조금사용잔액"
  , b*1000 as b label="시ㆍ도비보조금사용잔액"
  , c*1000 as c label="전년도이월사업비"
  , (x+y)*1000 as d label="순세계잉여금"
  from &lib..table004;
quit;
run;

proc sql;
  create table &lib..var003 as
  select a.*, b.a, b.b, b.c, b.d
  from &lib..var002 as a left join &lib..var004 as b
  on a.accnut_year=b.accnut_year
  and a.sfrnd_nm_korean=b.sfrnd_nm_korean;
quit;
run;

/*
proc sql;
  create table &lib..var003_up as
  select *
  from &lib..var003
  where sfrnd_nm_korean like '%본청%';
quit;
run;
*/

proc sql;
  delete
  from &lib..var003
  where sfrnd_nm_korean like '%본청%';
quit;
run;

proc sql;
  create table &lib..var005 as
  select *
  , sum(remain) as remain_year label="연도별 세계잉여금"
  , avg(remain_ratio) as rr_year label="연도별 세계잉여금 비율"
  , sum(carry) as carry_year label="연도별 이월사업비"
  , avg(carry_ratio) as cr_year label="연도별 이월사업비 비율"
  , sum(remainder) as remainder_year label="연도별 순세계잉여금"
  , avg(remainder_ratio) as rrr_year label="연도별 순세계잉여금 비율"
  , sum(amount_remain) as amount_remain_year label="연도별 예산집행금(세계잉여금)"
  , avg(ratio_remain) as ratio_remain_year label="연도별 예산집행률(세계잉여금)"
  , sum(amount_remainder) as amount_remainder_year label="연도별 예산집행금(순세계잉여금)"
  , avg(ratio_remainder) as ratio_remainder_year label="연도별 예산집행률(순세계잉여금)"
  from
  (
    select *
    , sum(remain) as remain_wdr label="지역별 세계잉여금"
    , avg(remain_ratio) as rr_wdr label="지역별 세계잉여금 비율"
    , sum(carry) as carry_wdr label="지역별 이월사업비"
    , avg(carry_ratio) as cr_wdr label="지역별 이월사업비 비율"
    , sum(remainder) as remainder_wdr label="지역별 순세계잉여금"
    , avg(remainder_ratio) as rrr_wdr label="지역별 순세계잉여금 비율"
    , sum(amount_remain) as amount_remain_wdr label="지역별 예산집행금(세계잉여금)"
    , avg(ratio_remain) as ratio_remain_wdr label="지역별 예산집행률(세계잉여금)"
    , sum(amount_remainder) as amount_remainder_wdr label="지역별 예산집행금(순세계잉여금)"
    , avg(ratio_remainder) as ratio_remainder_wdr label="지역별 예산집행률(순세계잉여금)"
    from
    (
      select accnut_year label="회계연도"
      , wdr_sfrnd_code label="지역코드"
      , wdr_sfrnd_nm label="지역명"
      , sfrnd_code label="자치단체코드"
      , sfrnd_nm_korean label="자치단체명"
      , a+b+c+d as remain label="세계잉여금"
      , a
      , b
      , c as carry label="이월사업비"
      , d as remainder label="순세계잉여금"
      , (a+b+c+d)/amt1 as remain_ratio label="세계잉여금 비율"
      , c/amt1 as carry_ratio label="이월사업비 비율"
      , d/amt1 as remainder_ratio label="순세계잉여금 비율"
      , amt1-d as amount_remainder label="예산집행금(순세계잉여금)"
      , amt1-d-a-b-c as amount_remain label="예산집행금(세계잉여금)"
      , (amt1-d)/amt1 as ratio_remainder label="예산집행률(순세계잉여금)"
      , (amt1-d-a-b-c)/amt1 as ratio_remain label="예산집행률(세계잉여금)"
      , amt1
      , amt2
      , amt3
      , amt4
      , rate1
      , rate2
      from &lib..var003
    )
    group by accnut_year
    , wdr_sfrnd_code
    , wdr_sfrnd_nm
  )
  group by accnut_year;
quit;
run;

/*
proc sql;
  create table &lib..var005_up as
  select *, sum(remain) as remain_year label="연도별 이월액+불용액", avg(remain_ratio) as rr_year label="연도별 이월액+불용액 비율", sum(carry) as carry_year label="연도별 이월액", avg(carry_ratio) as cr_year label="연도별 이월액 비율", sum(remainder) as remainder_year label="연도별 불용액", avg(remainder_ratio) as rrr_year label="연도별 불용액 비율", avg(ratio) as ratio_year label="연도별 집행률"
  from
  (
    select *, sum(remain) as remain_wdr label="지역별 이월액+불용액", avg(remain_ratio) as rr_wdr label="지역별 이월액+불용액 비율", sum(carry) as carry_wdr label="지역별 이월액", avg(carry_ratio) as cr_wdr label="지역별 이월액 비율", sum(remainder) as remainder_wdr label="지역별 불용액", avg(remainder_ratio) as rrr_wdr label="지역별 불용액 비율", avg(ratio) as ratio_wdr label="지역별 집행률"
    from
    (
      select distinct coalesce(a.accnut_year, b.accnut_year) as accnut_year label="회계연도"
      , coalesce(a.wdr_sfrnd_code, b.wdr_sfrnd_code) as wdr_sfrnd_code label="지역코드"
      , coalesce(a.wdr_sfrnd_nm, b.wdr_sfrnd_code_nm) as wdr_sfrnd_code_nm label="지역명"
      , coalesce(a.sfrnd_code, b.sfrnd_code) as sfrnd_code label="자치단체코드"
      , coalesce(a.sfrnd_nm_korean, b.sfrnd_nm_korean) as sfrnd_nm_korean label="자치단체명"
      , a.amt1-sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam) as remain label="이월액+불용액"
      , a.d as carry label="이월액"
      , a.amt1-sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam)-a.d as remainder label="불용액"
      , (a.amt1-sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam))/a.amt1 as remain_ratio label="이월액+불용액 비율"
      , a.d/a.amt1 as carry_ratio label="이월액 비율"
      , (a.amt1-sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam)-a.d)/a.amt1 as remainder_ratio label="불용액 비율"
      , sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam)/a.amt1 as ratio label="집행률"
      , a.amt1
      , a.amt2
      , a.amt3
      , a.amt4
      , sum(b.gnrl_anexptr_stacntam, b.etc_anexptr_stacntam, b.pblcorp_anexptr_stacntam) as sum label="세출총계"
      , b.gnrl_anexptr_stacntam
      , b.etc_anexptr_stacntam
      , b.pblcorp_anexptr_stacntam
      from &lib..var003_up as a left join &lib..table001 as b
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
*/

proc sql;
  create table &lib..var005_wdr as
  select distinct accnut_year
  , wdr_sfrnd_code
  , wdr_sfrnd_nm
  , remain_wdr
  , rr_wdr
  , carry_wdr
  , cr_wdr
  , remainder_wdr
  , rrr_wdr
  , amount_remain_wdr
  , ratio_remain_wdr
  , amount_remainder_wdr
  , ratio_remainder_wdr
  from &lib..var005;
quit;
run;

proc sql;
  create table &lib..var005_year as
  select distinct accnut_year
  , remain_year
  , rr_year
  , carry_year
  , cr_year
  , remainder_year
  , rrr_year
  , amount_remain_year
  , ratio_remain_year
  , amount_remainder_year
  , ratio_remainder_year
  from &lib..var005;
quit;
run;

/*
proc sql;
  create table &lib..var005_up_wdr as
  select distinct accnut_year
  , wdr_sfrnd_code
  , wdr_sfrnd_code_nm
  , remain_wdr
  , rr_wdr
  , carry_wdr
  , cr_wdr
  , remainder_wdr
  , rrr_wdr
  , ratio_wdr
  from &lib..var005_up;
quit;
run;

proc sql;
  create table &lib..var005_up_year as
  select distinct accnut_year
  , remain_year
  , rr_year
  , carry_year
  , cr_year
  , remainder_year
  , rrr_year
  , ratio_year
  from &lib..var005_up;
quit;
run;
*/
