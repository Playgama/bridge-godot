extends DetailedSceneBase

@onready var is_share_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer/IsShareSupported
@onready var is_join_community_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer/IsJoinCommunitySupported
@onready var is_invite_friends_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer/IsInviteFriendsSupported
@onready var is_create_post_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer/IsCreatePostSupported
@onready var is_add_to_favorites_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer2/IsAddToFavoritesSupported2
@onready var is_add_to_home_screen_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer2/IsAddToHomeScreenSupported
@onready var is_rate_supported = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer2/IsRateSupported
@onready var is_external_links_allowed = $MarginContainer2/VBoxContainer/HBoxContainer2/VBoxContainer2/IsExternalLinksAllowed



func _ready():
	is_share_supported.text = "Is Share Supported: " + str(Bridge.social.is_share_supported)
	is_join_community_supported.text = "Is Join Community Supported: " + str(Bridge.social.is_join_community_supported)
	is_invite_friends_supported.text = "Is Invite Friends Supported: " + str(Bridge.social.is_invite_friends_supported)
	is_create_post_supported.text = "Is Create Post Supported: " + str(Bridge.social.is_create_post_supported)
	is_add_to_favorites_supported.text = "Is Add To Favorites Supported: " + str(Bridge.social.is_add_to_favorites_supported)
	is_add_to_home_screen_supported.text = "Is Add To Home Screen Supported: " + str(Bridge.social.is_add_to_home_screen_supported)
	is_rate_supported.text = "Is Rate Supported: " + str(Bridge.social.is_rate_supported)
	is_external_links_allowed.text = "Is External Links Allowed: " + str(Bridge.social.is_external_links_allowed)


func _on_share_button_pressed():
	var options
	
	match Bridge.platform.id:
		"vk":
			options = {
				"link": "https://vk.com/mewton.games"
			}
	
	Bridge.social.share(options)


func _on_create_post_button_pressed():
	var options
	
	match Bridge.platform.id:
		"vk":
			options = {
				"message": "Hello world!",
				"attachments": "photo-199747461_457239629"
			}
		"ok":
			options = {
				"media":[
					{
						"type": "text",
						"text": "Here you can see odnoklassniki API docs(click the link)"
					},
					{
						"type": "link",
						"url": "https://apiok.ru"
					},
					{
						"type": "poll",
						"question": "Do you like our API?",
						"answers": [
							{ "text": "Yes" },
							{ "text": "No" }
						],
						"options": "SingleChoice,AnonymousVoting"
					}
				]
			}
	
	Bridge.social.create_post(options)


func _on_join_community_button_pressed():
	var options
	
	match Bridge.platform.id:
		"vk":
			options = {
				"groupId": "199747461"
			}
		"ok":
			options = {
				"groupId": "62984239710374"
			}
	
	Bridge.social.join_community(options)


func _on_invite_friends_button_pressed():
	var options
	
	match Bridge.platform.id:
		"ok":
			options = {
				"text": "Hello World!"
			}
	
	Bridge.social.invite_friends(options)


func _on_add_to_favorites_button_pressed():
	Bridge.social.add_to_favorites()


func _on_add_to_home_screen_button_pressed():
	Bridge.social.add_to_home_screen()


func _on_rate_button_pressed():
	Bridge.social.rate()
