class_name UIManager

var credits_display: Label
var lives_display: Label
var wave_display: Label
var game_over_panel: Panel

func _init():
	# Initialize UI elements
	print("[UI] UI Manager initialized")

func update_credits(amount: int):
	print("[UI] Credits: %d" % amount)

func update_lives(amount: int):
	print("[UI] Lives: %d" % amount)

func update_wave(wave: int):
	print("[UI] Wave: %d" % wave)

func show_game_over(victory: bool):
	if victory:
		print("[UI] VICTORY SCREEN")
	else:
		print("[UI] DEFEAT SCREEN")

func show_tower_menu(towers: Array):
	print("[UI] Tower selection menu shown")

func show_tower_stats(tower: Tower):
	print("[UI] Showing stats for tower: %s" % tower.tower_type)
