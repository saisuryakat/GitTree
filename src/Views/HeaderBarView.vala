public class GitTree.Views.HeaderBarView : Gtk.HeaderBar {
    construct {
        var theme_mode_switch = makeThemeModeSwitch ();

        title = _("GitTree");
        show_close_button = true;

        pack_end(theme_mode_switch);
    }

    private Granite.ModeSwitch makeThemeModeSwitch () {
        var theme_mode_switch = new Granite.ModeSwitch.from_icon_name (
            "display-brightness-symbolic",
            "weather-clear-night-symbolic"
        );

        theme_mode_switch.primary_icon_tooltip_text = _("Light Background");
        theme_mode_switch.secondary_icon_tooltip_text = _("Dark background");
        theme_mode_switch.valign = Gtk.Align.CENTER;

        return theme_mode_switch;
    }
}
