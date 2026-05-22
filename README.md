# My Ghostty Configs

Personal Ghostty config notes and reusable setup snippets.

## Focus Border

This setup cycles split focus with `Ctrl+Tab` and shows a short blue border when a split gains focus.

### Files

- `config.ghostty`: Ghostty config snippet.
- `shaders/focus-border.glsl`: Custom shader that draws the focus blink.

### Install

Copy or symlink the shader:

```sh
mkdir -p ~/.config/ghostty/shaders
cp shaders/focus-border.glsl ~/.config/ghostty/shaders/focus-border.glsl
```

Add this to your Ghostty config:

```ini
keybind = ctrl+tab=goto_split:next
custom-shader = ~/.config/ghostty/shaders/focus-border.glsl
custom-shader-animation = true
```

On macOS, the Ghostty config is usually:

```text
~/Library/Application Support/com.mitchellh.ghostty/config.ghostty
```

Reload Ghostty config after installing.
