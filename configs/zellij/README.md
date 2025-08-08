# Zellij Configuration Guide

This directory contains custom Zellij configuration with optimized keybindings for efficient terminal multiplexing.

## Quick Start

```bash
# Start Zellij with this configuration
zellij --config-dir /path/to/this/directory

# Or copy config.kdl to ~/.config/zellij/
cp config.kdl ~/.config/zellij/config.kdl
```

## Mode System

Zellij operates in different modes, each with specific keybindings:

- **Normal**: Default mode for regular terminal usage
- **Locked**: Keybindings disabled, all input goes to terminal
- **Pane**: Pane management and navigation
- **Tab**: Tab management and navigation
- **Resize**: Pane resizing operations
- **Move**: Moving panes around
- **Scroll**: Scrolling through pane history
- **Search**: Searching in scroll buffer
- **Session**: Session management operations
- **Tmux**: Tmux-compatible keybindings

## Essential Keybindings

### Mode Switching (Available in most modes)
| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl g` | Lock/Unlock | Toggle locked mode |
| `Ctrl p` | Pane Mode | Enter pane management mode |
| `Ctrl t` | Tab Mode | Enter tab management mode |
| `Ctrl n` | Resize Mode | Enter pane resize mode |
| `Ctrl h` | Move Mode | Enter pane move mode |
| `Ctrl s` | Scroll Mode | Enter scroll/history mode |
| `Ctrl o` | Session Mode | Enter session management |
| `Ctrl b` | Tmux Mode | Enter tmux-compatible mode |
| `Ctrl q` | Quit | Exit Zellij |

## Pane Management (Ctrl p)

### Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `h` / `left` | Move Left | Focus left pane |
| `j` / `down` | Move Down | Focus down pane |
| `k` / `up` | Move Up | Focus up pane |
| `l` / `right` | Move Right | Focus right pane |
| `p` | Switch Focus | Toggle between panes |

### Creation
| Key | Action | Description |
|-----|--------|-------------|
| `n` | New Pane | Create new pane |
| `d` | New Down | Create pane below |
| `r` | New Right | Create pane to the right |
| `s` | New Stacked | Create stacked pane |

### Management
| Key | Action | Description |
|-----|--------|-------------|
| `x` | Close Pane | Close focused pane |
| `f` | Fullscreen | Toggle pane fullscreen |
| `z` | Toggle Frames | Show/hide pane frames |
| `w` | Floating | Toggle floating panes |
| `e` | Embed/Float | Toggle pane embed/float |
| `c` | Rename | Rename current pane |
| `i` | Pin/Unpin | Toggle pane pinned state |

## Tab Management (Ctrl t)

### Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `h` / `left` | Previous Tab | Go to previous tab |
| `l` / `right` | Next Tab | Go to next tab |
| `j` / `down` | Next Tab | Go to next tab |
| `k` / `up` | Previous Tab | Go to previous tab |
| `1-9` | Go to Tab | Go to specific tab number |
| `tab` | Toggle Tab | Switch to last active tab |

### Management
| Key | Action | Description |
|-----|--------|-------------|
| `n` | New Tab | Create new tab |
| `x` | Close Tab | Close current tab |
| `r` | Rename Tab | Rename current tab |
| `s` | Sync Toggle | Toggle tab sync mode |

### Pane Breaking
| Key | Action | Description |
|-----|--------|-------------|
| `b` | Break Pane | Move pane to new tab |
| `[` | Break Left | Break pane to left |
| `]` | Break Right | Break pane to right |

## Resize Mode (Ctrl n)

### Basic Resize
| Key | Action | Description |
|-----|--------|-------------|
| `h` / `left` | Increase Left | Expand pane leftward |
| `j` / `down` | Increase Down | Expand pane downward |
| `k` / `up` | Increase Up | Expand pane upward |
| `l` / `right` | Increase Right | Expand pane rightward |
| `+` / `=` | Increase | General size increase |
| `-` | Decrease | General size decrease |

### Fine Control
| Key | Action | Description |
|-----|--------|-------------|
| `H` | Decrease Left | Shrink from left |
| `J` | Decrease Down | Shrink from bottom |
| `K` | Decrease Up | Shrink from top |
| `L` | Decrease Right | Shrink from right |

## Move Mode (Ctrl h)

| Key | Action | Description |
|-----|--------|-------------|
| `h` / `left` | Move Left | Move pane left |
| `j` / `down` | Move Down | Move pane down |
| `k` / `up` | Move Up | Move pane up |
| `l` / `right` | Move Right | Move pane right |
| `n` | Move Forward | Move pane forward |
| `p` | Move Back | Move pane backward |
| `tab` | Move | Move pane to next position |

## Scroll Mode (Ctrl s)

### Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `j` / `down` | Scroll Down | Scroll down one line |
| `k` / `up` | Scroll Up | Scroll up one line |
| `h` / `left` | Page Up | Scroll up one page |
| `l` / `right` | Page Down | Scroll down one page |
| `Ctrl f` | Page Down | Fast page down |
| `Ctrl b` | Page Up | Fast page up |
| `d` | Half Page Down | Scroll half page down |
| `u` | Half Page Up | Scroll half page up |

### Search & Edit
| Key | Action | Description |
|-----|--------|-------------|
| `s` | Search | Enter search mode |
| `e` | Edit | Edit scrollback in editor |
| `Ctrl c` | Exit | Return to normal mode |

## Search Mode

| Key | Action | Description |
|-----|--------|-------------|
| `n` | Next | Find next occurrence |
| `p` | Previous | Find previous occurrence |
| `c` | Case Toggle | Toggle case sensitivity |
| `w` | Word Toggle | Toggle whole word search |
| `o` | Wrap Toggle | Toggle search wrap |

## Session Mode (Ctrl o)

| Key | Action | Description |
|-----|--------|-------------|
| `d` | Detach | Detach from session |
| `w` | Session Manager | Launch session manager |
| `p` | Plugin Manager | Launch plugin manager |
| `c` | Configuration | Open configuration |
| `s` | Share Session | Share session options |
| `a` | About | Show about dialog |

## Global Shortcuts (Alt combinations)

These work in most modes:

### Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `Alt h` | Focus/Tab Left | Move focus or tab left |
| `Alt j` | Focus Down | Move focus down |
| `Alt k` | Focus Up | Move focus up |
| `Alt l` | Focus/Tab Right | Move focus or tab right |

### Quick Actions
| Key | Action | Description |
|-----|--------|-------------|
| `Alt n` | New Pane | Create new pane |
| `Alt f` | Float Toggle | Toggle floating panes |
| `Alt +` | Resize Up | Increase pane size |
| `Alt -` | Resize Down | Decrease pane size |
| `Alt [` | Prev Layout | Previous swap layout |
| `Alt ]` | Next Layout | Next swap layout |

### Tab Management
| Key | Action | Description |
|-----|--------|-------------|
| `Alt i` | Move Tab Left | Move current tab left |
| `Alt o` | Move Tab Right | Move current tab right |

### Group Management
| Key | Action | Description |
|-----|--------|-------------|
| `Alt p` | Toggle Group | Toggle pane in group |
| `Alt Shift p` | Mark Group | Toggle group marking |

## Tmux Mode (Ctrl b)

For tmux users, familiar keybindings:

| Key | Action | Description |
|-----|--------|-------------|
| `h/j/k/l` | Navigate | Vim-style navigation |
| `arrows` | Navigate | Arrow key navigation |
| `"` | Split Horizontal | Split pane horizontally |
| `%` | Split Vertical | Split pane vertically |
| `c` | New Tab | Create new tab |
| `n` | Next Tab | Next tab |
| `p` | Previous Tab | Previous tab |
| `z` | Zoom | Toggle pane zoom |
| `x` | Close | Close current pane |
| `[` | Copy Mode | Enter scroll mode |
| `space` | Next Layout | Cycle through layouts |
| `,` | Rename Tab | Rename current tab |
| `o` | Next Pane | Focus next pane |

## Tips & Tricks

### Workflow Suggestions
1. **Start with tabs**: Use `Ctrl t` then `n` to create tabs for different projects
2. **Split within tabs**: Use `Ctrl p` then `d`/`r` to create panes within tabs  
3. **Use floating panes**: `Alt f` for temporary overlays
4. **Sync mode**: `Ctrl t` then `s` to send commands to all panes in a tab
5. **Session management**: `Ctrl o` then `w` to switch between sessions

### Customization
- Edit `config.kdl` to modify keybindings
- Add themes and layouts in the respective sections
- Plugin system allows extended functionality

### Performance
- Clear defaults are enabled (`clear-defaults=true`)
- Optimized for keyboard-driven workflow
- Minimal mouse dependency for speed

## Configuration File Structure

The `config.kdl` file contains:
- **keybinds**: Custom key mappings for all modes
- **plugins**: Plugin definitions and aliases  
- **theme**: Visual appearance settings
- **options**: Behavior configuration

## Troubleshooting

### Common Issues
1. **Keys not working**: Check if you're in the right mode
2. **Can't exit mode**: Try `Esc` or `Enter` to return to normal
3. **Conflicts**: Some terminal emulators may capture certain key combinations

### Mode Confusion
- Use `Esc` or `Enter` to return to normal mode from most modes
- `Ctrl g` locks/unlocks all keybindings
- Status bar shows current mode

---

*This configuration optimizes Zellij for efficient terminal multiplexing with vim-like navigation and intuitive keybindings.*