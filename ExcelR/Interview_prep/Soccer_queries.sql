use soccer_db;
-- 1.	Write a SQL query to find out where the final match of the EURO cup 2016 was played. Return venue name, city.
select venue_name,soccer_city.city 
from soccer_city inner join soccer_venue 
     on soccer_city.city_id = soccer_city.city_id 
inner join match_mast 
     on soccer_venue.venue_id = match_mast.venue_id 
inner join match_details
     on match_mast.match_no = match_details.match_no
where match_details.play_stage = 'F'
order by match_mast.play_date desc
limit 1; 

-- 2.	Write a SQL query to find the number of goals scored by each team in each match during normal play. Return match number, country name and goal score.
select match_details.match_no, match_details.goal_score, soccer_country.country_name
from match_details
     inner join soccer_country
     on match_details.team_id = soccer_country.country_id
     order by match_no;
select * from penalty_gk;
select * from soccer_country;

-- 3.	Write a SQL query to count the number of goals scored by each player within a normal play schedule. Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. Return player name, number of goals and country name.
select player_mast.player_name, count(goal_details.goal_id) goal_scored, soccer_country.country_name
from goal_details inner join player_mast  
on goal_details.player_id = player_mast.player_id
inner join soccer_country
on player_mast.team_id = soccer_country.country_id
where goal_details.goal_type = "N"
group by player_mast.player_name,soccer_country.country_name;

-- 4.	Write a SQL query to find out who scored the most goals in the 2016 Euro Cup. Return player name, country name and highest individual scorer.
select player_mast.player_name, soccer_country.country_name, count(goal_details.goal_id) goal_scored
from goal_details inner join player_mast  
on goal_details.player_id = player_mast.player_id
inner join soccer_country
on player_mast.team_id = soccer_country.country_id
group by player_mast.player_name,soccer_country.country_name
order by goal_scored desc
limit 1;

-- 5. Write a SQL query to find out who scored in the final of the 2016 Euro Cup. Return player name, jersey number and country name.
select player_mast.player_name, player_mast.jersey_no, soccer_country.country_name
from player_mast inner join goal_details
on player_mast.player_id = goal_details.player_id
inner join soccer_country
on goal_details.team_id = soccer_country.country_id
where goal_details.play_stage = 'F';

-- 6.	Write a SQL query to find out which country hosted the 2016 Football EURO Cup. Return country name. 
select distinct soccer_country.country_name 
from soccer_country inner join soccer_city
on  soccer_country.country_id = soccer_city.country_id
inner join soccer_venue on 
soccer_city.city_id = soccer_venue.city_id;

-- 7.	Write a SQL query to find out who scored the first goal of the 2016 European Championship. Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half.

####   TO solve #####
select * from goal_details;

-- 8.	Write a SQL query to find the referee who managed the opening match. Return referee name, country name.
select referee_mast.referee_name, soccer_country.country_name
from   referee_mast inner join soccer_country
on     referee_mast.country_id = soccer_country.country_id
inner join match_details 
on    soccer_country.country_id = match_details.team_id
where match_details.match_no = 1;