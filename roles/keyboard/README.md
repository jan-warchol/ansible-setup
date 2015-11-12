Custom keyboard layout
----------------------

This role copies my custom XKB keyboard layout to `~/.config/xkb`, from
where it is read by my `.bashrc`.  Note that the layout is
[parameterized](roles/keyboard/templates/xkb/symbols/modifier_keys#L53)
to take into account the physical differences between various keyboards.

**TODO:** install the layout as a regular, system-wide keyboard layout.

