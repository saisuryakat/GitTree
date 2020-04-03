project('com.github.saisuryakat.gittree', 'vala', 'c', version: '0.0.1')

application_id = meson.project_name()

#Import Internationalization module
i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (application_id), language: 'c')

# Translate and Install .desktop file for Applications Menu
i18n.merge_file(
    input: join_paths('data', application_id + '.desktop.in'),
    output: application_id + '.desktop',
    po_dir: join_paths(meson.source_root(), 'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications')
)

#Install .appdata.xml file for AppCenter
i18n.merge_file(
    input: join_paths('data', application_id + '.appdata.xml.in'),
    output: application_id + '.appdata.xml',
    po_dir: join_paths(meson.source_root(), 'po'),
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)

subdir('src')
subdir('po')
