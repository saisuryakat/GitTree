public class GitTree.Views.NewTabView : Gtk.Paned {
    public NewTabView () {
        Object (
            orientation: Gtk.Orientation.HORIZONTAL
        );
    }

    construct {
        //Welcome
        var welcome_view = new GitTree.Views.WelcomeView ();

        var welcome = new Granite.Widgets.SourceList.Item ("Welcome");
        welcome.icon = new GLib.ThemedIcon ("go-home");

        var hosting_services = build_hosting_services_ui ();
        var recent_repos = build_recent_repos_ui ();
        var all_repos = build_all_repos_ui ();

        var sidebar_options = new Granite.Widgets.SourceList ();
        sidebar_options.root.add (welcome);
        sidebar_options.root.add (hosting_services);
        sidebar_options.root.add (recent_repos);
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

    private Granite.Widgets.SourceList.ExpandableItem build_recent_repos_ui () {
        var houston = new Granite.Widgets.SourceList.Item ("Houston");
        houston.icon = new GLib.ThemedIcon ("text-x-script");

        var elementary_os_installer = new Granite.Widgets.SourceList.Item ("elementary os installer");
        elementary_os_installer.icon = new GLib.ThemedIcon ("text-x-script");

        //var recent_repos_list = new ArrayList<GitTree.Models.GitRepository> ();

        var recent_repos = new Granite.Widgets.SourceList.ExpandableItem ("Recents");
        recent_repos.add (houston);
        recent_repos.add (elementary_os_installer);
        recent_repos.expand_all ();

        return recent_repos;
    }

    private Granite.Widgets.SourceList.ExpandableItem build_all_repos_ui () {
        //Repositories
        var houston = new Granite.Widgets.SourceList.Item ("Houston");
        houston.icon = new GLib.ThemedIcon ("text-x-script");

        var elementary_os_installer = new Granite.Widgets.SourceList.Item ("elementary os installer");
        elementary_os_installer.icon = new GLib.ThemedIcon ("text-x-script");

        var elementary_folder = new Granite.Widgets.SourceList.ExpandableItem ("Elementary");
        elementary_folder.icon = new GLib.ThemedIcon ("folder");
        elementary_folder.add (houston);
        elementary_folder.add (elementary_os_installer);

        var mutter = new Granite.Widgets.SourceList.Item ("Mutter");
        mutter.icon = new GLib.ThemedIcon ("text-x-script");

        var libgit2 = new Granite.Widgets.SourceList.Item ("libgit2");
        libgit2.icon = new GLib.ThemedIcon ("text-x-script");

        var gnome_folder = new Granite.Widgets.SourceList.ExpandableItem ("Gnome");
        gnome_folder.icon = new GLib.ThemedIcon ("folder");
        gnome_folder.add (mutter);
        gnome_folder.add (libgit2);

        var all_repositories = new Granite.Widgets.SourceList.ExpandableItem ("Repositories");
        all_repositories.add (elementary_folder);
        all_repositories.add (gnome_folder);
        all_repositories.expand_all ();

        return all_repositories;
    }
}
