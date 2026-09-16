# Cyberpunk Drone Tower Defense

A futuristic cyberpunk-themed tower defense game built with Godot 4.7, featuring advanced graphics, strategic gameplay, and dynamic AI-controlled enemies.

## Game Overview

### Objective
Defend your sector from waves of advancing enemy robots and boss units. Build and upgrade towers to eliminate threats before they reach your command center.

## Game Features

### 12 Tower Types

1. **Plasma Cannon** - $200 - Balanced weapon with solid damage
2. **Laser Tower** - $250 - High fire rate, excellent for light enemies
3. **Missile Launcher** - $350 - High damage with splash area effect
4. **Pulse Emitter** - $180 - Rapid-fire multi-projectile weapon
5. **Cryo Tower** - $280 - Slows enemies with freezing attacks
6. **EMP Tower** - $320 - Temporarily disables enemy shields
7. **Tesla Tower** - $300 - Chain lightning hits multiple targets
8. **Ion Cannon** - $400 - Ultra-long range, ultra-high damage
9. **Drone Swarm Tower** - $220 - Summons combat drones
10. **Railgun** - $380 - Pierces through multiple enemies
11. **Plasma Thrower** - $240 - Close-range area denial
12. **Sentinel Turret** - $310 - Intelligent targeting system

### 12 Enemy Robot Types

1. **Scout Bot** - Fast but fragile (20 HP)
2. **Assault Drone** - Balanced unit (45 HP)
3. **Heavy Tank** - Slow tank unit (150 HP)
4. **Swarm Bot** - Spawns in groups of 5 (15 HP each)
5. **Shielded Unit** - Has regenerating shield (60 HP + 40 Shield)
6. **Plasma Striker** - Fast and deals tower damage (50 HP)
7. **Stealth Unit** - Partially invisible (30 HP)
8. **Armored Knight** - High armor resistance (120 HP)
9. **Tech Hunter** - Targets and destroys towers (40 HP)
10. **Cyber Spider** - Very fast, low health (35 HP)
11. **Sentinel Guard** - Moderately armored (90 HP)
12. **Phase Bot** - Phases through obstacles, immune to slow (25 HP)

### 4 Boss Units

1. **Iron Colossus** - 500 HP, heavily armored
   - Abilities: Stomp, Shockwave
   - Reward: 500 credits

2. **Quantum Overlord** - 400 HP, high mobility
   - Abilities: Phase Wave, Clone
   - Reward: 450 credits

3. **Cyber Warlord** - 600 HP, self-regenerating
   - Abilities: Plasma Burst, EMP Pulse, Regenerate
   - Reward: 600 credits

4. **Void Entity** - 350 HP, evasive
   - Abilities: Void Tear, Darkness Cloak
   - Reward: 400 credits

## Game Mechanics

### Core Systems

- **Wave System**: 10 waves of increasing difficulty
- **Tower Placement**: Place and upgrade towers to defend
- **Enemy Progression**: Enemies have unique properties and special abilities
- **Boss Encounters**: Final wave features all 4 bosses
- **Credit System**: Earn credits by defeating enemies, spend on towers
- **Health System**: Lose lives if enemies reach the end

### Tower Stats

Each tower has:
- **Cost**: Initial purchase price
- **Damage**: Damage per hit
- **Fire Rate**: Shots per second
- **Range**: Detection radius
- **Special Properties**: Unique mechanics (splash, chain, pierce, etc.)

### Enemy Properties

Each enemy has:
- **Health**: Hit points
- **Speed**: Movement velocity
- **Armor**: Damage reduction
- **Special Traits**: Invisibility, shields, regeneration, etc.

## Project Structure

```
src/
├── main.gd                 # Main game controller
├── managers/
│   ├── tower_manager.gd   # Tower definitions and factory
│   ├── enemy_manager.gd   # Enemy definitions and factory
│   └── wave_manager.gd    # Wave progression and spawning
├── towers/
│   └── tower.gd           # Base tower class
├── enemies/
│   └── enemy.gd           # Base enemy class with boss abilities
├── projectiles/
│   └── projectile.gd      # Projectile behavior and collision
└── ui/
    └── ui_manager.gd      # UI and display management
```

## Getting Started

### Requirements
- Godot 4.7 or later
- Modern graphics card (for advanced visual effects)

### Installation

1. Clone the repository
2. Open the project in Godot 4.7
3. Run the game with F5 or the Play button

### Controls

- **Left Click**: Select tower/place tower
- **Right Click**: Cancel selection
- **Space**: Pause/Resume
- **Esc**: Menu

## Future Enhancements

- Advanced particle effects and graphics
- Tower upgrade trees and special abilities
- Procedural map generation
- Multiplayer support
- Custom game modes
- Achievements and leaderboards

## License

MIT License - See LICENSE file for details
