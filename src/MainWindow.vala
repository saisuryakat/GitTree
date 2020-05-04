using Gee;

public class GitTree.AppWindow : Gtk.ApplicationWindow {
    public unowned GitTree.Services.DatabaseService db_service { get; construct; }

    public AppWindow (Application app, GitTree.Services.DatabaseService db_service) {
        Object (
            application: app,
            db_service: db_service
        );
    }

    construct {
        default_width = 1366;
        default_height = 768;

        //HeaderBar
        var header = new GitTree.Views.HeaderBarView ();
        set_titlebar (header);

        //WindowBody
        var tabbed_window = new Granite.Widgets.DynamicNotebook ();
        tabbed_window.expand = true;
        tabbed_window.allow_restoring = true;

        int tab_index = 0;

        var new_tab_page = new GitTree.Views.NewTab (this, db_service);
        tabbed_window.insert_tab(new_tab_page, tab_index);

        tabbed_window.new_tab_requested.connect (() => {
            tabbed_window.insert_tab(new GitTree.Views.NewTab (this, db_service), ++tab_index);
        });

        tabbed_window.tab_restored.connect ((label, data, icon) => {
        });

        tabbed_window.close_tab_requested.connect ((tab) => {
            if (tab_index-1 == -1) {
                return false;
            } else {
                tab_index--;
                return true;
            }
        });

        add (tabbed_window);

        show_all ();
    }

}
