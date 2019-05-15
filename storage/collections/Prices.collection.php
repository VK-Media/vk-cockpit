<?php
 return array (
  'name' => 'Prices',
  'label' => 'Priser',
  '_id' => 'Prices5ccc517212e13',
  'fields' => 
  array (
    0 => 
    array (
      'name' => 'name',
      'label' => 'Navn',
      'type' => 'text',
      'default' => '',
      'info' => '',
      'group' => 'Indhold',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => true,
      'acl' => 
      array (
      ),
      'required' => true,
    ),
    1 => 
    array (
      'name' => 'teaser',
      'label' => 'Teaser',
      'type' => 'wysiwyg',
      'default' => '',
      'info' => '',
      'group' => 'Indhold',
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
    2 => 
    array (
      'name' => 'description',
      'label' => 'Beskrivelse',
      'type' => 'wysiwyg',
      'default' => '',
      'info' => '',
      'group' => 'Indhold',
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
    3 => 
    array (
      'name' => 'onSale',
      'label' => 'Kampagne',
      'type' => 'boolean',
      'default' => '',
      'info' => '',
      'group' => 'Pris',
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
    4 => 
    array (
      'name' => 'defaultPrice',
      'label' => '',
      'type' => 'text',
      'default' => '',
      'info' => '',
      'group' => 'Pris',
      'localize' => true,
      'options' => 
      array (
      ),
      'width' => '1-1',
      'lst' => true,
      'acl' => 
      array (
      ),
      'required' => true,
    ),
    5 => 
    array (
      'name' => 'salesPrice',
      'label' => 'Tilbudspris',
      'type' => 'text',
      'default' => '',
      'info' => '',
      'group' => 'Pris',
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
      'name' => 'buttonText',
      'label' => 'Knap tekst',
      'type' => 'text',
      'default' => '',
      'info' => '',
      'group' => 'CTA',
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
      'name' => 'buttonLink',
      'label' => 'Knap link',
      'type' => 'collectionlink',
      'default' => '',
      'info' => '',
      'group' => 'CTA',
      'localize' => true,
      'options' => 
      array (
        'link' => 'Pages',
        'display' => 'title',
        'multiple' => false,
        'limit' => false,
      ),
      'width' => '1-1',
      'lst' => false,
      'acl' => 
      array (
      ),
    ),
  ),
  'sortable' => false,
  'in_menu' => false,
  '_created' => 1556894066,
  '_modified' => 1557898492,
  'color' => '#5D9CEC',
  'acl' => 
  array (
    'author' => 
    array (
      'entries_view' => true,
      'entries_edit' => true,
      'entries_create' => true,
      'entries_delete' => true,
    ),
    'public' => 
    array (
      'entries_view' => false,
    ),
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
  'group' => '',
  'icon' => 'tickets.svg',
  'description' => 'Pris objekter',
);