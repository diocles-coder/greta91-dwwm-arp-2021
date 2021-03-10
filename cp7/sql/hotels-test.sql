use holidays
;

select * 
from cities 
	join hotels using(zip)
    join rooms using(hno)
    join booking using(rno)
    join customers using(cno)
;