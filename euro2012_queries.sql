-- Setup for SQL script by starting with a fresh database --
\i ./euro2012_data.sql;

-- Show match ID & player for players from Russia
SELECT matchid, player FROM goal WHERE teamid = 'GER';

-- Show id, stadium, team1, team2  for game 1012
SELECT id, stadium, team1, team2 FROM game WHERE id = 1012;

-- Show player, teamid, stadium, and mdate for every German goal
SELECT goal.player, goal.teamid, game.stadium, game.mdate FROM game INNER JOIN goal ON (game.id = goal.matchid) WHERE goal.teamid = 'GER';

