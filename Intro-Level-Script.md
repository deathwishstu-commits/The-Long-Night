# The Long Night - Intro Level Script

## Level
Cold Wake - Deck A

## Duration
10-15 minutes

## Playable Character
Nick Wallace

## Scene 1: Wake

### Trigger
Level start.

### Visual
Stasis chamber flickers online. Infrared UI pulses through fogged cryo glass.

### Gameplay
- Teach movement.
- Teach interact prompt at stasis console.

### Dialogue
- Ship System: "Wake cycle incomplete. Manual stabilization required."
- Wallace: "How long was I out?"

### Objective Update
Restore local power relay.

## Scene 2: Memory Bleed

### Trigger
Player exits chamber corridor.

### Visual
Screen glitch: old battlefield silhouettes overlay present corridor for 2 seconds.

### Gameplay
- Control remains active, no combat.
- Introduce scan pulse input.

### Dialogue
- Wallace: "Not my memory. Not my war."

## Scene 3: Dark Corridor (Stealth Tutorial)

### Trigger
Player enters Medical Corridor.

### Visual
Lights fail. One patrol drone sweeps cone lighting.

### Gameplay
- Teach stealth meter.
- Teach line-of-sight and crouch/silent movement.
- Optional silent takedown.

### Dialogue
- Ship System: "Security automata active. Avoid detection."

## Scene 4: Reactor Junction Puzzle

### Trigger
Player reaches Reactor Control.

### Visual
Three dead terminals around a locked relay.

### Gameplay
- Activate terminals in correct sequence.
- Wrong order: alarm pulse + extra drone spawn.

### Dialogue
- Wallace: "Three nodes, one clean path."
- Ari (comm, first contact): "Wallace, confirm status. I can route partial telemetry."

### Objective Update
Reach Maintenance Bay.

## Scene 5: First Combat Test

### Trigger
Maintenance Bay door opens after relay restored.

### Visual
Drone bursts through service hatch.

### Gameplay
- Teach dodge timing.
- Teach quick strike and cooldown rhythm.
- Arena locks until target eliminated.

### Dialogue
- Ari: "No way around this. End it fast."
- Wallace: "Working on it."

## Scene 6: The Choice (Embryo Annex)

### Trigger
Combat complete, Annex unlocked.

### Visual
Damaged embryo support pod with failing life signs.

### Gameplay
- Choice A: spend blood reserve to stabilize pod.
- Choice B: conserve blood reserve and move on.
- Set persistent flag.

### Dialogue
- Ship System: "Embryo viability critical."
- Wallace (A): "You live. I adapt."
- Wallace (B): "Not now. I need every edge."

### State Results
- Choice A: +trust flag, reduced short-term combat buffer.
- Choice B: -trust flag, increased short-term combat buffer.

## Scene 7: Exit Hook

### Trigger
Player reaches sealed blast door.

### Visual
Door marked Deck B; unknown signal waveform appears on HUD.

### Gameplay
- No combat.
- End-level checkpoint.

### Dialogue
- Ari: "Signal source is old. Older than us."
- Wallace: "Then we stop running and go find it."
- Ship System: "Deck B access pending."

## End Conditions
- Player reaches Blast Door checkpoint.
- Choice flag saved.
- Next objective queued: Investigate signal source on Deck B.
