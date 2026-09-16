class_name Tower

var tower_type: String
var stats: Dictionary
var position: Vector2 = Vector2.ZERO
var target: Enemy = null
var fire_cooldown: float = 0.0
var health: float = 100.0
var level: int = 1

func _init(type: String, tower_stats: Dictionary):
	tower_type = type
	stats = tower_stats

func update(delta: float):
	if fire_cooldown > 0:
		fire_cooldown -= delta
	else:
		if target and is_valid_target(target):
			fire_at(target)
			fire_cooldown = 1.0 / stats.get("fire_rate", 1.0)
		else:
			find_target()

func find_target():
	# This will be overridden to find nearest enemy within range
	target = null

func fire_at(enemy: Enemy):
	var projectile = create_projectile()
	if projectile:
		projectile.target = enemy

func create_projectile() -> Projectile:
	var projectile = Projectile.new()
	projectile.position = position
	projectile.damage = stats.get("damage", 10)
	projectile.speed = 400.0
	return projectile

func is_valid_target(enemy: Enemy) -> bool:
	if not enemy:
		return false
	var distance = position.distance_to(enemy.position)
	return distance <= stats.get("range", 200)

func take_damage(amount: float):
	health -= amount * (1.0 - stats.get("armor", 0) * 0.01)

func upgrade():
	level += 1
	stats["damage"] *= 1.15
	stats["fire_rate"] *= 1.1

func sell() -> int:
	return int(stats.get("cost", 0) * 0.75)
