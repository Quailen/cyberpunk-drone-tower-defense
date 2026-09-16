class_name Projectile

var position: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var speed: float = 400.0
var damage: float = 10.0
var target: Enemy = null
var hit_targets: Array[Enemy] = []
var piercing: bool = false
var splash_radius: float = 0.0
var lifetime: float = 10.0

func update(delta: float):
	lifetime -= delta
	if lifetime <= 0:
		return
	
	if target and not target.reached_goal:
		var direction = (target.position - position).normalized()
		velocity = direction * speed
	else:
		velocity *= 0.98  # Air resistance
	
	position += velocity * delta

func can_hit(enemy: Enemy) -> bool:
	if enemy in hit_targets and not piercing:
		return false
	
	var distance = position.distance_to(enemy.position)
	return distance < 20.0  # Hit radius

func hit(enemy: Enemy):
	hit_targets.append(enemy)
	
	if splash_radius > 0:
		perform_splash_damage(enemy.position)
	
	if not piercing:
		lifetime = 0

func perform_splash_damage(center: Vector2):
	print("[PROJECTILE] Splash damage at %s with radius %.1f" % [center, splash_radius])
