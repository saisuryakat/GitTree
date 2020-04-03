public class GitTree.Window : Gtk.ApplicationWindow {
    public Window (Application app) {
        Object (
            application: app
        );
    }

    construct {
        default_width = 1024;
        default_height = 760;

        //HeaderBar
        var header = new Gtk.HeaderBar ();
        header.show_close_button = true;
        header.title = _("GitTree");

        set_titlebar (header);

        //WindowBody
        var welcome_view = new GitTree.WelcomeView (this);
        add (welcome_view);

        show_all ();
    }
}
