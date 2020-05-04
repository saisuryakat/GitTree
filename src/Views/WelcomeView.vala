public class GitTree.Views.WelcomeView : Granite.SettingsPage {
    public unowned GitTree.AppWindow app_window { get; construct; }

    public WelcomeView (GitTree.AppWindow app_window) {
    var home_icon = new Gtk.Image ();
    home_icon.gicon = new ThemedIcon ("go-home");
    home_icon.pixel_size = 24;

        Object (
            header: _("Home"),
            display_widget: home_icon,
            title: _("Welcome"),
            status: _("Get started"),
            app_window: app_window
        );
    }

    construct {
        var welcome = new Granite.Widgets.Welcome (_("Welcome to GitTree"), _("Get started . . ."));
        welcome.append ("folder-open", _("Open Repo"), _("Open an existing Repo from files"));
        welcome.append ("folder-copy", _("Clone Repo"), _("Clone a new Repo from internet"));
        welcome.append ("folder-new", _("Init Repo"), _("Initialize a new Git Repo"));

        add (welcome);

        welcome.activated.connect ((index) => {
            switch (index) {
                case 0:
                    handle_open_repo ();
                    break;
                case 1:
                    handle_clone_repo ();
                    break;
                case 2:
                    handle_init_repo ();
            }
        });
    }

    private void handle_open_repo () {
        var open_repo_dialog = new Gtk.FileChooserNative (_("Select a Repo Folder"),
                                                          app_window,
                                                          Gtk.FileChooserAction.SELECT_FOLDER,
                                                          _("Open"),
                                                          _("Cancel"));
        open_repo_dialog.local_only = true;
        open_repo_dialog.modal = true;
        //open_repo_dialog.response_connect ();
        open_repo_dialog.run ();
    }

    private void handle_clone_repo () {
        print ("Handle Clone Repo");
    }

    private void handle_init_repo () {
        print ("Handle Init Repo");
    }
}
