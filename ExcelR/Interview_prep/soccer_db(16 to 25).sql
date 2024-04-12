show databases;
use soccer_db;
show tables;
select * from soccer_team;
select * from soccer_country;
select * from goal_details;
select * from match_details;
select * from match_mast;
select * from player_booked;
select * from referee_mast;
select * from asst_referee_mast;
select * from penalty_gk;
select * from player_in_out;
select * from player_mast;
select * from soccer_venue;

/*
16.	Write a SQL query to find the teams that have scored one goal in the tournament.
Return country_name as "Team", team in the group, goal_for.
*/

select country_name as team, team_group as 'team in group', sum(goal_for) as goal_for
from soccer_country inner join soccer_team
on soccer_country.country_id = soccer_team.team_id
group by country_name, team_group
having sum(goal_for) = 1;

/*
17.	Write a SQL query to count the number of yellow cards each country has received.
Return country name and number of yellow cards.
*/  
select soccer_country.country_name team,count(player_booked.sent_off) as "Total Yellow cards"
from soccer_country inner join player_booked
on soccer_country.country_id = player_booked.team_id
group by soccer_country.country_name
order by count(player_booked.sent_off) desc;
/*
18.	Write a SQL query to count the number of goals that have been seen.
Return venue name and number of goals.
*/
select * from match_mast;
select * from goal_details;
select soccer_venue.venue_name Venue, count(goal_details.goal_id) 'Total Goals'
from soccer_venue inner join match_mast 
on soccer_venue.venue_id = match_mast.venue_id
inner join goal_details
on goal_details.match_no = match_mast.match_no
group by soccer_venue.venue_name 
order by count(goal_details.goal_id) desc ;

/*
19.	Write a SQL query to find the match where there was no stoppage time in the first half.
 Return match number, country name.
 */
select match_mast.match_no 'Match NUmber',soccer_country.country_name 'Country Name'
from match_mast inner join soccer_venue
on match_mast.venue_id = soccer_venue.venue_id
inner join match_details
on match_details.match_no = match_mast.match_no
inner join soccer_country
on soccer_country.country_id = match_details.team_id 
where match_mast.stop1_sec = 0;

/*
20.	Write a SQL query to find the team(s) who conceded the most goals in EURO cup 2016. 
Return country name, team group and match played.
*/
select soccer_country.country_name team,soccer_team.team_group, soccer_team.match_played
from soccer_country inner join soccer_team
on soccer_team.team_id = soccer_country.country_id
where soccer_team.goal_agnst = (select max(soccer_team.goal_agnst) from soccer_team);

/*
21.	Write a SQL query to find those matches where the highest stoppage time was added in 2nd half of play. 
Return match number, country name, stoppage time(sec.).
*/
select match_mast.match_no 'Match NUmber',soccer_country.country_name 'Country Name',match_mast.stop2_sec '2nd half stoppage time(sec.)'
from match_mast inner join soccer_venue
on match_mast.venue_id = soccer_venue.venue_id
inner join match_details
on match_details.match_no = match_mast.match_no
inner join soccer_country
on soccer_country.country_id = match_details.team_id 
where match_mast.stop2_sec  = (select max(match_mast.stop2_sec) from match_mast);

/*
22.	Write a SQL query to find the matches that ended in a goalless draw at the group stage. 
Return match number, country name.
*/

select match_details.match_no, soccer_country.country_name
from match_details inner join soccer_country
on match_details.team_id = soccer_country.country_id
where match_details.win_lose = 'D' and 
match_details.play_stage = 'G' and
match_details.goal_score = 0;

/*
23.	Write a SQL query to find those match(s) where the second highest amount of stoppage time was added in the second half of the match. 
Return match number, country name and stoppage time.
*/
select match_mast.match_no 'Match NUmber',soccer_country.country_name 'Country Name',match_mast.stop2_sec '2nd half stoppage time(sec.)'
from match_mast inner join soccer_venue
on match_mast.venue_id = soccer_venue.venue_id
inner join match_details
on match_details.match_no = match_mast.match_no
inner join soccer_country
on soccer_country.country_id = match_details.team_id 
where match_mast.stop2_sec  = 
(select stop2_sec from match_mast order by stop2_sec desc limit 1 offset 1 );

/*
24.	Write a SQL query to find the number of matches played by a player as a goalkeeper for his team. 
Return country name, player name, number of matches played as a goalkeeper.
*/
select * from playing_position;
select * from player_mast;
select * from match_details;
select * from soccer_country;
SELECT b.country_name,c.player_name,COUNT(a.player_gk) count_gk
FROM match_details a
JOIN soccer_country b ON a.team_id=b.country_id
JOIN player_mast c ON a.player_gk=c.player_id
GROUP BY b.country_name,c.player_name
ORDER BY country_name,player_name,count_gk DESC;

/*
25.	Write a SQL query to find the venue where the most goals have been scored. 
Return venue name, number of goals.
*/

select sv.venue_name, sum(md.goal_score) 'Total Goals'
from soccer_venue as sv inner join match_mast mm
on sv.venue_id = mm.venue_id
inner join match_details md
on mm.match_no = md.match_no
group by (sv.venue_name)
order by sum(md.goal_score) desc
limit 1;

