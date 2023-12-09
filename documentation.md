## Dataset Documentation
### Filename: "game_bets.csv"

#### Original Datasets
Kaggle Betting Dataset: https://www.kaggle.com/datasets/tobycrabtree/nfl-scores-and-betting-data \
Pro Football Reference Game Data: https://www.pro-football-reference.com/boxscores/game-scores.htm

#### Datasat Summary
3508 NFL Games \
24 Distinct Observations per Game \
18 Missing Values

#### Description
A dataset consisting of historical NFL game data, betting lines set on these respective games, and other external factors, such as weather conditions in play for each game.

#### Observations
**game_id**: Unique ID for each game containing the date of the game, and the 2-3 letter id of the team that was at home \
**week, day, date**: Which week of the NFL season the game took place, what day of the week it was, and the calendar date of the game \
**winner, loser**: The 2-3 letter abbreviation(team_id) for the teams that won and lost the game \
**PtsW, PtsL, YdsW, YdsL, TOW, TOL**: The total number of points, yards, and turnovers recorded by the winning and losing teams \
**atHome**: If the winning team was the home team in the game \
**TODiff**: The amount of turnovers the winning team had compared to the losing team \
**schedule_playoff**: If the game was a playoff game \
**team_favorite_id**: The 2-3 letter abbreviation(team_id) of the team that was favored to win \
**spread_favorite**: Number of points the favored team was favored to win by \
**over_under_line**: Total number of game points projected by oddsmakers \
**stadium**: The name of the stadium where the game took place \
**stadium_neutral**: If the game was played on a neutral site \
**weather_temperature**: The temperature of the environment where the game was played in Fahrenheit \
**weather_wind_mph**: Wind speed in the environment of the game(if applicable) \
**weather_humidity**: The humidity of environment in which the game was played in grams of water vapor per kilogram of air \
**weather_detail**: The condition in which the game was played in(indoor, snow, rain, etc.) \
