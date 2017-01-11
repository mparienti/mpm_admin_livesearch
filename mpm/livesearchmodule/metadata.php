<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */
$aModule = array(
    'id' => 'livesearchmodule',
    'title' => 'Live Search in Modules',
    'url' => 'https://github.com/mparienti/mpm_livesearch_in_oxid_modules_list',
    'email' => 'michael.parienti@oxid-esales.com',
    'description'  => array(
        'en' => 'Display a search form, to filter modules list',
    ),
    'lang' => 'en',
    'version' => '0.1',
    'author' => 'Michaël Parienti',
    'blocks' => array(
        array('template' => 'module_list.tpl',
              'block' => 'admin_modules_list_table',
              'file' => 'application/views/admin/blocks/live_search_in_modules_list.tpl'),
    ),
);
