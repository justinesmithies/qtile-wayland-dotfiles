# Qtile Config File
# http://www.qtile.org/

# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

from typing import List  # noqa: F401
import hooks
from keys import mod, keys, home
from workspaces import workspaces
from groups import groups
from layouts import layouts
from widgets import widget_defaults, extension_defaults
from screens import screens
from mouse import mouse
from libqtile.backend.wayland import InputConfig

# Configure input devices

wl_input_rules = {
    "type:keyboard": InputConfig(
        kb_layout='us',
    ),
}

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
