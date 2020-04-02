public class GitTree.Application : Gtk.Application {
    public Application () {
        Object (
            application_id: "com.github.saisuryakat.gittree",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var window = new GitTree.Window (this);

        add_window (window);
    }
}