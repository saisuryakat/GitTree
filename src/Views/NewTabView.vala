public class GitTree.Views.NewTabView : Gtk.Paned {
    public unowned GitTree.Services.DatabaseService db_service { get; construct; }
    public unowned GitTree.AppWindow app_window { get; construct; }

    public NewTabView (GitTree.AppWindow app_window, GitTree.Services.DatabaseService db_service) {
        Object (
            orientation: Gtk.Orientation.HORIZONTAL,
            app_window: app_window,
            db_service: db_service
        );
    }

    construct {
        var welcome_view = new GitTree.Views.WelcomeView (app_window);

        var welcome = new Granite.Widgets.SourceList.Item ("Welcome");
        welcome.icon = new GLib.ThemedIcon ("go-home");

        var hosting_services = build_hosting_services_ui ();
        var all_repos = build_all_repos_ui ();

        var sidebar_options = new Granite.Widgets.SourceList ();
        sidebar_options.root.add (welcome);
        sidebar_options.root.add (hosting_services);
        sidebar_options.root.add (all_repos);

        position = 200;
        pack1 (sidebar_options, true, true);
        add2 (welcome_view);
    }

    private Granite.Widgets.SourceList.ExpandableItem build_hosting_services_ui () {
        var github = new Granite.Widgets.SourceList.Item ("GitHub");
        github.icon = new GLib.ThemedIcon ("internet-web-browser");

        var gitlab = new Granite.Widgets.SourceList.Item ("GitLab");
        gitlab.icon = new GLib.ThemedIcon ("internet-web-browser");

        var bitbucket = new Granite.Widgets.SourceList.Item ("Bitbucket");
        bitbucket.icon = new GLib.ThemedIcon ("internet-web-browser");

        var hosting_services = new Granite.Widgets.SourceList.ExpandableItem ("Hosting Services");
        hosting_services.expand_all ();
        hosting_services.add (github);
        hosting_services.add (gitlab);
        hosting_services.add (bitbucket);

        return hosting_services;
    }

    private Granite.Widgets.SourceList.ExpandableItem build_all_repos_ui () {
        var all_repos = this.db_service.fetch_all_repositories ();

        var all_repositories = new Granite.Widgets.SourceList.ExpandableItem ("Repositories");

        foreach (var repo in all_repos) {
            var repository = new Granite.Widgets.SourceList.Item (repo.name);
            repository.icon = new GLib.ThemedIcon ("text-x-script");
            all_repositories.add (repository);
        }
        all_repositories.expand_all ();

        return all_repositories;
    }
}
