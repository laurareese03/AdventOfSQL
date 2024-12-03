select string_agg(lets, '') from 
(select chr(b.value) as lets from letters_a a
full join letters_b b on a.id = b.id
where concat(chr(a.value), chr(b.value)) ~ '[A-Za-z0-9 !"(),-.:;?]'
order by a.id, b.id) as lets;
