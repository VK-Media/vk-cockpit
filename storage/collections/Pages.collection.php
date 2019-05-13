<?php
 return array (
  'name' => 'Pages',
  'label' => 'Sider',
  '_id' => 'Pages5ccc381b000c3',
  'fields' => 
  array (
    0 => 
    array (
      'name' => 'published',
      'label' => 'Publiceret',
      'type' => 'boolean',
      'default' => '',
      'info' => '',
      'localize' => true,
      'options' => 
      array (
        'default' => false,
        'label' => false,
      ),
      'width' => '1-1',
      'lst' => true,
      'group' => 'Konfiguration',
    ),
    1 => 
    array (
      'name' => 'title',
      'label' => 'Titel',
      'type' => 'text',
      'default' => '',
      'info' => '',
      'localize' => true,
      'options' => 
      array (
        'slug' => true,
      ),
      'width' => '1-1',
      'lst' => true,
      'required' => true,
      'group' => 'Side',
    ),
    2 => 
    array (
      'name' => 'content',
      'label' => 'Indhold',
      'type' => 'layout',
      'default' => '',
      'info' => 'Indholds elementer på siden',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => true,
      'group' => 'Indhold',
    ),
    3 => 
    array (
      'name' => 'tags',
      'label' => 'Tags',
      'type' => 'tags',
      'default' => '',
      'info' => '',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => false,
      'group' => 'Side',
    ),
    4 => 
    array (
      'name' => 'showInMenu',
      'label' => 'Vis i menu',
      'type' => 'boolean',
      'default' => '',
      'info' => 'Bestem om siden skal vises i menuen',
      'group' => 'Konfiguration',
      'localize' => true,
      'options' => 
      array (
        'default' => false,
        'label' => false,
      ),
      'width' => '1-1',
      'lst' => false,
      'acl' => 
      array (
      ),
    ),
    5 => 
    array (
      'name' => 'landingpage',
      'label' => 'Forside',
      'type' => 'boolean',
      'default' => '',
      'info' => '',
      'group' => 'Konfiguration',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => true,
      'acl' => 
      array (
      ),
    ),
    6 => 
    array (
      'name' => 'seoTitle',
      'label' => 'SEO Titel',
      'type' => 'text',
      'default' => '',
      'info' => '',
      'group' => 'SEO',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => false,
      'acl' => 
      array (
      ),
    ),
    7 => 
    array (
      'name' => 'seoDescription',
      'label' => 'SEO Beskrivelse',
      'type' => 'textarea',
      'default' => '',
      'info' => '',
      'group' => 'SEO',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => false,
      'acl' => 
      array (
      ),
    ),
  ),
  'sortable' => false,
  'in_menu' => true,
  '_created' => 1556887579,
  '_modified' => 1557726906,
  'color' => '#A0D468',
  'acl' => 
  array (
  ),
  'rules' => 
  array (
    'create' => 
    array (
      'enabled' => false,
    ),
    'read' => 
    array (
      'enabled' => false,
    ),
    'update' => 
    array (
      'enabled' => false,
    ),
    'delete' => 
    array (
      'enabled' => false,
    ),
  ),
  'icon' => 'form-editor.svg',
  'description' => 'Sider',
  'contentpreview' => 
  array (
    'enabled' => false,
  ),
);