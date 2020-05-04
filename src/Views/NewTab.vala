public class GitTree.Views.NewTab : Granite.Widgets.Tab {

    public NewTab (GitTree.AppWindow app_window, GitTree.Services.DatabaseService db_service) {
        var new_tab_view = new GitTree.Views.NewTabView (app_window, db_service);

        Object (
            label: "Welcome",
            page: new_tab_view
        );
    }
}
