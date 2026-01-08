# 0007: 정치인 트위터 분석

[← 메인으로 돌아가기](../README.md)

## 개요

**이재명**, **박원순** 두 정치인의 트위터 데이터를 수집하고 분석하는 SAS 과제 프로젝트입니다.

### 분석 내용

1. 트윗 활동 패턴 (좋아요, 리트윗 수)
2. 요일별 트윗 반응 비교
3. 리트윗 확산 경로 분석
4. 팔로워 누적 추이

---

## 데이터

### 데이터 파일

```
Tables/
├── 박원순 트윗 목록_SAS용.csv     # 박원순 트윗 데이터
├── 박원순 리트윗 목록.csv         # 박원순 트윗의 리트윗 목록
├── 박원순 리트윗 팔로워.csv       # 리트윗한 사용자의 팔로워 정보
├── 이재명 트윗 목록_SAS용.csv     # 이재명 트윗 데이터
├── 이재명 리트윗 목록.csv         # 이재명 트윗의 리트윗 목록
└── 이재명 리트윗 팔로워.csv       # 리트윗한 사용자의 팔로워 정보
```

### 생성되는 데이터셋

| 데이터셋 | 설명 |
|---------|------|
| `D001` | 박원순 트윗 목록 |
| `D002` | 이재명 트윗 목록 |
| `D003` | 두 정치인 트윗 통합 |
| `D004` | 박원순 리트윗 팔로워 |
| `D005` | 이재명 리트윗 팔로워 |
| `D006` | 박원순 리트윗 목록 |
| `D007` | 이재명 리트윗 목록 |
| `D008` | 박원순 리트윗 + 팔로워 병합 |
| `D009` | 박원순 누적 팔로워 계산 |
| `D010` | 이재명 리트윗 + 팔로워 병합 |
| `D011` | 이재명 누적 팔로워 계산 |

---

## 코드 구조

### 실행 순서

```
1. 데이터 수집
   └── Extraction.sas
       ├── 트윗 데이터 (D001-D003)
       ├── 리트윗/팔로워 데이터 (D004-D007)
       └── 누적 팔로워 계산 (D008-D011)

2. 통계 분석
   └── Statistics.sas
       ├── 기초 통계량 (좋아요, 리트윗)
       └── 요일별 분석
```

### 파일 설명

| 파일명 | 역할 |
|-------|------|
| `Extraction.sas` | CSV 데이터 읽기 및 전처리 |
| `Statistics.sas` | 기초 통계 및 요일별 분석 |

---

## 변수 설명

### 트윗 데이터 (D001, D002)

| 변수 | 설명 |
|-----|------|
| `No` | 트윗 번호 |
| `favorite` | 좋아요 수 |
| `retweeted` | 리트윗 수 |
| `retweet` | 리트윗 여부 (0/1) |
| `reply` | 답글 여부 (0/1) |
| `day_num` | 요일 번호 |

### 리트윗 분석 (D008-D011)

| 변수 | 설명 |
|-----|------|
| `followers` | 리트윗한 사용자의 팔로워 수 |
| `F_acc` | 누적 팔로워 수 (천 명) |
| `BC` | 인증 계정 여부 |
| `FO` | 팔로잉 여부 |
| `UF` | 언팔로우 여부 |

---

## 분석 방법

### 1. 기초 통계

좋아요 및 리트윗 수의 기초 통계량:

```sas
proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  where retweet=0 and reply=0;  /* 오리지널 트윗만 */
run;
```

### 2. 요일별 분석

요일에 따른 트윗 반응 비교:

```sas
proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  class day_num;
  where retweet=0 and reply=0;
run;
```

### 3. 누적 팔로워 계산

리트윗 순서에 따른 도달 범위 계산:

```sas
proc sql;
  create table &lib..D009 as
  select *,
    (select SUM(b.followers)
     from &lib..D008 as b
     where b.no <= a.no and no^=1)/1000 as F_acc
  from &lib..D008 as a
  order by a.no;
quit;
```

---

## 분석 주요 포인트

### 이상치 처리

박원순 데이터에서 특정 트윗(No=88, 82) 제외:

```sas
proc means data=&lib..D001 n mean median std min max;
  var favorite retweeted;
  where no^=88 and no^=82 and retweet=0 and reply=0;
run;
```

### 오리지널 트윗만 분석

리트윗과 답글을 제외한 순수 트윗만 분석:

```sas
where retweet=0 and reply=0;
```

---

## 실행 방법

### 1. 환경 설정

```sas
/* 경로를 본인 환경에 맞게 수정 */
%let dir=C:\Users\사용자\SAS-Projects\0007\;
%let lib=A0007;
libname &lib "&dir";
```

### 2. 데이터 파일 준비

`Tables/` 폴더에 트위터 데이터 CSV 파일 배치

### 3. 실행 순서

1. `Extraction.sas` 실행 (데이터 읽기)
2. `Statistics.sas` 실행 (통계 분석)

---

## 참고

- 트위터 데이터는 별도 수집 필요 (API 또는 크롤링)
- `guessingrows=32767`: 대용량 CSV 읽기 시 변수 형식 추정 정확도 향상
