select * from users a
order by a.created_at desc limit 5 ;

-- 2

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
-- LIMIT 2
;

select a.*
-- , count(*) 
from users a
where not exists ( select 1 from photos b where a.id = b.user_id)
order by 1 ; 

select a.* 
--  , count(*) 
from users a
left join photos b
on a.id = b.user_id
where b.user_id is null 
order by 1 ; 

select a.* from 
(
select u.* , count(*) cnt from users u , likes l
where u.id = l.user_id
group by u.id
) a
where a.cnt >= ( select count(*) cnt from photos ); 


select * from 
(
select u.* , count(*) cnt from users u , likes l
where u.id = l.user_id
group by u.id
) a, 
( select count(*) cnt from photos ) b
where a.cnt >= b.cnt; 
 
