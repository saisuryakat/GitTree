public class GitTree.Application : Gtk.Application {
    public static GitTree.Services.DatabaseService db_service { get; set; }

    public Application () {
        Object (
            application_id: "com.github.saisuryakat.gittree",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    static construct {
        db_service = new GitTree.Services.DatabaseService ();
    }

    protected override void activate () {
        db_service.verify_db ();
        db_service.fetch_all_repositories ();

        var window = new GitTree.AppWindow (this);
        add_window (window);
    }
}
