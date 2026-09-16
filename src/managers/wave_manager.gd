class_name WaveManager

var game: Node
var current_wave: int = 0
var enemies_remaining: int = 0
var spawned_enemies: int = 0

func _init(game_ref: Node):
	game = game_ref

func start_wave():
	current_wave += 1
	print("[WAVE] Starting Wave %d" % current_wave)
	
	var wave_config = get_wave_config(current_wave)
	if wave_config.is_empty():
		push_error("Wave %d configuration not found" % current_wave)
		return
	
	enemies_remaining = wave_config["total_enemies"]
	spawned_enemies = 0
	
	# Spawn enemies in groups
	for enemy_group in wave_config["enemies"]:
		var delay = enemy_group.get("delay", 0.5)
		var count = enemy_group.get("count", 1)
		var enemy_type = enemy_group.get("type", "assault_drone")
		
		for i in range(count):
			await game.get_tree().create_timer(delay + i * 0.2).timeout
			var enemy = game.enemy_manager.create_enemy(enemy_type)
			if enemy:
				game.add_enemy(enemy)
				spawned_enemies += 1

func get_wave_config(wave: int) -> Dictionary:
	var configs = {
		1: {
			"total_enemies": 10,
			"enemies": [
				{"type": "scout_bot", "count": 10, "delay": 0.5}
			]
		},
		2: {
			"total_enemies": 15,
			"enemies": [
				{"type": "scout_bot", "count": 8, "delay": 0.4},
				{"type": "assault_drone", "count": 7, "delay": 1.0}
			]
		},
		3: {
			"total_enemies": 20,
			"enemies": [
				{"type": "scout_bot", "count": 5, "delay": 0.3},
				{"type": "assault_drone", "count": 10, "delay": 0.8},
				{"type": "shielded_unit", "count": 5, "delay": 2.0}
			]
		},
		4: {
			"total_enemies": 25,
			"enemies": [
				{"type": "swarm_bot", "count": 5, "delay": 1.0},
				{"type": "heavy_tank", "count": 3, "delay": 2.0},
				{"type": "plasma_striker", "count": 8, "delay": 1.5}
			]
		},
		5: {
			"total_enemies": 30,
			"enemies": [
				{"type": "stealth_unit", "count": 6, "delay": 0.8},
				{"type": "armored_knight", "count": 4, "delay": 1.5},
				{"type": "cyber_spider", "count": 10, "delay": 0.5},
				{"type": "tech_hunter", "count": 5, "delay": 2.0}
			]
		},
		6: {
			"total_enemies": 35,
			"enemies": [
				{"type": "sentinel_guard", "count": 8, "delay": 0.8},
				{"type": "phase_bot", "count": 12, "delay": 0.4},
				{"type": "heavy_tank", "count": 5, "delay": 1.5},
				{"type": "plasma_striker", "count": 10, "delay": 0.6}
			]
		},
		7: {
			"total_enemies": 40,
			"enemies": [
				{"type": "assault_drone", "count": 15, "delay": 0.3},
				{"type": "tech_hunter", "count": 10, "delay": 0.8},
				{"type": "armored_knight", "count": 8, "delay": 1.2},
				{"type": "shielded_unit", "count": 7, "delay": 1.0}
			]
		},
		8: {
			"total_enemies": 35,
			"enemies": [
				{"type": "cyber_spider", "count": 20, "delay": 0.3},
				{"type": "phase_bot", "count": 15, "delay": 0.4}
			]
		},
		9: {
			"total_enemies": 50,
			"enemies": [
				{"type": "heavy_tank", "count": 10, "delay": 1.0},
				{"type": "sentinel_guard", "count": 15, "delay": 0.6},
				{"type": "plasma_striker", "count": 15, "delay": 0.5},
				{"type": "tech_hunter", "count": 10, "delay": 0.8}
			]
		},
		10: {
			"total_enemies": 4,
			"enemies": [
				{"type": "iron_colossus", "count": 1, "delay": 0.0, "is_boss": true},
				{"type": "quantum_overlord", "count": 1, "delay": 3.0, "is_boss": true},
				{"type": "cyber_warlord", "count": 1, "delay": 6.0, "is_boss": true},
				{"type": "void_entity", "count": 1, "delay": 9.0, "is_boss": true}
			]
		}
	}
	
	return configs.get(wave, {})
