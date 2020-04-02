application_id = meson.project_name()

executable(
    application_id,
    'Main.vala',
    'Application.vala',
    'MainWindow.vala',

    'Layouts/WelcomeView.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite', version: '>= 0.5.1')
    ],
    install: true
)