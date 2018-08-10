/* 9. 
Show teamname and the total number of goals scored.
COUNT and GROUP BY */
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

/* 10.
Show the stadium and the number of goals scored in each stadium. */
SELECT stadium, COUNT(*)
FROM game JOIN goal ON id = matchid
GROUP BY stadium

/* 11.
For every match involving 'POL', show the matchid, date and the number of goals scored. */
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

/* 12.
For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'. */
SELECT matchid, mdate, COUNT(*)
FROM goal JOIN game ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid, mdate

------------------------- HARD ----------------------------------
/* 13.
List every match with the goals scored by each team as shown. 
mdate         team1	score1	team2	score2
1 July 2012	  ESP	  4	      ITA	  0
10 June 2012	ESP	  1	      ITA	  1
10 June 2012	IRL	  1	      CRO	  3
...
Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, 
otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. 
Sort your result by mdate, matchid, team1 and team2. */
SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, 
       team2, SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON matchid = id 
     -- use LEFT JOIN, otherwise, those match with no goal won't appear in the result
GROUP BY matchid, mdate, team1, team2
ORDER BY mdate, matchid, team1, team2
