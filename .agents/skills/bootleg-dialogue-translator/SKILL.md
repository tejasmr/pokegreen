---
name: bootleg-dialogue-translator
description: >-
  Translate Japanese dialogues, signs, NPC text, menus, and object interactions in Pokemon Green
  into the project's signature bootleg style with Japanese language-teaching elements, enforcing
  the 17-character limit and ROM charmap constraints.
---

# Bootleg Dialogue Translator for Pokemon Green

Use this skill when translating dialogue, NPC speech, signs, menus, or interactive object scripts
from Japanese to the project's unique "Bootleg English + Japanese Teaching" aesthetic.

> [!NOTE]
> This skill is strictly for dialogue, signs, menus, and interaction text.
> Do NOT use this skill for renaming Pokemon species, items, or attack moves unless explicitly requested.

---

## 1. Aesthetic & Tone Pillars

### A. The "Bootleg" Style
Inspired by 90s unlicensed/bootleg translations (e.g. Vietnamese Crystal, Diamond/Jade, Telefang):
- **Endearingly literal or slightly awkward phrasing**:
  - `はじめまして！` → `FIRST TIME / MEETING YOU!`
  - `おさななじみ` → `CHILD PAL`
  - `しょうぶに つかったり` → `FOR MATCHES···`
  - `じぶんできめる` → `DEFINE`
- **Punchy and exuberant**:
  - Heavy use of `!` and `···`
  - Direct, earnest dialogue with dramatic energy.

### B. Japanese Language Teaching & Cultural Retention
- **Keep Japanese Names & Terms**:
  - Oak: `OOKIDO` or `DR. PET` / `DR. OOKIDO`
  - Red / Green / Blue: `AKA` / `MIDORI` / `AOKI`
  - Rival / Protagonist defaults: `SATOSHI`, `SHIGERU`, `JACK`, `JOHN`
  - Pokemon collective term: `「PACHIMON」` / `「PACHIMONS」` / `「PETS」`
- **Japanese Quotation Marks**: Always use `「` and `」` or `『` and `』` around special terms or emphasized Japanese concepts (never ASCII quotes).
- **Japanese loan words**: Drop in common conversational Japanese words or romanized concepts where fitting (e.g., `SUGOI!`, `ARIGATOU`, `SENPAI`, `TASUKETE`).

---

## 2. Hard Character & ROM Constraints

### A. Line Length Limit: Exactly 17 Characters
- Game Boy screen is 20 tiles wide with 1 tile border on left and right, giving an 18-tile interior.
- **Always keep lines to 17 characters maximum** (never 18).
- **Why?**: The text engine uses the 18th column on the second line for the blinking `▼` button prompt arrow and scroll indicator. Filling all 18 characters causes the last character to be overwritten or glitched by the prompt indicator.
- Every string inside `text`, `line`, `cont`, `para` must NOT exceed 17 characters.
- **Dynamic variables expand**:
  - `<PLAYER>`: assume up to 7 characters. Line with `<PLAYER>` must be $\le 17 - 7 = 10$ characters long!
  - `<RIVAL>`: assume up to 7 characters. Line with `<RIVAL>` must be $\le 17 - 7 = 10$ characters long!
  - `<TARGET>` / `<USER>`: assume up to 10 characters ($\le 7$ characters of surrounding text).
  - `#`: takes 1 tile ($54).

### B. Character Map Restrictions
Only uppercase English letters and specific symbols exist in the ROM charmap:
- **NO LOWERCASE**: All text must be in **UPPERCASE** (`A-Z`).
- **NO COMMA (`,`)**: Replace with middle dot `·` (`$74`), a dash `-`, or omit.
- **NO APOSTROPHE (`'`)**: Omit the apostrophe entirely:
  - `LET'S` → `LETS`
  - `DON'T` → `DONT`
  - `CAN'T` → `CANT`
  - `IT'S` → `ITS`
  - `I'M` → `I AM`
- **NO DOUBLE QUOTES (`"` inside strings)**: Use `「` and `」` (`$70`, `$71`).
- **Punctuation supported**:
  - Middle dot: `·` (`$74`)
  - Ellipsis: `⋯` (`$75` or `···`)
  - Question mark: `?` / `？` (`$e6`)
  - Exclamation mark: `!` / `！` (`$e7`)
  - Period: `.` (`$f2`)
  - Hyphen: `-` (`$e3`)
  - Slash: `/` (`$f3`)
  - Colon: `:` (`$6d`)
  - Gender: `♂` (`$ef`), `♀` (`$f5`)
  - Multiplication: `×` (`$f1`)

---

## 3. RGBDS Dialogue Control Commands

- `text "..."`: Starts a brand new dialogue box (line 1).
- `line "..."`: Moves cursor to line 2 without scrolling.
- `cont "..."`: Scrolls existing text up by one line and writes to line 2.
- `para "..."`: Waits for user button press (`▼`), clears the text box completely, and starts at line 1.
- `prompt`: Displays blinking arrow `▼`, waits for button press, and returns to caller/script.
- `done`: Ends the text box and closes display.
- `@`: String terminator byte.

---

## 4. Helper Tools & Verification Workflow

Helper scripts are located in `.agents/skills/bootleg-dialogue-translator/scripts/`:

1. **Lint dialogue for line length and illegal characters**:
   ```bash
   python3 .agents/skills/bootleg-dialogue-translator/scripts/lint_dialogue.py <path_to_asm_file>
   ```
   To automatically fix casing and replace commas/apostrophes:
   ```bash
   python3 .agents/skills/bootleg-dialogue-translator/scripts/lint_dialogue.py --fix <path_to_asm_file>
   ```

2. **Preview text box rendering in terminal**:
   ```bash
   python3 .agents/skills/bootleg-dialogue-translator/scripts/preview_box.py <path_to_asm_file>
   ```

3. **Verify ROM compilation**:
   ```bash
   ./build.sh all
   ```

