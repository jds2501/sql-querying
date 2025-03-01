-- Setup for SQL script by starting with a fresh database --
\i ./euro2012_data.sql;

-- Show match ID & player for players from Russia
SELECT matchid, player FROM goal WHERE teamid = 'GER';

-- Show id, stadium, team1, team2  for game 1012
SELECT id, stadium, team1, team2 FROM game WHERE id = 1012;

-- Show player, teamid, stadium, and mdate for every German goal
SELECT goal.player, goal.teamid, game.stadium, game.mdate FROM game INNER JOIN goal ON (game.id = goal.matchid) WHERE goal.teamid = 'GER';

--- Show team1, team2, and players with Mario's name in it
SELECT game.team1, game.team2, goal.player FROM game INNER JOIN goal ON (game.id = goal.matchid) WHERE goal.player LIKE 'Mario%';

--- Player, teamid, coach, gtime for all goals scored within first 10 minutes
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime FROM goal INNER JOIN eteam ON (eteam.id = teamid) WHERE goal.gtime <= 10;

--- Date & team where Fernando Santos was team 1 coach
SELECT game.mdate, game.team1 FROM game INNER JOIN eteam ON (eteam.id = game.team1) WHERE coach = 'Fernando Santos';

--- Players who scored at 'National Stadium, Warsaw'
SELECT goal.player FROM goal INNER JOIN game ON (goal.matchid = game.id) WHERE stadium = 'National Stadium, Warsaw';

--- Show players who scored a goal against Germany
SELECT DISTINCT goal.player FROM goal INNER JOIN game ON (goal.matchid = game.id) WHERE goal.teamid != 'GER' AND (game.team1 = 'GER' OR game.team2 = 'GER');