public class GitTree.WelcomeView : Granite.Widgets.Welcome {
    public GitTree.Window window { construct; }

    public WelcomeView (GitTree.Window main_window) {
        Object (
            window: main_window,
            title: "Welcome to GitTree",
            subtitle: "Select one of the following to get started"
        );
    }
    construct {
        append ("folder-open", "Open Repo", "Open an existing Repo from files");
        append ("folder-copy", "Clone Repo", "Clone a new Repo from internet");
        append ("folder-new", "Init Repo", "Initialize a new Git Repo");
    }
}