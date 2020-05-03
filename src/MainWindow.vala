using Gee;

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

        var notebook = new Granite.Widgets.DynamicNotebook ();
        notebook.expand = true;
        notebook.allow_restoring = true;

        int i = 0;

        var new_tab_page = new GitTree.Views.NewTab ();
        notebook.insert_tab(new_tab_page, i);

        notebook.new_tab_requested.connect (() => {
            notebook.insert_tab(new GitTree.Views.NewTab (), ++i);
        });

        notebook.tab_restored.connect ((label, data, icon) => {

        });

        add (notebook);

        show_all ();
    }

}
