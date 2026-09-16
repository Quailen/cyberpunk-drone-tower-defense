class_name TowerManager

var game: Node
var tower_types: Dictionary = {}

func _init(game_ref: Node):
	game = game_ref
	initialize_tower_types()

func initialize_tower_types():
	# Initialize all 12 tower types with their properties
	tower_types = {
		"plasma_cannon": {
			"name": "Plasma Cannon",
			"cost": 200,
			"damage": 45,
			"fire_rate": 1.5,
			"range": 250,
			"description": "Standard plasma-based weapon with good damage"
		},
		"laser_tower": {
			"name": "Laser Tower",
			"cost": 250,
			"damage": 35,
			"fire_rate": 2.5,
			"range": 300,
			"description": "High fire rate laser weapon, excellent against light enemies"
		},
		"missile_launcher": {
			"name": "Missile Launcher",
			"cost": 350,
			"damage": 80,
			"fire_rate": 1.0,
			"range": 350,
			"description": "Powerful explosive weapon with splash damage",
			"splash_radius": 100
		},
		"pulse_emitter": {
			"name": "Pulse Emitter",
			"cost": 180,
			"damage": 25,
			"fire_rate": 0.8,
			"range": 200,
			"description": "Rapid-fire pulse weapon, good against swarms",
			"projectile_count": 3
		},
		"cryo_tower": {
			"name": "Cryo Tower",
			"cost": 280,
			"damage": 30,
			"fire_rate": 1.2,
			"range": 220,
			"description": "Slows enemies with freezing attacks",
			"slow_duration": 3.0,
			"slow_factor": 0.5
		},
		"emp_tower": {
			"name": "EMP Tower",
			"cost": 320,
			"damage": 20,
			"fire_rate": 2.0,
			"range": 280,
			"description": "Disables enemy shields temporarily",
			"disable_duration": 2.0
		},
		"tesla_tower": {
			"name": "Tesla Tower",
			"cost": 300,
			"damage": 40,
			"fire_rate": 1.8,
			"range": 320,
			"description": "Chain lightning attacks multiple targets",
			"chain_count": 3
		},
		"ion_cannon": {
			"name": "Ion Cannon",
			"cost": 400,
			"damage": 100,
			"fire_rate": 0.5,
			"range": 400,
			"description": "Ultra-long range, ultra-high damage weapon"
		},
		"drone_swarm": {
			"name": "Drone Swarm Tower",
			"cost": 220,
			"damage": 15,
			"fire_rate": 3.0,
			"range": 200,
			"description": "Summons combat drones to attack enemies",
			"drone_count": 4
		},
		"railgun": {
			"name": "Railgun",
			"cost": 380,
			"damage": 120,
			"fire_rate": 0.6,
			"range": 450,
			"description": "Pierces through multiple enemies",
			"piercing": true
		},
		"plasma_thrower": {
			"name": "Plasma Thrower",
			"cost": 240,
			"damage": 50,
			"fire_rate": 1.3,
			"range": 180,
			"description": "Close-range area denial weapon",
			"area_radius": 120
		},
		"sentinel_turret": {
			"name": "Sentinel Turret",
			"cost": 310,
			"damage": 55,
			"fire_rate": 1.6,
			"range": 290,
			"description": "Intelligent targeting system, prioritizes bosses"
		}
	}

func create_tower(tower_type: String) -> Tower:
	if not tower_types.has(tower_type):
		push_error("Tower type '%s' not found" % tower_type)
		return null
	
	var stats = tower_types[tower_type]
	var tower = Tower.new(tower_type, stats)
	return tower

func get_tower_stats(tower_type: String) -> Dictionary:
	return tower_types.get(tower_type, {})

func get_all_tower_types() -> Array:
	return tower_types.keys()
