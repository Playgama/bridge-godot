signal banner_state_changed
signal interstitial_state_changed
signal rewarded_state_changed

var minimum_delay_between_interstitial setget , _minimum_delay_between_interstitial_getter
var is_banner_supported setget , _is_banner_supported_getter
var banner_state setget , _banner_state_getter
var is_interstitial_supported setget , _is_interstitial_supported_getter
var interstitial_state setget , _interstitial_state_getter
var is_rewarded_supported setget , _is_rewarded_supported_getter
var rewarded_state setget , _rewarded_state_getter
var rewarded_placement setget , _rewarded_placement_getter


func _minimum_delay_between_interstitial_getter():
	return _minimum_delay_between_interstitial

func _is_banner_supported_getter():
	return true
	
func _banner_state_getter():
	return _banner_state

func _is_interstitial_supported_getter():
	return true

func _interstitial_state_getter():
	return _interstitial_state

func _is_rewarded_supported_getter():
	return true

func _rewarded_state_getter():
	return _rewarded_state

func _rewarded_placement_getter():
	return _rewarded_placement

var _minimum_delay_between_interstitial = 60
var _banner_state
var _interstitial_state
var _rewarded_state
var _rewarded_placement

func _init():
	_banner_state = Bridge.BannerState.HIDDEN
	_interstitial_state = Bridge.InterstitialState.CLOSED
	_rewarded_state = Bridge.RewardedState.CLOSED

func set_minimum_delay_between_interstitial(value):
	_minimum_delay_between_interstitial = value

func show_banner(position = Bridge.BannerPosition.BOTTOM, placement = null):
	_set_banner_state(Bridge.BannerState.LOADING)
	_set_banner_state(Bridge.BannerState.SHOWN)

func hide_banner():
	_set_banner_state(Bridge.BannerState.HIDDEN)

func show_interstitial(placement = null):
	_set_interstitial_state(Bridge.InterstitialState.LOADING)
	_set_interstitial_state(Bridge.InterstitialState.OPENED)
	_set_interstitial_state(Bridge.InterstitialState.CLOSED)

func show_rewarded(placement = null):
	_rewarded_placement = placement
	_set_rewarded_state(Bridge.RewardedState.LOADING)
	_set_rewarded_state(Bridge.RewardedState.OPENED)
	_set_rewarded_state(Bridge.RewardedState.REWARDED)
	_set_rewarded_state(Bridge.RewardedState.CLOSED)

func check_adblock(callback):
	if callback != null:
		callback.call_func(false)


func _set_banner_state(state):
	_banner_state = state
	emit_signal("banner_state_changed", _banner_state)

func _set_interstitial_state(state):
	_interstitial_state = state
	emit_signal("interstitial_state_changed", _interstitial_state)

func _set_rewarded_state(state):
	_rewarded_state = state
	emit_signal("rewarded_state_changed", _rewarded_state)
