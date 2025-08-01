extends DetailedSceneBase


onready var leaderboards_type_label = $MarginContainer2/VBoxContainer/LeaderboardsType


func _ready():
	leaderboards_type_label.text = "Leaderboards Type: " + str(Bridge.leaderboards.type)


func _on_increment_player_score_button_pressed():
	var leaderboard_id = ""
	var player_score = 42
	Bridge.leaderboards.set_score(leaderboard_id, player_score, funcref(self, "_on_set_score_completed"))

func _on_set_score_completed(success):
	print(success)


func _on_get_entries_button_pressed():
	var leaderboard_id = ""
	Bridge.leaderboards.get_entries(leaderboard_id , funcref(self, "_on_get_entries_completed"))

func _on_get_entries_completed(success, entries):
	print(success)

	for entry in entries:
		print("ID: " + str(entry.id))
		print("Name: " + str(entry.name))
		print("Score: " + str(entry.score))
		print("Rank: " + str(entry.rank))
		print("Photo: " + str(entry.photo))
