# The Long Night - Deck A Entity Spec Sheets

## Art Constraints (Global)
- Style: top-down dark sci-fi pixel art.
- Internal resolution target: 320x180.
- Character size: 32x32 (48x48 for large threats).
- Palette per entity: 8-16 colors max.
- No anti-aliasing, transparent background.

## 1) Nick Wallace (Player)
- Entity ID: `chr_wallace`
- Role: player character.
- Sprite Size: 32x32.
- Silhouette: slim armored frame, asymmetric shoulder plating, torn short cloak edge.
- Primary Colors: charcoal, deep blue-gray.
- Accent Colors: blood red eye glow, muted steel trim.
- Forbidden Colors: bright neon green, saturated yellow.
- Animation Set: idle(4), walk(6), attack(6), dodge(4), hit(3), death(6).
- Gameplay Readability: clear front-facing head and shoulder shape in darkness.
- Prompt Seed:
```txt
Top-down pixel art sprite, Nick Wallace, Noctis survivor, 32x32, dark sci-fi,
charcoal and deep blue palette, blood-red eye accent, strong silhouette,
clean cluster shading, no anti-aliasing, transparent background.
```

## 2) Ari (Command NPC)
- Entity ID: `chr_ari`
- Role: command/tactical NPC.
- Sprite Size: 32x32.
- Silhouette: upright stance, cleaner armor lines than Wallace, minimal cape elements.
- Primary Colors: dark slate, desaturated steel.
- Accent Colors: teal comm-light accents.
- Forbidden Colors: warm orange primaries.
- Animation Set: idle(4), walk(6), point/command(4), hit(3).
- Gameplay Readability: must look calm and deliberate in idle pose.
- Prompt Seed:
```txt
Top-down pixel art sprite, Ari, tactical Noctis leader, 32x32,
dark slate armor with teal accents, readable command posture,
clean pixel clusters, transparent background.
```

## 3) Security Drone (Enemy T1)
- Entity ID: `ent_sec_drone_t1`
- Role: patrol/chase enemy.
- Sprite Size: 32x32.
- Silhouette: compact triangular core with side thrusters.
- Primary Colors: gunmetal, black.
- Accent Colors: red sensor lens, low white edge light.
- Forbidden Colors: bright blue glow blocks.
- Animation Set: idle_hover(4), patrol_move(6), alert(4), attack_pulse(4), destroy(6).
- Gameplay Readability: forward-facing sensor must show LOS direction.
- Prompt Seed:
```txt
Top-down pixel art enemy drone, compact triangular body, 32x32,
gunmetal palette, red sensor eye, stealth-horror sci-fi style,
clear facing direction, transparent background.
```

## 4) Maintenance Brute Drone (Enemy T1.5)
- Entity ID: `ent_maint_brute`
- Role: forced combat room enemy.
- Sprite Size: 48x48.
- Silhouette: heavy square chassis, one oversized manipulator arm.
- Primary Colors: dark iron, dirty steel.
- Accent Colors: red warning strips.
- Forbidden Colors: bright white body fills.
- Animation Set: idle(4), stomp_move(6), slam_attack(6), stagger(3), destroy(6).
- Gameplay Readability: slow but threatening weight communicated in key poses.

## 5) Embryo Support Pod (Interactive)
- Entity ID: `int_embryo_pod_a`
- Role: narrative choice interactable.
- Sprite Size: 32x48.
- Silhouette: vertical pod glass with cable bundle base.
- Primary Colors: cold gray, pale cyan fluid.
- Accent Colors: red warning pulse light.
- States: stable, failing, stabilized, abandoned.
- Gameplay Readability: failing state must be obvious without text.

## 6) Reactor Terminal (Puzzle)
- Entity ID: `int_reactor_terminal`
- Role: puzzle objective.
- Sprite Size: 32x32.
- Silhouette: angled console with cable spine.
- Primary Colors: dark steel, black.
- Accent Colors: infrared magenta/red UI.
- States: off, active, locked, complete.

## 7) Blast Door Deck B (Level Exit)
- Entity ID: `int_blast_door_b`
- Role: level endpoint.
- Sprite Size: 64x64 tile composite.
- Silhouette: segmented industrial hatch with central seam.
- Primary Colors: heavy steel and carbon black.
- Accent Colors: warning red strip lights.
- States: sealed, unlocking, open.

## Batch Prompt Pack Request Format (Use in Chat)
```txt
Generate prompt pack for [ENTITY ID] with:
- views: front/back/left/right
- animations: [LIST]
- frame counts: [LIST]
- palette lock: [LIST]
- export naming: chr_or_ent_<name>_<anim>_<dir>_v01.png
```

## Acceptance Checklist
- Silhouette readable at 100% zoom and 200% zoom.
- Palette limit respected.
- Direction consistency preserved.
- Animation timing supports gameplay readability.
- Naming follows project standard exactly.
