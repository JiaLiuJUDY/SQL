// 9.
// Show teamname and the total number of goals scored.
// COUNT and GROUP BY

SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
