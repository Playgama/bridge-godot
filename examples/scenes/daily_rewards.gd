extends DetailedSceneBase


onready var output_label = $MarginContainer2/VBoxContainer/Output


func _ready():
	_refresh()


func _refresh():
	Bridge.daily_rewards.get_rewards(funcref(self, "_on_get_rewards_completed"))


func _on_get_rewards_button_pressed():
	_refresh()


func _on_get_rewards_completed(success, rewards):
	if not success:
		output_label.text = "getRewards failed"
		return

	output_label.text = "Rewards: " + str(rewards)


func _on_get_current_day_button_pressed():
	Bridge.daily_rewards.get_current_day(funcref(self, "_on_get_current_day_completed"))


func _on_get_current_day_completed(success, day):
	output_label.text = "getCurrentDay → " + str(day)


func _on_get_current_reward_button_pressed():
	Bridge.daily_rewards.get_current_reward(funcref(self, "_on_get_current_reward_completed"))


func _on_get_current_reward_completed(success, reward):
	output_label.text = "getCurrentReward → " + str(reward)


func _on_claim_current_reward_button_pressed():
	Bridge.daily_rewards.claim_current_reward(funcref(self, "_on_claim_current_reward_completed"))


func _on_claim_current_reward_completed(claimed):
	output_label.text = "claimCurrentReward → " + str(claimed)
