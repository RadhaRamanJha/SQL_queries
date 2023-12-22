use soccer_db;
-- 1.	Write a SQL query to find out where the final match of the EURO cup 2016 was played. Return venue name, city.
SELECT 
    venue_name, soccer_city.city
FROM
    soccer_city
        INNER JOIN
    soccer_venue ON soccer_city.city_id = soccer_city.city_id
        INNER JOIN
    match_mast ON soccer_venue.venue_id = match_mast.venue_id
        INNER JOIN
    match_details ON match_mast.match_no = match_details.match_no
WHERE
    match_details.play_stage = 'F'
ORDER BY match_mast.play_date DESC
LIMIT 1; 

-- 2.	Write a SQL query to find the number of goals scored by each team in each match during normal play. Return match number, country name and goal score.
SELECT 
    match_details.match_no,
    match_details.goal_score,
    soccer_country.country_name
FROM
    match_details
        INNER JOIN
    soccer_country ON match_details.team_id = soccer_country.country_id
ORDER BY match_no;
select * from penalty_gk;
select * from soccer_country;

-- 3.	Write a SQL query to count the number of goals scored by each player within a normal play schedule. Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. Return player name, number of goals and country name.
SELECT 
    player_mast.player_name,
    COUNT(goal_details.goal_id) goal_scored,
    soccer_country.country_name
FROM
    goal_details
        INNER JOIN
    player_mast ON goal_details.player_id = player_mast.player_id
        INNER JOIN
    soccer_country ON player_mast.team_id = soccer_country.country_id
WHERE
    goal_details.goal_type = 'N'
GROUP BY player_mast.player_name , soccer_country.country_name;

-- 4.	Write a SQL query to find out who scored the most goals in the 2016 Euro Cup. Return player name, country name and highest individual scorer.
SELECT 
    player_mast.player_name,
    soccer_country.country_name,
    COUNT(goal_details.goal_id) goal_scored
FROM
    goal_details
        INNER JOIN
    player_mast ON goal_details.player_id = player_mast.player_id
        INNER JOIN
    soccer_country ON player_mast.team_id = soccer_country.country_id
GROUP BY player_mast.player_name , soccer_country.country_name
ORDER BY goal_scored DESC
LIMIT 1;

-- 5. Write a SQL query to find out who scored in the final of the 2016 Euro Cup. Return player name, jersey number and country name.
SELECT 
    player_mast.player_name,
    player_mast.jersey_no,
    soccer_country.country_name
FROM
    player_mast
        INNER JOIN
    goal_details ON player_mast.player_id = goal_details.player_id
        INNER JOIN
    soccer_country ON goal_details.team_id = soccer_country.country_id
WHERE
    goal_details.play_stage = 'F';

-- 6.	Write a SQL query to find out which country hosted the 2016 Football EURO Cup. Return country name. 
SELECT DISTINCT
    soccer_country.country_name
FROM
    soccer_country
        INNER JOIN
    soccer_city ON soccer_country.country_id = soccer_city.country_id
        INNER JOIN
    soccer_venue ON soccer_city.city_id = soccer_venue.city_id;

-- 7.	Write a SQL query to find out who scored the first goal of the 2016 European Championship. Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half.
SELECT 
    player_mast.player_name,
    player_mast.jersey_no,
    soccer_country.country_name,
    goal_details.goal_time,
    goal_details.play_stage,
    goal_details.goal_schedule,
    goal_details.goal_half
FROM
    goal_details
        INNER JOIN
    player_mast ON goal_details.player_id = player_mast.player_id
        INNER JOIN
    soccer_country ON player_mast.team_id = soccer_country.country_id
WHERE
    goal_details.goal_id = 1;

-- 8.	Write a SQL query to find the referee who managed the opening match. Return referee name, country name.
select referee_mast.referee_name, soccer_country.country_name
from referee_mast 
inner join match_mast 
on referee_mast.referee_id = match_mast.referee_id
inner join soccer_country
on referee_mast.country_id  = soccer_country.country_id 
where match_mast.match_no = 1;

-- 9. Write a SQL query to find the referee who managed the final match. Return referee name, country name.
select referee_mast.referee_name,  soccer_country.country_name 
from referee_mast 
inner join match_mast 
on referee_mast.referee_id = match_mast.referee_id
inner join soccer_country
on referee_mast.country_id  = soccer_country.country_id 
where match_mast.play_stage = 'F';

-- 10.	Write a SQL query to find the referee who assisted the referee in the opening match. Return associated referee name, country name.
select asst_referee_mast.ass_ref_name, soccer_country.country_name
from asst_referee_mast
inner join match_details
on asst_referee_mast.ass_ref_id = match_details.ass_ref
inner join soccer_country
on asst_referee_mast.country_id  = soccer_country.country_id 
where match_details.match_no = 1;

-- 11.	Write a SQL query to find the referee who assisted the referee in the final match. Return associated referee name, country name.
select asst_referee_mast.ass_ref_name, soccer_country.country_name
from asst_referee_mast
inner join match_details
on asst_referee_mast.ass_ref_id = match_details.ass_ref
inner join soccer_country
on asst_referee_mast.country_id  = soccer_country.country_id 
where match_details.play_stage = 'F';

-- 12.	Write a SQL query to find the city where the opening match of EURO cup 2016 took place. Return venue name, city.
select soccer_city.city , soccer_country.country_name
from soccer_city
inner join soccer_country
on soccer_city.country_id  = soccer_country.country_id
inner join soccer_venue
on soccer_city.city_id = soccer_venue.city_id
inner join match_mast
on  soccer_venue.venue_id = match_mast.venue_id
where match_mast.match_no = 1;

-- 13.	Write a SQL query to find out which stadium hosted the final match of the 2016 Euro Cup. Return venue_name, city, aud_capacity, audience.
select soccer_venue.venue_name, soccer_city.city,
soccer_venue.aud_capacity, match_mast.audience
from soccer_city
inner join soccer_country
on soccer_city.country_id  = soccer_country.country_id
inner join soccer_venue
on soccer_city.city_id = soccer_venue.city_id
inner join match_mast
on  soccer_venue.venue_id = match_mast.venue_id
where match_mast.play_stage = 'F';

-- 14.	Write a SQL query to count the number of matches played at each venue. Sort the result-set on venue name. Return Venue name, city, and number of matches.
select sv.venue_name, sc.city, count(mm.match_no) 'matches_num'
from soccer_city sc
inner join soccer_venue sv
on sv.city_id = sc.city_id
inner join match_mast mm
on sv.venue_id = mm.venue_id
group by sv.venue_name,sc.city
order by sv.venue_name;

-- 15.	Write a SQL query to find the player who was the first player to be sent off at the tournament EURO cup 2016. Return match Number, country name and player name.
select pb.match_no, sc.country_name,pm.player_name
from player_booked pb
inner join soccer_country sc
on pb.team_id = sc.country_id
inner join player_mast pm
on pm.team_id = sc.country_id
where pb.sent_off = 'Y'
and pb.match_no = 1
order by pb.booking_time limit 1;

# solution given 
SELECT match_no, country_name, player_name, 
booking_time as "sent_off_time", play_schedule, jersey_no
FROM player_booked a
JOIN player_mast b
ON a.player_id=b.player_id
JOIN soccer_country c
ON a.team_id=c.country_id
AND  a.sent_off='Y'
AND match_no=(
	SELECT MIN(match_no) 
	from player_booked)
ORDER BY match_no,play_schedule,play_half,booking_time;










