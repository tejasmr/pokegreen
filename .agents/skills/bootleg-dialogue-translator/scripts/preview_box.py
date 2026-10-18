#!/usr/bin/env python3
"""
Terminal visualizer for Game Boy text boxes in Pokemon Green.
Renders text as it appears in the 20x18 Game Boy window with standard borders.
"""

import sys
import re

def render_box(lines: list[str], prompt: str = "▼"):
    border_top = "┌" + "─" * 18 + "┐"
    border_bot = "└" + "─" * 18 + "┘"
    
    l1 = lines[0] if len(lines) > 0 else ""
    l2 = lines[1] if len(lines) > 1 else ""
    
    # Pad to 18 chars
    l1_padded = l1.ljust(18)
    l2_padded = l2.ljust(17) + (prompt if len(lines) > 1 else " ")
    
    print(border_top)
    print(f"│{l1_padded}│")
    print(f"│{l2_padded}│")
    print(border_bot)
    print()

def preview_asm_text(file_path: str):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.readlines()

    current_label = None
    box_lines = []

    for line in content:
        label_match = re.match(r'^([A-Za-z0-9_]+):', line)
        if label_match:
            current_label = label_match.group(1)
            print(f"=== {current_label} ===")
            box_lines = []
            continue

        cmd_match = re.match(r'^\s*(text|line|cont|para)\s+"([^"]*)"', line)
        if cmd_match:
            cmd, text = cmd_match.groups()
            if cmd == "text":
                box_lines = [text]
            elif cmd == "line":
                box_lines.append(text)
                render_box(box_lines, "▼")
            elif cmd == "cont":
                # Scrolls 1 line up
                if len(box_lines) >= 2:
                    box_lines = [box_lines[1], text]
                else:
                    box_lines.append(text)
                render_box(box_lines, "▼")
            elif cmd == "para":
                box_lines = [text]

        end_match = re.match(r'^\s*(prompt|done)', line)
        if end_match:
            end_cmd = end_match.group(1)
            if len(box_lines) == 1:
                render_box([box_lines[0], ""], " " if end_cmd == "done" else "▼")
            elif len(box_lines) >= 2:
                render_box(box_lines, " " if end_cmd == "done" else "▼")
            box_lines = []

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: preview_box.py <asm_file>")
        sys.exit(1)
    preview_asm_text(sys.argv[1])

