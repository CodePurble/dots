#!/usr/bin/env python3
import gi
gi.require_version("Gtk", "3.0")
gi.require_version("AppIndicator3", "0.1")
from gi.repository import Gtk as gtk
from gi.repository import AppIndicator3 as appindicator

def main():
    indicator = appindicator.Indicator.new(
            "optimus-tray",
            "/home/ramprakash/.dotfiles/polybar/scripts/icons/48-apps-intel.svg",
            appindicator.IndicatorCategory.APPLICATION_STATUS
            )

    indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
    gtk.main()

if __name__ == "__main__":
    main()
