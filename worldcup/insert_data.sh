#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    # get team_id 
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team name
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_NAME == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $WINNER
      fi
      # get winner id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi
  if [[ $OPPONENT != "opponent" ]]
  then
    # get team_id 
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team name
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_NAME == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
      # get opponent id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
    if [[ $YEAR != "year" OR $ROUND != "round" OR  $WINNER_GOALS != winner_goals OR $OPPONENT_GOALS != "opponent_goals"]]
    then
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$WINNER_GOALS', '$OPPONENT_GOALS', '$WINNER_ID', "$OPPONENT_ID")")
      if if [[ $INSERT_GAME == 'INSERT 0 1' ]]
      then echo Inserted into games, $YEAR $ROUND $WINNER_GOALS $OPPONENT_GOALS $OPPONENT
      fi
    fi


done
