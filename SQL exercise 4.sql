-- SQL Exercise 4
CREATE DATABASE EX4;
USE EX4;

create table players (
player_id integer not null unique,
group_id integer not null
);

create table matches (
match_id integer not null unique,
first_player integer not null,
second_player integer not null,
first_score integer not null,
second_score integer not null
);

insert into players values 
(20, 2);
insert into players values 
(30, 1);
insert into players values 
(40, 3);
insert into players values 
(45, 1);
insert into players values 
(50, 2);
insert into players values 
(65, 1);

insert into matches values
(1, 30, 45, 10, 12);
insert into matches values
(2, 20, 50, 5, 5);
insert into matches values
(13, 65, 45, 10, 10);
insert into matches values
(5, 30, 65, 3, 15);
insert into matches values
(42, 45, 65, 8, 4);


-- Asnwer
With playerscore as (
	select p.group_id, p.player_id, ifnull(sum(allscore.score),0) as fullscore 
    from players p left join (
		select group_id, player_id, m1.first_score as score
		from players p, matches m1
		where p.player_id = m1.first_player
		UNION
		select group_id, player_id, m2.second_score as score
		from players p, matches m2
		where p.player_id = m2.second_player
		) as allscore
	on p.player_id = allscore.player_id
	group by player_id, group_id
)

select p.group_id, min(p.player_id) as winner_id
from playerscore p
where p.fullscore = (
	select max(fullscore)
    from playerscore p2
	where p.group_id = p2.group_id
    )
group by group_id
order by group_id
;

