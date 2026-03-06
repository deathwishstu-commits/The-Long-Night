# The Long Night - Project Conventions

## Naming
- Scenes: `snake_case.tscn`
- Scripts: `snake_case.gd`
- Data files: `snake_case.json`
- Character IDs: `chr_<name>`
- Entity IDs: `ent_<type>_<name>`
- Interactables: `int_<name>`

## Folder Responsibilities
- `scenes/`: runtime scene graph files.
- `scripts/`: gameplay logic and systems.
- `art/`: tilesets, sprites, VFX spritesheets.
- `audio/`: ambience, sfx, music assets.
- `data/`: dialogue, config, save-compatible flags.
- `docs/`: design and production documents.

## Branch and Commit Pattern
- Branches: `feature/<area>-<short-name>`
- Commit style: imperative, short subject, scoped where useful.
- Example: `feat(deck-a): add reactor puzzle terminal states`

## Core Data Keys (Intro)
- `choice_embryo_pod_saved` (bool)
- `intro_completed` (bool)
- `current_objective` (string)
- `player_blood_reserve` (int)

## Art Rules
- Pixel filter only; no smoothing.
- Keep per-entity palette constrained.
- Test readability on dark tiles before accepting assets.
