extends Node

# Cyberpunk Drone Tower Defense - Main Game Controller

@export var starting_credits: int = 500
@export var starting_lives: int = 20
@export var wave_delay: float = 3.0

var credits: int
var lives: int
var current_wave: int = 0
var game_over: bool = false
var paused: bool = false

var towers: Array[Tower] = []
var enemies: Array[Enemy] = []
var projectiles: Array[Projectile] = []
var ui_manager: UIManager
var wave_manager: WaveManager
var tower_manager: TowerManager
var enemy_manager: EnemyManager

func _ready():
	setup_managers()
	start_game()

func setup_managers():
	credits = starting_credits
	lives = starting_lives
	
	ui_manager = UIManager.new()
	wave_manager = WaveManager.new(self)
	tower_manager = TowerManager.new(self)
	enemy_manager = EnemyManager.new(self)

func start_game():
	print("[GAME] Starting Cyberpunk Drone Tower Defense")
	print("[GAME] Credits: %d | Lives: %d" % [credits, lives])
	wave_manager.start_wave()

func _process(delta):
	if game_over or paused:
		return
	
	# Update all entities
	for tower in towers:
		tower.update(delta)
	
	for enemy in enemies:
		enemy.update(delta)
	
	for projectile in projectiles:
		projectile.update(delta)
	
	# Check collisions and hit detection
	check_projectile_collisions()
	check_enemy_goal()

func add_tower(tower: Tower):
	towers.append(tower)

func add_enemy(enemy: Enemy):
	enemies.append(enemy)

func add_projectile(projectile: Projectile):
	projectiles.append(projectile)

func remove_enemy(enemy: Enemy):
	if enemy in enemies:
		enemies.erase(enemy)
		if enemy.is_boss:
			credits += enemy.boss_reward
		else:
			credits += enemy.kill_reward
		ui_manager.update_credits(credits)

func remove_projectile(projectile: Projectile):
	if projectile in projectiles:
		projectiles.erase(projectile)

func check_projectile_collisions():
	for projectile in projectiles:
		for enemy in enemies:
			if projectile.can_hit(enemy):
				projectile.hit(enemy)
				enemy.take_damage(projectile.damage)
				if enemy.health <= 0:
					remove_enemy(enemy)
				break

func check_enemy_goal():
	for enemy in enemies:
		if enemy.reached_goal:
			print("[GAME] Enemy reached goal!")
			lives -= 1
			remove_enemy(enemy)
			ui_manager.update_lives(lives)
			if lives <= 0:
				end_game(false)

func add_credits(amount: int):
	credits += amount
	ui_manager.update_credits(credits)

func spend_credits(amount: int) -> bool:
	if credits >= amount:
		credits -= amount
		ui_manager.update_credits(credits)
		return true
	return false

func wave_complete():
	current_wave += 1
	print("[GAME] Wave %d Complete!" % current_wave)
	if current_wave >= 10:
		end_game(true)
	else:
		await get_tree().create_timer(wave_delay).timeout
		wave_manager.start_wave()

func end_game(victory: bool):
	game_over = true
	if victory:
		print("[GAME] VICTORY! All waves defeated!")
	else:
		print("[GAME] DEFEAT! Lives reached zero.")
	ui_manager.show_game_over(victory)

func toggle_pause():
	paused = !paused
	get_tree().paused = paused
