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

--- Total goals by team name
SELECT eteam.teamname, COUNT(goal.teamid) AS goals FROM eteam INNER JOIN goal ON (goal.teamid = eteam.id) GROUP BY eteam.teamname;

--- Total goals scored by stadium
SELECT game.stadium, COUNT(goal.matchid) AS goals FROM game INNER JOIN goal ON (goal.matchid = game.id) GROUP BY game.stadium;

-- Show matchid, date, num of goals scored when Poland was playing
SELECT game.id, game.mdate, COUNT(goal.matchid) AS goals FROM game INNER JOIN goal ON (goal.matchid = game.id) WHERE game.team1 = 'POL' OR game.team2 = 'POL' GROUP BY game.id;

-- Show matchid, date, and number of goals in games where GER scored
SELECT game.id, game.mdate, COUNT(goal.matchid) AS goals FROM game INNER JOIN goal ON (goal.matchid = game.id) WHERE goal.teamid = 'GER' GROUP BY game.id;

-- Every match showing overall team scores
SELECT game.mdate, game.team1, SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1, 
    game.team2, SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
    FROM game INNER JOIN goal ON (goal.matchid = game.id) GROUP BY game.mdate, game.team1, game.team2
    ORDER BY game.mdate, game.team1, game.team2;