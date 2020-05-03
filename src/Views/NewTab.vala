public class GitTree.Views.NewTab : Granite.Widgets.Tab {
    public NewTab () {
        var new_tab_view = new GitTree.Views.NewTabView ();
        Object (
            label: "Welcome",
            page: new_tab_view
        );
    }
}
