extends DetailedSceneBase


@onready var is_leaderboard_supported_label = $MarginContainer2/VBoxContainer/IsLeaderboardSupported
@onready var player_score_label = $MarginContainer2/VBoxContainer/PlayerScore

var current_player_score = 0


func _ready():
	is_leaderboard_supported_label.text = "Is Leaderboard Supported: " + str(Bridge.leaderboard.is_supported)


func _on_increment_player_score_button_pressed():
	current_player_score += 1
	
	var options
	
	match Bridge.platform.id:
		"yandex":
			options = {
				"leaderboardName": "YOUR_LEADERBOARD_NAME_HERE",
				"score": current_player_score
			}
	
	Bridge.leaderboard.set_score(options, Callable(self, "_on_set_score_completed"))
	player_score_label.text = "Player Score: " + str(current_player_score)

func _on_set_score_completed(success):
	print(success)


func _on_get_player_score_button_pressed():
	var options
	
	match Bridge.platform.id:
		"yandex":
			options = {
				"leaderboardName": "YOUR_LEADERBOARD_NAME_HERE"
			}

	Bridge.leaderboard.get_score(options, Callable(self, "_on_get_score_completed"))

func _on_get_score_completed(success, score):
	current_player_score = score
	player_score_label.text = "Player Score: " + str(current_player_score)


func _on_get_entries_button_pressed():
	var options
	
	match Bridge.platform.id:
		"yandex":
			options = {
				"leaderboardName": "YOUR_LEADERBOARD_NAME_HERE",
				"includeUser": true,
				"quantityAround": 10,
				"quantityTop": 10
			}
	
	Bridge.leaderboard.get_entries(options , Callable(self, "_on_get_entries_completed"))

func _on_get_entries_completed(success, entries):
	print(success)
	
	match Bridge.platform.id:
		"yandex":
			for entry in entries:
				print("ID: " + str(entry.id))
				print("Name: " + str(entry.name))
				print("Score: " + str(entry.score))
				print("Rank: " + str(entry.rank))
				print("Photo: " + str(entry.photo))
