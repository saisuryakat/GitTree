public class GitTree.Views.HeaderBarView : Gtk.HeaderBar {

    construct {
        title = _("GitTree");
        has_subtitle = false;
        show_close_button = true;

        var quick_action_menu = build_quick_action_menu_ui ();
        var theme_mode_switch = build_theme_mode_switch_ui ();
        var app_menu = build_menu_ui ();

        pack_start (quick_action_menu);
        pack_start (new Gtk.Separator (Gtk.Orientation.HORIZONTAL));
        pack_start_git_fetch_pull_push_button_group_ui ();
        pack_end (app_menu);
        pack_end(theme_mode_switch);
        pack_end_find_button_ui ();
        pack_end_open_with_button_ui ();
        pack_end (new Gtk.Separator (Gtk.Orientation.HORIZONTAL));
        pack_end_stash_button_group_ui();
    }

    private Granite.ModeSwitch build_theme_mode_switch_ui () {
        var theme_mode_switch = new Granite.ModeSwitch.from_icon_name (
            "display-brightness-symbolic",
            "weather-clear-night-symbolic"
        );

        theme_mode_switch.primary_icon_tooltip_text = _("Light Background");
        theme_mode_switch.secondary_icon_tooltip_text = _("Dark background");
        theme_mode_switch.valign = Gtk.Align.CENTER;

        return theme_mode_switch;
    }

    private Gtk.MenuButton build_menu_ui () {
        var new_window_button = build_model_button_ui_with_accel_label (new Granite.AccelLabel (_("New Window"), "<Ctrl><Shift>N"));
        var preferences_button = build_model_button_ui_with_regular_label (new Gtk.Label (_("Preferences")));
        var about_button = build_model_button_ui_with_regular_label (new Gtk.Label (_("About")));
        var quit_button = build_model_button_ui_with_accel_label (new Granite.AccelLabel (_("Quit"), "<Ctrl>Q"));

        var popover_grid = new Gtk.Grid ();
        popover_grid.margin_top = popover_grid.margin_bottom = 3;
        popover_grid.orientation = Gtk.Orientation.VERTICAL;
        popover_grid.add (new_window_button);
        popover_grid.add (new Gtk.Separator (Gtk.Orientation.HORIZONTAL));
        popover_grid.add (preferences_button);
        popover_grid.add (new Gtk.Separator (Gtk.Orientation.HORIZONTAL));
        popover_grid.add (about_button);
        popover_grid.add (quit_button);
        popover_grid.show_all ();

        var popover = new Gtk.Popover (null);
        popover.add (popover_grid);

        var app_menu = new Gtk.MenuButton ();
        app_menu.image = new Gtk.Image.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
        app_menu.tooltip_text = "Menu";
        app_menu.popover = popover;

        return app_menu;
    }

    private Gtk.MenuButton build_quick_action_menu_ui () {
        var open_repo_button = build_model_button_ui_with_accel_label (new Granite.AccelLabel (_("Open Repo"), "<Ctrl>O"));
        var clone_repo_button = build_model_button_ui_with_accel_label (new Granite.AccelLabel (_("Clone Repo"), "<Ctrl><Shift>N"));

        var menu_items = new Gtk.Grid ();
        menu_items.margin_top = menu_items.margin_bottom = 3;
        menu_items.orientation = Gtk.Orientation.VERTICAL;
        menu_items.add (open_repo_button);
        menu_items.add (clone_repo_button);
        menu_items.add (new Gtk.Separator (Gtk.Orientation.HORIZONTAL));
        menu_items.show_all ();

        var menu_items_popover = new Gtk.Popover (null);
        menu_items_popover.add (menu_items);

        var quick_action_menu = new Gtk.MenuButton ();
        quick_action_menu.image = new Gtk.Image.from_icon_name ("document-open", Gtk.IconSize.LARGE_TOOLBAR);
        quick_action_menu.tooltip_text = "Quick Action";
        quick_action_menu.popover = menu_items_popover;

        return quick_action_menu;
    }

    private void pack_start_git_fetch_pull_push_button_group_ui () {
        var git_fetch = build_menu_button_ui ("mail-reply-all", "Fetch");
        var git_pull = build_menu_button_ui ("mail-reply-sender", "Pull");
        var git_push = build_menu_button_ui ("mail-forward", "Push");

        pack_start (git_fetch);
        pack_start (git_pull);
        pack_start (git_push);
    }

    private void pack_end_find_button_ui () {
        var find_button = build_menu_button_ui ("edit-find", "Find");

        pack_end (find_button);
    }

    private void pack_end_open_with_button_ui () {
        var open_with_button = build_menu_button_ui ("document-export", "Open With");

        pack_end (open_with_button);
    }

    private void pack_end_stash_button_group_ui () {
        var save_stash = build_menu_button_ui ("mail-inbox", "Save Stash");
        var apply_stash = build_menu_button_ui ("mail-outbox", "Apply Stash");

        pack_end (apply_stash);
        pack_end (save_stash);
    }

    private Gtk.ModelButton build_model_button_ui_with_accel_label (Granite.AccelLabel label) {
        var model_button = new Gtk.ModelButton ();
        model_button.get_child ().destroy ();
        model_button.add (label);
        return model_button;
    }

    private Gtk.ModelButton build_model_button_ui_with_regular_label (Gtk.Label label) {
        var model_button = new Gtk.ModelButton ();
        model_button.get_child ().destroy ();
        model_button.add (label);
        return model_button;
    }

    private Gtk.Button build_menu_button_ui (string icon_name, string tooltip_text) {
        var app_menu = new Gtk.Button.from_icon_name (icon_name, Gtk.IconSize.LARGE_TOOLBAR);
        app_menu.tooltip_text = tooltip_text;
        return app_menu;
    }

}
