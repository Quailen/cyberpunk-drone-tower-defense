class_name EnemyManager

var game: Node
var enemy_types: Dictionary = {}
var boss_types: Dictionary = {}

func _init(game_ref: Node):
	game = game_ref
	initialize_enemy_types()
	initialize_boss_types()

func initialize_enemy_types():
	# Initialize all 12 enemy robot types
	enemy_types = {
		"scout_bot": {
			"name": "Scout Bot",
			"health": 20,
			"speed": 150,
			"armor": 0,
			"reward": 10,
			"description": "Fast but fragile reconnaissance unit"
		},
		"assault_drone": {
			"name": "Assault Drone",
			"health": 45,
			"speed": 100,
			"armor": 5,
			"reward": 25,
			"description": "Balanced unit with moderate stats"
		},
		"heavy_tank": {
			"name": "Heavy Tank",
			"health": 150,
			"speed": 50,
			"armor": 20,
			"reward": 50,
			"description": "Slow tank unit with high durability"
		},
		"swarm_bot": {
			"name": "Swarm Bot",
			"health": 15,
			"speed": 120,
			"armor": 0,
			"reward": 8,
			"spawn_count": 5,
			"description": "Spawns in groups of 5"
		},
		"shielded_unit": {
			"name": "Shielded Unit",
			"health": 60,
			"speed": 80,
			"armor": 10,
			"shield": 40,
			"reward": 30,
			"description": "Has protective shield that regenerates"
		},
		"plasma_striker": {
			"name": "Plasma Striker",
			"health": 50,
			"speed": 110,
			"armor": 8,
			"reward": 35,
			"description": "Fast and deals damage to towers"
		},
		"stealth_unit": {
			"name": "Stealth Unit",
			"health": 30,
			"speed": 130,
			"armor": 2,
			"reward": 20,
			"invisible": true,
			"description": "Partially invisible, hard to target"
		},
		"armored_knight": {
			"name": "Armored Knight",
			"health": 120,
			"speed": 60,
			"armor": 25,
			"reward": 40,
			"description": "High armor, resistant to damage"
		},
		"tech_hunter": {
			"name": "Tech Hunter",
			"health": 40,
			"speed": 100,
			"armor": 5,
			"reward": 28,
			"targets_towers": true,
			"description": "Actively targets and destroys towers"
		},
		"cyber_spider": {
			"name": "Cyber Spider",
			"health": 35,
			"speed": 140,
			"armor": 3,
			"reward": 22,
			"description": "Very fast movement, low health"
		},
		"sentinel_guard": {
			"name": "Sentinel Guard",
			"health": 90,
			"speed": 70,
			"armor": 15,
			"reward": 38,
			"description": "Moderately armored guard unit"
		},
		"phase_bot": {
			"name": "Phase Bot",
			"health": 25,
			"speed": 160,
			"armor": 1,
			"reward": 15,
			"phase_shift": true,
			"description": "Phases through obstacles, immune to slow"
		}
	}

func initialize_boss_types():
	# Initialize boss units
	boss_types = {
		"iron_colossus": {
			"name": "Iron Colossus",
			"health": 500,
			"speed": 40,
			"armor": 40,
			"reward": 500,
			"abilities": ["stomp", "shockwave"],
			"description": "Massive heavily armored boss with area attacks"
		},
		"quantum_overlord": {
			"name": "Quantum Overlord",
			"health": 400,
			"speed": 80,
			"armor": 20,
			"reward": 450,
			"abilities": ["phase_wave", "clone"],
			"description": "Teleports around and creates clones"
		},
		"cyber_warlord": {
			"name": "Cyber Warlord",
			"health": 600,
			"speed": 60,
			"armor": 35,
			"reward": 600,
			"abilities": ["plasma_burst", "emp_pulse", "regenerate"],
			"description": "Powerful boss that regenerates health"
		},
		"void_entity": {
			"name": "Void Entity",
			"health": 350,
			"speed": 100,
			"armor": 15,
			"reward": 400,
			"abilities": ["void_tear", "darkness_cloak"],
			"description": "Elusive boss that gains invulnerability periods"
		}
	}

func create_enemy(enemy_type: String) -> Enemy:
	if not enemy_types.has(enemy_type):
		push_error("Enemy type '%s' not found" % enemy_type)
		return null
	
	var stats = enemy_types[enemy_type]
	var enemy = Enemy.new(enemy_type, stats, false)
	return enemy

func create_boss(boss_type: String) -> Enemy:
	if not boss_types.has(boss_type):
		push_error("Boss type '%s' not found" % boss_type)
		return null
	
	var stats = boss_types[boss_type]
	var boss = Enemy.new(boss_type, stats, true)
	return boss

func get_enemy_stats(enemy_type: String) -> Dictionary:
	return enemy_types.get(enemy_type, {})

func get_boss_stats(boss_type: String) -> Dictionary:
	return boss_types.get(boss_type, {})

func get_all_enemy_types() -> Array:
	return enemy_types.keys()

func get_all_boss_types() -> Array:
	return boss_types.keys()
