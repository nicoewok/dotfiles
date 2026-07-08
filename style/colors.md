# SYSTEMS DESIGN SPECIFICATION: RETRO MONOCHROME PIXEL STATION

## 1. THE ARCHITECTURAL CORE
* **Design Philosophy:** Ultra-minimalist, flat, data-dense 8-bit arcade workstation. No blurred transparency, no heavy gradients, no anti-aliasing artifacts on interface assets. 
* **Target Interfaces:** Hyprland (Wayland), Kitty (Terminal), Starship (Prompt Engine), Fuzzel (Application Launcher), Hyprlock (Security Screen).

---

## 2. THE CHROME METRIC PALETTE (RGBA / HEX)
All system files must be hard-coded using these exact tones. Colors are muted, pastel-like, and highly contrasted against a deeply dark terminal backing.

| Element ID | Hex Value | Color Name | Application Target |
| :--- | :--- | :--- | :--- |
| **Canvas** | `#1c1c1c` | Dark Charcoal | Primary window backgrounds, empty screen spaces. |
| **Panel** | `#2a2a2a` | Medium Graphite | Selection fields, inactive tabs, outline borders. |
| **Text Primary** | `#f5f5dc` | Soft Warm Beige | Standard terminal text, primary metrics, glyph borders. |
| **Accent Pastel** | `#87ceeb` | Sky Blue | Active Git branches, prompt symbols, highlighted metrics. |
| **Accent Sub** | `#b19cd9` | Pastel Purple | System user names, secondary tags, structural headers. |
| **Alert Stack** | `#ffb7c5` | Pastel Pink / Coral | Git modification markers, system error states, alerts. |

---

## 3. TYPOGRAPHY ENGINE RULES
* **Primary Fonts:** `scientifica` (Main preference) and `Cozette`.
* **Rendering Mandate:** High-density, raw, bitmap scaling grids. 
* **Anti-Aliasing Exception:** While global system anti-aliasing remains `true` for general application content, **Kitty terminal rules and Hyprlock labels must bypass smooth processing layers** where possible to enforce a razor-sharp 1:1 pixel rendering structure.
* **Layout Spacing:** Terminal layouts must enforce explicit text boundaries (`window_padding_width 12`) to keep 8-bit glyph corners from hitting physical screen bezels.

---

## 4. ARTWORK & COMPONENT GEOMETRY
* **Wallpaper Concept:** Dark grey and beige monotone pixel art assets (e.g., `/Pictures/wallpapers/13.png`).
    * *Landscape Screen (DP-2):* Set to `fit_mode = cover` or hard native aspect ratios to maximize coverage.
    * *Portrait Screen (HDMI-A-1):* Set to `fit_mode = contain` to prevent pixel stretching on vertical reading grids.
* **System Identifiers:** Pure text-mode vector replacements. The official **NixOS Text-Mode ASCII Snowflake** is the mandatory graphic for both `fastfetch` system statistics and centered `hyprlock` login layout screens.

---

## 5. CODE BLOCK PATTERN RULES
When generating structural layout parameters for this machine, wrap configurations inside these structural styles:

* **Starship Prompts:** Multi-line bracket frame shapes using ASCII tracking lines:
    ```text
    ┌─ [user] in [path] on [git_branch]
    └─> 
    ```
* **Window Logic:** Standard, hard-grid native tiling behaviors. Floating modifiers must be explicitly suppressed unless requested, but window rules must utilize minsize boundaries (`size >600 >150`) using classic syntax definitions to prevent layout crushing on crowded display channels.
