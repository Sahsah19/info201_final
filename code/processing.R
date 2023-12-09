library(tidyverse)
teams <- read_delim("nfl_teams.csv")

# process and filter data
nfl_data <- read_delim("nfl_data.csv") %>%
  # arrange by games by date
  arrange(Date) %>%
  # filter games with betting data
  filter(Date >= as.Date("1979-09-01")) %>%
  # add in new observations
  mutate(atHome = ifelse(is.na(...7), TRUE, FALSE)) %>%
  mutate(TODiff = TOL - TOW) %>%
  # drop unnecessary observations
  select(-Rk, -...5, -...9, -...7) %>%
  # rename observations
  set_names("week", "day", "date", "winner", "loser", "PtsW", "PtsL", "YdsW", "TOW", "YdsL", "TOL", "atHome", "TODiff")

ids <- c()

# find game_id for each game
for (row in 1:nrow(nfl_data)) {
  nfl_data$winner[row] = teams$team_id[teams$team_name == nfl_data$winner[row]]
  nfl_data$loser[row] = teams$team_id[teams$team_name == nfl_data$loser[row]]
  date <- str_replace_all(nfl_data$date[row], "-", "")
  team_id <- ifelse(nfl_data$atHome[row], tolower(nfl_data$winner[row]), tolower(nfl_data$loser[row]))
  ids <- c(ids, paste(date, "0", team_id, sep=""))
}

nfl_data <- cbind(game_id = ids, nfl_data)
head(nfl_data)

betting_data <- read_delim("spreadspoke_scores.csv")

ids <- c()

# find game_id for each game
for (row in 1:nrow(betting_data)) {
  date <- strsplit(as.character(betting_data$schedule_date[row]), "/")[[1]]
  if (nchar(date[1]) == 1) date[1] <- paste0("0", date[1])
  if (nchar(date[2]) == 1) date[2] <- paste0("0", date[2])
  team_id <- tolower(teams$team_id[teams$team_name == betting_data$team_home[row]])
  ids <- c(ids, paste(date[3], date[1], date[2], "0", team_id, sep=""))
}

betting_data <- cbind(game_id = ids, betting_data)
betting_data <- transform(betting_data, over_under_line = as.numeric(over_under_line))
head(betting_data)

# merge both datasets
game_bets <- inner_join(nfl_data, betting_data) %>%
  select(-schedule_date, -schedule_season, -schedule_week, -team_home, -score_home, -score_away, -team_away)
head(game_bets)
# write to csv file
write_csv(game_bets, "game_bets.csv")