# The Long Night - Chat-Driven Pixel Art Pipeline

## Goal
Create consistent pixel-art characters and entities using this chat as the art direction and QA layer.

## Production Method
1. Define entity spec in chat (role, silhouette, palette, size, animation list).
2. Generate prompt pack from spec (front/side/back + animation prompts).
3. Produce sprite outputs in your preferred tool.
4. Review in chat for cleanup notes and consistency pass.
5. Slice/import into engine with locked naming and metadata.

## Spec Template (Use in Chat)
Copy this block and fill values:

```txt
Entity Name:
Role:
Sprite Size: (32x32 / 48x48 / 64x64)
Style Tags: (grim sci-fi, top-down pixel, strong silhouette)
Primary Colors:
Accent Colors:
Forbidden Colors:
Animation Set: idle, walk, attack, hit, death
Silhouette Notes:
Weapon/Tool Notes:
Lore Notes:
```

## Output Standards
- Format: PNG with transparency.
- Character sheet: horizontal strips per animation.
- Frame counts:
  - idle: 4
  - walk: 6
  - attack: 6
  - hit: 3
  - death: 6
- Directions: front, back, left, right.
- Naming:
  - `chr_<name>_<anim>_<dir>_v01.png`
  - `ent_<name>_<state>_v01.png`

## Prompt Pack Template

Use this base prompt:

```txt
Top-down pixel art sprite for a dark sci-fi game, [ENTITY], [ROLE], size [SIZE],
limited palette [PALETTE], strong readable silhouette, clean cluster shading,
high contrast edges, no anti-aliasing, transparent background, game-ready sprite.
```

Animation prompt extension:

```txt
Create a [ANIMATION] sprite strip with [FRAMES] frames for [DIRECTION] view.
Keep proportions, palette, and silhouette identical to the base sprite.
```

## Starter Prompt Packs for The Long Night

### 1) Nick Wallace (Player)
- Role: Noctis protagonist.
- Size: 32x32.
- Palette: charcoal, deep blue, muted skin tone, blood red accent.
- Silhouette: slim armored torso, asymmetric shoulder plate, short cloak fragment.
- Notes: eyes subtly emissive in infrared red.

### 2) Ari (Command NPC)
- Role: tactical lead.
- Size: 32x32.
- Palette: dark slate, desaturated teal accents.
- Silhouette: composed stance, cleaner armor lines than Wallace.
- Notes: less predatory posture, more command clarity.

### 3) Security Drone (Enemy T1)
- Role: patrol/chase bot.
- Size: 32x32.
- Palette: gunmetal, warning red sensor light.
- Silhouette: compact triangular body, two side thrusters.
- Notes: readable cone-emitter area on front.

### 4) Noctis War Form (Enemy T2 later)
- Role: elite infiltration threat.
- Size: 48x48.
- Palette: black biomech shell, deep crimson seams.
- Silhouette: hunched predatory shape, tendril arcs.
- Notes: design for quick readability in dark rooms.

### 5) Hybrid Child Terminal Avatar (UI/Entity)
- Role: narrative interface entity.
- Size: 32x32.
- Palette: pale cyan and white with slight glitch noise.
- Silhouette: minimal, almost icon-like humanoid form.
- Notes: should feel calm and uncanny, not hostile.

## Chat QA Checklist (Per Asset)
- Is silhouette readable at 1x zoom?
- Are palette limits respected?
- Is contrast high enough in dark tile sets?
- Do all directions preserve shape consistency?
- Are animation key poses clear?
- Does style match existing sheets?

## Cleanup Rules
- Remove anti-aliasing blur and stray semi-transparent pixels.
- Enforce palette count with indexed conversion.
- Snap off-model limbs back to shared proportion sheet.
- Keep hitbox footprint consistent across walk/idle frames.

## Engine Import Settings

### Godot
- Texture filter: Nearest.
- Mipmaps: Off.
- Compression: Lossless.
- Use `AnimatedSprite2D` or `AnimationPlayer` per entity.

### Unity
- Texture Type: Sprite (2D and UI).
- Filter Mode: Point (no filter).
- Compression: None or high-quality lossless.
- Sprite Mode: Multiple with consistent pivots.

### GameMaker
- Disable interpolation.
- Use fixed origin points by entity class.
- Keep separate strips per animation for easy state mapping.

## Chat Commands You Can Use With Me
- "Create spec sheets for all Deck A entities."
- "Generate prompt pack for Wallace v02 with heavier armor silhouette."
- "Review this sprite sheet and give precise cleanup edits."
- "Convert this enemy set into naming and import checklist format."
