# The Long Night - TODO Board

## Engine Decision
Recommended default: **Godot 4.x** for fast 2D iteration and lightweight pipelines.

## Status Legend
- `[ ]` not started
- `[~]` in progress
- `[x]` done

## Sprint 0 - Project Setup
- `[x]` Create project and repository conventions.
- `[x]` Add folder structure: `scenes`, `scripts`, `art`, `audio`, `ui`, `data`.
- `[x]` Configure pixel-perfect rendering and camera settings.
- `[x]` Add input map: move, interact, scan, attack, dodge, crouch.
- `[x]` Add save system skeleton for choice flags.

## Sprint 1 - Intro Graybox
- `[x]` Build 7-room Deck A blockout.
- `[ ]` Add collision and door transitions.
- `[x]` Add objective tracker UI.
- `[ ]` Add interactable terminals and one locked relay door.
- `[ ]` Add checkpoint system (scene restart from room start).

## Sprint 2 - Core Mechanics
- `[x]` Implement 8-direction player movement.
- `[x]` Implement stealth detection meter (LOS + noise).
- `[x]` Implement enemy patrol and chase states.
- `[ ]` Implement melee attack, dodge i-frames, and hit reactions.
- `[ ]` Implement health/blood reserve resource.

## Sprint 3 - Intro Content
- `[ ]` Add memory bleed event trigger and screen effect.
- `[ ]` Add reactor 3-terminal puzzle with fail alarm path.
- `[ ]` Add forced maintenance bay combat encounter.
- `[ ]` Add embryo pod binary choice and persistence flag.
- `[ ]` Add end-of-level Ari comm sequence and Deck B hook.

## Sprint 4 - Art and Audio Pass
- `[ ]` Import first-pass tile set and sprite sheets.
- `[ ]` Add lighting pass: darkness, cones, alarm flashes.
- `[ ]` Add VFX: scan pulse, glitch overlay, warning pulses.
- `[ ]` Add ambience loop and combat/interaction SFX.
- `[ ]` Add basic UI skin matching infrared theme.

## Sprint 5 - QA and Polish
- `[ ]` Playtest first 5 minutes with no explanation.
- `[ ]` Tune stealth readability and enemy timings.
- `[ ]` Tune puzzle clarity and failure penalties.
- `[ ]` Verify all choice flags save/load correctly.
- `[ ]` Lock vertical slice build.

## Engine Mapping Notes

### Godot
- Scenes: one scene per room + level controller scene.
- Scripts: GDScript state machines for player and AI.
- Data: `Resource` or JSON for enemy stats and dialogue lines.

### Unity
- Scenes: one additive scene per room or one scene with room prefabs.
- Scripts: C# with ScriptableObjects for data.
- Data: ScriptableObjects for enemies, dialogue events, puzzle configs.

### GameMaker
- Rooms: room-per-section or one room with camera zones.
- Logic: object-based finite state scripts.
- Data: structs/arrays for dialogue and state flags.
