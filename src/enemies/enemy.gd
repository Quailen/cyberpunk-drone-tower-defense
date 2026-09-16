class_name Enemy

var enemy_type: String
var stats: Dictionary
var position: Vector2 = Vector2.ZERO
var health: float
var max_health: float
var speed: float
var armor: float
var current_waypoint: int = 0
var reached_goal: bool = false
var is_boss: bool = false
var kill_reward: int = 0
var boss_reward: int = 0
var active_effects: Dictionary = {}
var velocity: Vector2 = Vector2.ZERO

func _init(type: String, enemy_stats: Dictionary, boss: bool = false):
	enemy_type = type
	stats = enemy_stats
	is_boss = boss
	
	health = enemy_stats.get("health", 50)
	max_health = health
	speed = enemy_stats.get("speed", 100)
	armor = enemy_stats.get("armor", 0)
	
	if boss:
		boss_reward = enemy_stats.get("reward", 100)
	else:
		kill_reward = enemy_stats.get("reward", 10)

func update(delta: float):
	if reached_goal:
		return
	
	# Apply active effects
	update_effects(delta)
	
	# Move along path
	move_along_path(delta)

func move_along_path(delta: float):
	var current_speed = speed
	
	# Check for slow effects
	if active_effects.has("slow"):
		current_speed *= active_effects["slow"].factor
	
	# Move towards next waypoint
	velocity = Vector2.ZERO.normalized() * current_speed * delta
	position += velocity

func update_effects(delta: float):
	var effects_to_remove = []
	
	for effect_name in active_effects:
		var effect = active_effects[effect_name]
		effect.duration -= delta
		if effect.duration <= 0:
			effects_to_remove.append(effect_name)
	
	for effect_name in effects_to_remove:
		active_effects.erase(effect_name)

func take_damage(amount: float):
	var damage_reduction = 1.0 - (armor / 100.0)
	var actual_damage = amount * damage_reduction
	health -= actual_damage
	
	if health <= 0:
		health = 0

func apply_slow(duration: float, factor: float):
	if active_effects.has("slow"):
		active_effects["slow"].duration = max(active_effects["slow"].duration, duration)
	else:
		active_effects["slow"] = {"duration": duration, "factor": factor}

func apply_disable(duration: float):
	active_effects["disabled"] = {"duration": duration}

func is_disabled() -> bool:
	return active_effects.has("disabled")

func get_health_percentage() -> float:
	return health / max_health

func boss_ability(ability_name: String):
	match ability_name:
		"stomp":
			perform_stomp()
		"shockwave":
			perform_shockwave()
		"phase_wave":
			perform_phase_wave()
		"clone":
			create_clone()
		"plasma_burst":
			perform_plasma_burst()
		"emp_pulse":
			perform_emp_pulse()
		"regenerate":
			perform_regenerate()
		"void_tear":
			perform_void_tear()
		"darkness_cloak":
			perform_darkness_cloak()

func perform_stomp():
	print("[BOSS] %s performs STOMP attack!" % enemy_type)

func perform_shockwave():
	print("[BOSS] %s creates SHOCKWAVE!" % enemy_type)

func perform_phase_wave():
	print("[BOSS] %s uses PHASE WAVE!" % enemy_type)

func create_clone():
	print("[BOSS] %s creates a CLONE!" % enemy_type)

func perform_plasma_burst():
	print("[BOSS] %s unleashes PLASMA BURST!" % enemy_type)

func perform_emp_pulse():
	print("[BOSS] %s activates EMP PULSE!" % enemy_type)

func perform_regenerate():
	health = min(health + max_health * 0.2, max_health)
	print("[BOSS] %s REGENERATES health!" % enemy_type)

func perform_void_tear():
	print("[BOSS] %s creates a VOID TEAR!" % enemy_type)

func perform_darkness_cloak():
	active_effects["invisible"] = {"duration": 3.0}
	print("[BOSS] %s uses DARKNESS CLOAK!" % enemy_type)
