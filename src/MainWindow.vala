public class GitTree.AppWindow : Gtk.ApplicationWindow {
    public AppWindow (Application app) {
        Object (
            application: app
        );
    }

    construct {
        default_width = 1366;
        default_height = 768;

        //HeaderBar
        var header = new GitTree.Views.HeaderBarView ();

        set_titlebar (header);

        //WindowBody
        var welcome_view = new GitTree.Views.WelcomeView ();
        var hosting_services_view = new GitTree.Views.HostingServicesView ();
        var recents_view = new GitTree.Views.RecentsView ();
        var repositories_view = new GitTree.Views.RepositoriesView ();

        var sidebar_options = new Gtk.Stack ();
        sidebar_options.add_named (welcome_view, "Welcome");
        sidebar_options.add_named (hosting_services_view, "Services");
        sidebar_options.add_named (recents_view, "Recents");
        sidebar_options.add_named (repositories_view, "Repositories");

        var sidebar = new Granite.SettingsSidebar (sidebar_options);

        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.add1 (sidebar);
        paned.add2 (sidebar_options);

        add (paned);

        show_all ();
    }

}
