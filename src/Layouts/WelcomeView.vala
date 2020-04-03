public class GitTree.WelcomeView : Granite.Widgets.Welcome {
    public GitTree.Window window { construct; }

    public WelcomeView (GitTree.Window main_window) {
        Object (
            window: main_window,
            title: _("Welcome to GitTree"),
            subtitle: _("Select one of the following to get started")
        );
    }
    construct {
        append ("folder-open", _("Open Repo"), _("Open an existing Repo from files"));
        append ("folder-copy", _("Clone Repo"), _("Clone a new Repo from internet"));
        append ("folder-new", _("Init Repo"), _("Initialize a new Git Repo"));
    }
}
