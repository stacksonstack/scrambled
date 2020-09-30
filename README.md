# DESCRIPTION
This command line game called Scrambled lets a user sign in/create an account then play a game where they will have to unscramble a word where only the first letter is in the correct order. Ex: user is prompted with "wrdo" and must guess "word".

# CLASSES
There are 3 primary classes for the game and one CLI class to run the game.
  -Player: has many games; has many words, through game
  -Game: belongs to player; belongs to word
  -Word: has many games; has many players, through game

# NAVIGATION
-Welcome Menu: user can create an account; user can log in; user can check game instructions
-Login Menu: user can play a game; user can check leaderboard (top 10) stats; user can check game history; user can log out
-Play Game Menu: user can pick difficulty (easy or hard), which starts the game

# TOOLS (GEMS) USED
-ActiveRecord: for persisting data
-TTY: for prompting users to respond
-artii: for displaying ascii art
-figlet: fonts for ascii art
-colorize: colors for ascii art
-RestClient*: for making API requests to Google Dictionary API
*implemented correctly, but demos are done with manually seeded data to prevent API call limits

# CREATORS
-Stacey Carrillo
-Billy Ott