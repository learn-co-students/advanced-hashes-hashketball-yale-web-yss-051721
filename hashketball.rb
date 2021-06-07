# Write your code below game_hash
require "pry"
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def home_team
  game_hash[:home]
  
end

def home_players
  home_team[:players]
end

def get_all_players
  home_players + game_hash[:away][:players]
end

def find_player(name)
 get_all_players.find { |player_hash| player_hash[:player_name] == name }
end 

def find_team(team_name)
  game_hash.values.find do |team|
    team[:team_name] == team_name
    #binding.pry
  end
end

def num_points_scored(name)
 #player = get_all_players.find { |player_hash| player_hash[:player_name] == name }
 #above is the syntax for searching for a player in the hash with a given name
 
 find_player(name)[:points]
 
# binding.pry
end
#binding.pry

def shoe_size(name)
 player = get_all_players.find { |player_hash| player_hash[:player_name] == name }
 #above is the syntax for searching for a player in the hash with a given name
 player[:shoe]
# binding.pry
end
def team_names
  #iterate over game hash
  #we wanto pull ut team_name from eah team hash
  values_arr = game_hash.values #the values additon will give us the hash
  names_arr = values_arr.map do |team_hash|
    team_hash[:team_name]
end
  binding.pry
end

def team_colors(team_name)
  #find team hash
team_hash = find_team(team_name)
#grabs colors from the team
team_hash[:colors]
end


def player_numbers(team_name)
  find_team(team_name)[:players].map {|each_player| player_hash[:number] }
  
  
  binding.pry
end


def player_stats(name)
  

end



