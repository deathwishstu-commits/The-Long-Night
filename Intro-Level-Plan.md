# The Long Night - Game Look and Intro Level Plan

## Recommended Game Look

Use a **top-down 2D pixel-art stealth action RPG** with light social deduction.

Blend targets:
- **Among Us influence**: compact ship rooms, task interaction points, emergency events, suspicion-focused NPC dialogue.
- **Zelda influence**: readable top-down combat, gated exploration, tool-based progression, environmental puzzles.
- **Pixel art style**: low-light sci-fi horror palette, strong silhouettes, minimal but expressive character animation.

Core visual direction:
- Camera: top-down with slight perspective tilt (not fully isometric).
- Resolution target: 320x180 internal, upscaled cleanly.
- Palette: cold blacks/blues + blood red accents + infrared UI overlays.
- Lighting: mostly dark rooms, directional cones, alarm flashes, and silhouette reveals.

## Core Game Loop (Early Game)

1. Explore ship sectors.
2. Complete survival-critical tasks.
3. Manage risk (noise, blood hunger, power outages).
4. Fight or evade threats in short encounters.
5. Return to hub and unlock deeper sectors.

## Intro Level Goal

Teach movement, scanning, basic combat, stealth, and first moral tension (protect vs predation) in 10-15 minutes.

Working level name: **Cold Wake - Deck A**

## Intro Level Structure

### Beat 1: Wake Cycle
- Start in dim stasis chamber as Nick Wallace.
- Learn movement and interaction.
- Trigger first memory bleed visual distortion.
- Objective: Restore local power relay.

### Beat 2: Dark Corridor
- Introduce stealth in low visibility.
- First hostile drone patrol.
- Player learns line-of-sight and silent takedown option.

### Beat 3: Reactor Access Puzzle
- Zelda-like room puzzle: reroute power through 3 terminals in correct sequence.
- Wrong sequence triggers alarm and extra patrols.

### Beat 4: First Combat Test
- Forced close-quarters fight in maintenance bay.
- Teach dodge, quick strike, and cooldown pacing.

### Beat 5: The Choice
- Find damaged survivor pod (human embryo support system).
- Option A: Spend blood reserve to stabilize the pod.
- Option B: Preserve self for combat advantage.
- Choice affects NPC trust and a future tutorial reward.

### Beat 6: Exit Hook
- Ari contacts Wallace via comm.
- Reveal of unknown signal source from old war wreckage.
- Level ends at sealed blast door to Deck B.

## Intro Level Mechanics Checklist

Must ship in level 1:
- 8-direction movement
- Interact prompt and task completion UI
- Stealth detection meter
- Basic enemy AI patrol/chase
- Light melee combat
- Simple puzzle state tracking
- One binary narrative choice with persistence

Can defer:
- Party companions
- Advanced war-form abilities
- Boarding pod gameplay
- Full hybrid children systems

## Map Layout (Rooms)

1. Stasis Wake Chamber (spawn/tutorial)
2. Medical Corridor (stealth tutorial)
3. Security Junction (first patrol route)
4. Reactor Control (puzzle room)
5. Maintenance Bay (combat test)
6. Embryo Support Annex (moral choice)
7. Blast Door Exit (level end checkpoint)

## Art and Audio Direction for Intro

Art:
- Thick silhouette sprites for Noctis and drones.
- Tile sets: steel panels, exposed cables, cryo glass, blood stains.
- VFX: scan pulse ring, memory-glitch overlays, red alarm bloom.

Audio:
- Low mechanical ambience, distant hull creaks.
- Heartbeat layer increases with danger meter.
- Combat uses short, heavy impacts over busy effects.

## Production Plan for Intro Level

### Milestone 1: Graybox (2-3 days)
- Build room blockout and collision.
- Add player movement + camera.
- Add interactables and temporary UI prompts.

### Milestone 2: Playable Mechanics (4-6 days)
- Implement stealth detection and enemy patrol/chase.
- Implement basic melee + damage + death/reset.
- Implement reactor puzzle logic and success/fail states.

### Milestone 3: Narrative and Choice (2-3 days)
- Add memory bleed event.
- Add Ari comm sequence.
- Add embryo pod choice with save flag.

### Milestone 4: Art Pass and Feel (4-5 days)
- Replace graybox with first-pass pixel tiles/sprites.
- Add lighting, alarm flashes, and key VFX.
- Add core ambience and interaction SFX.

### Milestone 5: Polish and Test (2-3 days)
- Fix readability issues in dark scenes.
- Tune enemy aggression and puzzle clarity.
- Validate 10-15 minute completion target.

## Immediate Next Build Tasks

1. Pick engine and lock technical constraints (Godot/Unity/GameMaker).
2. Build Deck A graybox with the 7-room layout.
3. Implement movement + interaction + one task loop.
4. Add one patrol enemy and stealth meter.
5. Playtest until first 5 minutes are clear without explanation.

## Pixel Art Creation Method (Using This Chat)

Recommended workflow: **spec sheet -> sprite prompt pack -> batch generation -> manual cleanup -> import guide**.

1. In chat, define each entity with a compact spec:
- role (enemy/NPC/player)
- silhouette keywords
- palette constraints (max 8-16 colors)
- sprite size (e.g., 32x32 or 48x48)
- animation list (idle/walk/attack/hit/death)

2. I generate a standardized prompt pack per entity (front/side/back + animation prompts).

3. You use the prompt pack with your preferred pixel-art generator/tool, export PNG sheets, and place files in a shared folder.

4. In chat, I review the outputs and provide:
- exact cleanup notes (readability, contrast, consistency)
- naming conventions
- sprite sheet slicing metadata
- import-ready settings for your game engine

This keeps creative direction in chat while ensuring production-ready, engine-friendly assets.
