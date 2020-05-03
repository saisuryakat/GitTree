using Gee;

public class GitTree.Services.DatabaseService {
    public Gee.List<GitTree.Models.GitRepository> all_repos { get; set; }
    private string get_database_path () {
        return Environment.get_home_dir () + "/.local/share/com.github.saisuryakat.gittree/database.db";
    }

    private void open_database (out Sqlite.Database database) {
        var connection = Sqlite.Database.open (get_database_path (), out database);

        if(connection != Sqlite.OK) {
            print ("Can't open database %d: %s\n", database.errcode (), database.errmsg ());
            Gtk.main_quit ();
        }
    }

    private void init_db () {
        Sqlite.Database db;
        open_database (out db);

        string create_repositories_table_query = """
            CREATE TABLE `repositories`(
                `id`  TEXT  PRIMARY KEY  NOT NULL,
                `name` TEXT NOT NULL,
                `path` TEXT NOT NULL
            );
         """;
        db.exec (create_repositories_table_query);
    }

    public void verify_db () {
        try {
            string path = Environment.get_home_dir () + "/.local/share/com.github.saisuryakat.gittree";
            File tmp = File.new_for_path (path);
            if (tmp.query_file_type (0) != FileType.DIRECTORY) {
                GLib.DirUtils.create_with_parents (path, 0755);
            }

            init_db ();
        } catch (Error e) {
            print ("Error: %s\n", e.message);
        }
    }

    public Gee.List <GitTree.Models.GitRepository> fetch_all_repositories () {
        var all_repositories = new ArrayList<GitTree.Models.GitRepository> ();

        var fetch_query = "SELECT * FROM repositories;";

        Sqlite.Database db;
        open_database (out db);
        string errmsg;

        var query_execution = db.exec (fetch_query, (columns_size, values, column_names) => {
            var repository = new GitTree.Models.GitRepository ();
            repository.id = values[0];
            repository.name = values[1];
            repository.path = values[2];

            all_repositories.add (repository);
            return 0;
        }, out errmsg);

        if (query_execution != Sqlite.OK) {
            print ("Error fetching repositories from db: %s\n", errmsg);
        }
        all_repos = all_repositories;
        return all_repositories;
    }
}
