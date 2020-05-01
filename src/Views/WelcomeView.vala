public class GitTree.Views.WelcomeView : Granite.SettingsPage {

    public WelcomeView () {
    var home_icon = new Gtk.Image ();
    home_icon.gicon = new ThemedIcon ("go-home");
    home_icon.pixel_size = 24;

        Object (
            header: _("Home"),
            display_widget: home_icon,
            title: _("Welcome"),
            status: _("Get started")
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
        print ("Handle Open Repo");
    }

    private void handle_clone_repo () {
        print ("Handle Clone Repo");
    }

    private void handle_init_repo () {
        print ("Handle Init Repo");
    }
}
