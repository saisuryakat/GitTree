public class GitTree.Views.RecentsView : Granite.SimpleSettingsPage {
    public RecentsView () {
        Object (
            activatable: false,
            description: "",
            header: "Recents",
            icon_name: "document-open-recent",
            title: "Recent Repositories"
        );
    }

    construct {
    }
}
