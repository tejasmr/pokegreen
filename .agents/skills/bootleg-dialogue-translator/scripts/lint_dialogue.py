#!/usr/bin/env python3
"""
Dialogue Linter and Formatter for Pokemon Green Bootleg Translation.

Checks:
- Line length <= 18 characters (accounting for variable expansions like <PLAYER>)
- Valid character mapping (flags unmapped chars like ',', "'", lowercase, etc.)
- Auto-fixes common mistakes (lowercasing to UPPERCASE, ',' -> '·', dropping apostrophes)
"""

import sys
import re
import argparse

# Dynamic expansion length for variables in text boxes
VARIABLE_LENGTHS = {
    "<PLAYER>": 7,
    "<RIVAL>": 7,
    "<TARGET>": 10,
    "<USER>": 10,
    "#": 1,
    "<PKMN>": 1,
    "<PC>": 1,
    "<TM>": 1,
    "<TRAINER>": 1,
    "<ROCKET>": 1,
    "<LV>": 1,
    "<ID>": 1,
    "№": 1,
    "<⋯>": 2,
    "⋯": 1,
}

# Unmapped characters and their recommended automatic substitutions
AUTO_REPLACEMENTS = {
    ",": "·",
    "'": "",       # Omit apostrophes (e.g. IT'S -> ITS, DON'T -> DONT)
    "\"": "「",     # Warning: quote closing needs matching 「...」
    "’": "",
    "‘": "",
    "“": "「",
    "”": "」",
    "…": "⋯",
    "..": "⋯",
    "...": "⋯",
}

# Regex to match text commands in ASM
# e.g., \ttext "HELLO WORLD"\n \tline "NEXT LINE"\n
TEXT_CMD_REGEX = re.compile(r'^\s*(text|line|cont|para)\s+"([^"]*)"', re.MULTILINE)

def calculate_rendered_length(text: str) -> int:
    """Calculate the rendered character width of a line, considering token expansion."""
    temp = text
    length = 0
    # Find all tokens like <PLAYER>, <RIVAL>, etc.
    tokens = re.findall(r'<[^>]+>|#|№|⋯', temp)
    for t in tokens:
        exp_len = VARIABLE_LENGTHS.get(t, 1)
        length += exp_len
        temp = temp.replace(t, "", 1)
    # Remaining string is 1 char per visual tile
    length += len(temp)
    return length

def check_unmapped_chars(text: str) -> list[tuple[int, str, str]]:
    """Return list of (index, char, reason) for invalid chars."""
    issues = []
    # Strip known tokens first
    clean_text = re.sub(r'<[^>]+>', '', text)
    
    for idx, ch in enumerate(clean_text):
        if 'a' <= ch <= 'z':
            issues.append((idx, ch, "Lowercase letter not supported in ROM charmap (use UPPERCASE)"))
        elif ch == ',':
            issues.append((idx, ch, "Comma ',' is not charmapped (use '·' or omit)"))
        elif ch in ("'", "’", "‘"):
            issues.append((idx, ch, "Apostrophe \"'\" is not charmapped (omit e.g. LETS, DONT)"))
        elif ch in ('"', '“', '”'):
            issues.append((idx, ch, "ASCII quotes not mapped (use Japanese brackets 「 and 」)"))
        elif ch in (';'):
            issues.append((idx, ch, "Semicolon breaks ASM comments"))
    return issues

def sanitize_line(text: str) -> str:
    """Auto-fix text according to bootleg mapping rules."""
    out = text
    for old, new in AUTO_REPLACEMENTS.items():
        out = out.replace(old, new)
    # Uppercase ASCII letters
    # Avoid uppercasing inside <...> tokens if any
    parts = re.split(r'(<[^>]+>)', out)
    res = []
    for part in parts:
        if part.startswith('<') and part.endswith('>'):
            res.append(part)
        else:
            res.append(part.upper())
    return "".join(res)

def lint_file(file_path: str, autofix: bool = False) -> tuple[int, list[str]]:
    with open(file_path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    errors = 0
    report = []
    new_lines = []

    for line_num, line in enumerate(lines, 1):
        match = TEXT_CMD_REGEX.match(line)
        if match:
            cmd, content = match.groups()
            modified_content = content
            
            if autofix:
                modified_content = sanitize_line(content)
                line = re.sub(r'"([^"]*)"', f'"{modified_content}"', line, count=1)
            
            rendered_len = calculate_rendered_length(modified_content)
            issues = check_unmapped_chars(modified_content)
            
            if rendered_len > 18:
                errors += 1
                report.append(f"{file_path}:{line_num}: LINE TOO LONG ({rendered_len}/18 chars): \"{modified_content}\"")
            
            for _, ch, reason in issues:
                errors += 1
                report.append(f"{file_path}:{line_num}: INVALID CHAR '{ch}': {reason} in \"{modified_content}\"")
        
        new_lines.append(line)

    if autofix and errors > 0:
        with open(file_path, "w", encoding="utf-8") as f:
            f.writelines(new_lines)
        report.append(f"[Auto-fixed applied to {file_path}]")

    return errors, report

def main():
    parser = argparse.ArgumentParser(description="Lint and validate Pokegreen dialogue strings.")
    parser.add_argument("files", nargs="+", help="ASM files to check")
    parser.add_argument("--fix", action="store_true", help="Automatically fix lowercase and common unmapped chars")
    args = parser.parse_args()

    total_errors = 0
    for file_path in args.files:
        errors, report = lint_file(file_path, autofix=args.fix)
        total_errors += errors
        for msg in report:
            print(msg)

    if total_errors == 0:
        print("✓ All dialogue lines fit within 18 chars and use valid charmap characters!")
        sys.exit(0)
    else:
        print(f"\nFound {total_errors} issue(s).")
        sys.exit(1)

if __name__ == "__main__":
    main()

