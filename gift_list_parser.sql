--each child: primary and backup gift choices, color preferences, gift complexity, gift department
 
select c.name,
c.child_id,
wl.wishes ->> 'first_choice' AS first_choice,
wl.wishes ->> 'second_choice' as second_choice,
wl.wishes -> 'colors' ->> 0 as favorite_color,
JSON_ARRAY_LENGTH(wl.wishes -> 'colors') as color_count,
CASE tc.difficulty_to_make WHEN 1 THEN 'Simple Gift' WHEN 2 THEN 'Moderate Gift' ELSE 'Complex Gift' END as gift_complexity,
CASE tc.category WHEN 'outdoor' THEN 'Outside Workshop' WHEN 'educational' THEN 'Learning Workshop' ELSE 'General Workshop' END as workshop_assignment
from children c
join wish_lists wl on c.child_id = wl.child_id
join toy_catalogue tc on (wl.wishes ->> 'first_choice') = tc.toy_name
order by c.name asc
limit 5;
