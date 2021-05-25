# Write your code below game_hash
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

require 'pry'
def get_all_player_data(game)
  playerData=[]
  game.each{
    |location, teamData|
    playerData=playerData+teamData[:players]
  }
  playerData
end
  
def num_points_scored(player_name)
  playerData=get_all_player_data(game_hash)
  profile=playerData.find{|profile| profile[:player_name]==player_name}
  return profile[:points]
end

def shoe_size(player_name)
  playerData=get_all_player_data(game_hash)
  profile=playerData.find{|profile| profile[:player_name]==player_name}
  return profile[:shoe]
end

def team_colors(teamName)
  teamProfile=game_hash.find{|key,teamInfo|teamInfo[:team_name]==teamName}
  return teamProfile[1][:colors]
end

def team_names
  teamNames=[]
  game_hash.each{
    |location,teamData|
    teamNames << teamData[:team_name]
  }
  teamNames
end

def player_numbers(team_name)
    teamProfile=game_hash.find{|key,teamInfo|teamInfo[:team_name]==team_name}
    playerNums=teamProfile[1][:players].collect{
      |playerProfile|
      playerProfile[:number]
    }
    playerNums
end

def player_stats(player_name)
  playerData=get_all_player_data(game_hash)
  playerData.find{|profile| profile[:player_name]==player_name}
end

def big_shoe_rebounds
  playerData=get_all_player_data(game_hash)
  profile=playerData.max{|profile1, profile2| profile1[:shoe] <=> profile2[:shoe]}
  #binding.pry
  return profile[:rebounds]
end

def most_points_scored
  playerData=get_all_player_data(game_hash)
  profile=playerData.max{|profile1, profile2| profile1[:points] <=> profile2[:points]}
  #binding.pry
  return profile[:player_name]
end

def sum_points_of_teamData(teamData)
  players=teamData[:players]
  players.reduce(0){|sum,playerProfile| sum+playerProfile[:points]}
end

def winning_team
  winning=""
  score=0
  pointTrack=game_hash.map{
    |location, teamData|
    points=sum_points_of_teamData(teamData)
    [teamData[:team_name],points]
  }
  p pointTrack
  maxPair=pointTrack.max{|t1,t2| t1[1] <=> t2[1]}
  maxPair[0]
end

def player_with_the_longest_name
  playerData=get_all_player_data(game_hash)
  profile=playerData.max{|profile1, profile2| profile1[:player_name].length <=> profile2[:player_name].length}
  #binding.pry
  return profile[:player_name]
end

def most_steals
  playerData=get_all_player_data(game_hash)
  profile=playerData.max{|profile1, profile2| profile1[:steals] <=> profile2[:steals]}
  #binding.pry
  return profile[:player_name]
end

def long_name_steals_a_ton?
  return (player_with_the_longest_name==most_steals)
end