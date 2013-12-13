#Bevalkyri

The description of the project...

+ Link to Github Repo: https://github.com/RDFroeber/bevalkyri
+ Link to Heroku App: http://bevalkyri.herokuapp.com/
+ Ruby version: 2.0.0
+ System dependencies
  * Backaid: Underscore.js and Backbone.js `rails g backaid`
+ Configuration
`bundle install`
+ Database creation
Add a database.yml file...
`rake db:create`
+ Database initialization
`rake db:migrate`  
+ How to run the test suite
  * Use `rake db:migrate RAILS_ENV=test` to migrate your test environment
  * Use `rspec` to run the rspec test suite
  * Use `rake jasmine` to run the jasmine test suite


## Data Model
+ Users
  * name
  * email
  * pasword_digest
  * *can have many Players*
+ Player
  * user_id fk *belongs to a User*
  * name
  * kingdom
  * crest
  * color_one
  * color_two
  * manifesto
  * *can have many Games*
  * *can have many Buildings*
  * *can have zero to many Tiles*
+ Game (Join between Player and Board)
  * player_id fk *belongs to a Player*
  * board_id fk *belongs to a Board*
+ Board
  * geography?
  * *can have many Buildings*
  * *can have many Games*
  * *can have many Buildings*
  * *can have many Tiles*
+ Tiles
  * player_id fk *belongs to a Player*
  * board_id fk *belongs to a Board*
  * location
  * taken?
+ Buildings (STI)
  * player_id fk *belongs to a Player*
  * board_id fk *belongs to a Board*
  * type ('Castle', 'House', 'Base')
  * location
  * range ('Base')

## User Stories
**As a User**

1. I want to be able to create an account so that my personal information is saved and secure.

2. I want to be able to login to my account so that I can access my personal information.

3. I want to be able to create a new player so that I can play a game.

4. I want to be able to use an existing player profile to play a game so that I can immediately start playing.

5. I want to be able to create a new game so that I can start playing from the beginning.

6. I want to be able to save my current game so that I do not loose my progress and can come back to it at a later time.

7. I want to be able to resume a game that I have already started so that I can pick up where I left off.

8. I want to...
