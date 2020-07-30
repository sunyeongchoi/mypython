# 1. 나이순으로 desc/ id,이름, 나이, 정당
select id, 이름, 나이, 정당 from members order by 나이 desc;
# 2. 나이가 60 - 80 / id, 이름, 나이, 정당, 취미특기
select id, 이름, 나이, 정당, 취미특기 from members where 나이 >= 60 and 나이 <= 80 order by 나이 desc;
# 2.1 나이가 20 ~ 40 / id, 이름, 나이, 정당, 취미특기
select id, 이름, 나이, 정당, 취미특기 from members where 나이 >= 20 and 나이 <= 40 order by 나이 desc;
# 3. 취미특기가 없는 member 가져오기
select * from members where 취미특기="";
# 3.1 취미특기가 없는 member의 취미특기 값을 '없음'으로 update
update members
set 취미특기 = '없음'
where 취미특기 = "";
# 4. 이름 홍길동 --> 홍 substring
select substr(이름 from 1 for 1)
from members;
# 4.1 이름의 성씨별로 count 예를 들어 김10
select substr(이름 from 1 for 1), count(substr(이름 from 1 for 1))
from members
group by substr(이름 from 1 for 1);
# 5. 소속위원회 문자열 중 '보건복지'인 member 가져오기
select *
from members
where 소속위원회 like '%보건복지%';
# 5.1 소속위원회 문자열 중 '보건복지' 이거나 '법제사법' sort 소속위원회 asc
select *
from members
where 소속위원회 like '%보건복지%' or 소속위원회 like '%법제사법%'
order by 소속위원회 asc;
# 6. 비서가 4명인 member
select mem.이름, mem.비서, mem.cnt
from (select 이름, 비서,(length(비서)-length(replace(비서,',',''))+1) as cnt from members) as mem
where cnt = 4;
# length()함수 사용
# subquery사용 - 2개의 query를 사용

# 7. 더블어민주당, 초선, 경기 member 가져오기
select *
from members
where 정당='더불어민주당'
and 당선횟수='초선'
and 선거구='경기';
# 7.1 미래통합당, 초선, 경기 member 가져오기
select *
from members
where 정당='미래통합당'
and 당선횟수='초선'
and 선거구='경기';
# 7.2 정당별로 초선, 경기인 member 가져오기 - 한번에 가져옴
select *
from members
where 당선횟수 = '초선' and 선거구='경기'
group by 정당;
select 비서 from members;