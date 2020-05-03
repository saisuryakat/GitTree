application_id = meson.project_name()

executable(
    application_id,
    'Main.vala',
    'Application.vala',
    'MainWindow.vala',

    'Views/WelcomeView.vala',
    'Views/HeaderBarView.vala',
    'Views/WelcomeView.vala',
    'Views/HostingServicesView.vala',
    'Views/RecentsView.vala',
    'Views/RepositoriesView.vala',
    'Views/NewTabView.vala',
    'Views/NewTab.vala',

    'Models/GitRepository.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('sqlite3'),
        dependency('gee-0.8'),
    ],
    install: true
)
