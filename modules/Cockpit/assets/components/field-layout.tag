<field-layout>

    <style>

        .layout-components > div {
            margin-bottom: 5px;
        }

        .field-layout-column-label {
            font-size: .8em;
            font-weight: bold;
        }

        .uk-sortable-placeholder .uk-sortable {
            pointer-events: none;
        }

        .layout-components.empty {
            min-height: 100px;
            border: 1px rgba(0,0,0,.1) solid;
        }

        .layout-components.empty:after {
            font-family: FontAwesome;
            content: "\f1b3";
            position: absolute;
            top: 50%;
            left: 50%;
            font-size: 14px;
            transform: translate3d(-50%, -50%, 0);
            color: rgba(0,0,0,.3);
        }

    </style>


    <div class="uk-sortable layout-components {!items.length && 'empty'}" ref="components" data-uk-sortable="animation:false, group:'field-layout-items'">

        <div class="uk-panel-box uk-panel-card" each="{ item,idx in items }" data-idx="{idx}">

            <div class="uk-flex uk-flex-middle uk-text-small uk-visible-hover">
                <img class="uk-margin-small-right" riot-src="{ parent.components[item.component].icon ? parent.components[item.component].icon : App.base('/assets/app/media/icons/component.svg')}" width="16">
                <div class="uk-text-bold uk-text-truncate uk-flex-item-1">
                    <a class="uk-link-muted" onclick="{ parent.settings }">{ item.name || parent.components[item.component].label || App.Utils.ucfirst(item.component) }</a>
                </div>
                <div class="uk-text-small uk-invisible">
                    <a onclick="{ parent.addComponent }" title="{ App.i18n.get('Add Component') }"><i class="uk-icon-plus"></i></a>
                    <a class="uk-margin-small-left uk-text-danger" onclick="{ parent.remove }"><i class="uk-icon-trash-o"></i></a>
                </div>
            </div>

            <div class="uk-margin" if="{parent.components[item.component].children}">
                <field-layout bind="items[{idx}].children" child="true" components="{ parent.components }" exclude="{ opts.exclude }"></field-layout>
            </div>

            <div class="uk-margin" if="{item.component == 'grid'}">
                <field-layout-grid bind="items[{idx}].columns" components="{ parent.components }" exclude="{ opts.exclude }"></field-layout-grid>
            </div>

        </div>
    </div>

    <div class="uk-margin uk-text-center">
        <a class="uk-text-primary { !opts.child && 'uk-button uk-button-outline uk-button-large'}" onclick="{ addComponent }" title="{ App.i18n.get('Add component') }" data-uk-tooltip="pos:'bottom'"><i class="uk-icon-plus-circle"></i></a>
    </div>

    <div class="uk-modal uk-sortable-nodrag" ref="modalComponents">
        <div class="uk-modal-dialog">
            <h3 class="uk-flex uk-flex-middle">
                <img class="uk-margin-small-right" riot-src="{App.base('/assets/app/media/icons/component.svg')}" width="30">
                { App.i18n.get('Components') }
            </h3>

            <ul class="uk-tab uk-margin-bottom uk-flex uk-flex-center uk-noselect" show="{ App.Utils.count(componentGroups) > 1 }">
                <li class="{ !componentGroup && 'uk-active'}"><a class="uk-text-capitalize" onclick="{ toggleComponentGroup }">{ App.i18n.get('All') }</a></li>
                <li class="{ group==parent.componentGroup && 'uk-active'}" each="{items,group in componentGroups}" show="{ items.length }"><a class="uk-text-capitalize" onclick="{ toggleComponentGroup }">{ App.i18n.get(group) }</a></li>
            </ul>

            <div class="uk-grid uk-grid-match uk-grid-small uk-grid-width-medium-1-4">
                 <div class="uk-grid-margin" each="{component,name in components}" show="{ !componentGroup || (componentGroup == component.group) }">
                    <div class="uk-panel uk-panel-framed uk-text-center">
                        <img riot-src="{ component.icon || App.base('/assets/app/media/icons/component.svg')}" width="30">
                        <p class="uk-text-small">{ component.label || App.Utils.ucfirst(name) }</p>
                        <a class="uk-position-cover" onclick="{ add }"></a>
                    </div>
                </div>
            </div>

            <div class="uk-modal-footer uk-text-right">
                <a class="uk-button uk-button-link uk-button-large uk-modal-close">{ App.i18n.get('Close') }</a>
            </div>
        </div>
    </div>

    <div class="uk-modal uk-sortable-nodrag" ref="modalSettings">
        <div class="uk-modal-dialog { components[settingsComponent.component].dialog=='large' && 'uk-modal-dialog-large' }" if="{settingsComponent}">

            <a class="uk-modal-close uk-close"></a>

            <div class="uk-margin-large-bottom">
                <div class="uk-grid uk-grid-small">
                    <div>
                        <img riot-src="{ components[settingsComponent.component].icon ? components[settingsComponent.component].icon : App.base('/assets/app/media/icons/settings.svg')}" width="30">
                    </div>
                    <div class="uk-flex-item-1">
                        <h3 class="uk-margin-remove">{ components[settingsComponent.component].label || App.Utils.ucfirst(settingsComponent.component) }</h3>
                        <input type="text" class="uk-form-blank uk-width-1-1 uk-text-primary" bind="settingsComponent.name" placeholder="{ App.i18n.get('Name')}" >
                    </div>
                </div>
            </div>

            <ul class="uk-tab uk-margin-bottom uk-flex uk-flex-center">
                <li class="{ !settingsGroup && 'uk-active'}"><a class="uk-text-capitalize" onclick="{ toggleGroup }">{ App.i18n.get('All') }</a></li>
                <li class="{ group==parent.settingsGroup && 'uk-active'}" each="{items,group in settingsGroups}" show="{ items.length }"><a class="uk-text-capitalize" onclick="{ toggleGroup }">{ App.i18n.get(group) }</a></li>
            </ul>

            <div class="uk-grid uk-grid-small uk-grid-match">

                <div class="uk-grid-margin uk-width-medium-{field.width}" each="{field,idx in settingsFields}" show="{!settingsGroup || (settingsGroup == field.group) }" no-reorder>

                    <div class="uk-panel">

                        <label class="uk-text-small uk-text-bold"><i class="uk-icon-pencil-square uk-margin-small-right"></i> { field.label || field.name }</label>

                        <div class="uk-margin-small-top uk-text-small uk-text-muted" show="{field.info}">{ field.info }</div>

                        <div class="uk-margin-small-top">
                            <cp-field type="{field.type || 'text'}" bind="settingsComponent.settings.{field.name}" opts="{ field.options || {} }"></cp-field>
                        </div>
                    </div>

                </div>
            </div>

            <div class="uk-modal-footer uk-text-right">
                <a class="uk-button uk-button-link uk-button-large uk-modal-close">{ App.i18n.get('Close') }</a>
            </div>

        </div>
    </div>

    <script>

        var $this = this;

        riot.util.bind(this);

        this.mode = 'edit';
        this.items = [];
        this.settingsComponent = null;
        this.componentGroups = {'Core':[]};
        this.generalSettingsFields  = [];
        this.contentTypes = {name: "type", label: App.i18n.get('Type'), type: "select", options:{options:{
            "hero": App.i18n.get('Hero'),
            "image-with-text": App.i18n.get('Image with Text'),
            "text-with-image": App.i18n.get('Text with image'),
            "green-bg": App.i18n.get('Green background')
        }}, default: "hero"}

        this.components = {
            "section": {
                "label": App.i18n.get('Section'),
                "group": App.i18n.get('Core'),
                "children":true,
                "fields": [this.contentTypes]
            },

            "grid": {
                "label": App.i18n.get('Grid'),
                "group": App.i18n.get('Core'),
                "fields": [this.contentTypes]
            },

            "text": {
                "label": App.i18n.get('Text'),
                "group": App.i18n.get('Core'),
                "icon": App.base('/assets/app/media/icons/text.svg'),
                "dialog": "large",
                "fields": [
                    {"name": "text", label: App.i18n.get('Text'), "type": "wysiwyg", "default": ""}
                ]
            },

            "heading": {
                "label": App.i18n.get('Heading'),
                "group": App.i18n.get('Core'),
                "icon": App.base('/assets/app/media/icons/heading.svg'),
                "fields": [
                    {"name": "text", label: App.i18n.get('Text'), "type": "text", "default": "Header"},
                    {"name": "tag", label: App.i18n.get('Tag'), "type": "select", "options":{"options":['h1','h2','h3','h4','h5','h6']}, "default": "h1"},
                    {"name": "alignment", label: App.i18n.get('Alignment'), "type": "select", "options":{"options":{
                        "left": App.i18n.get('Left'),
                        "center": App.i18n.get('Center'),
                        "right": App.i18n.get('Right')
                    }}, "default": "Left"}
                ]
            },

            "image": {
                "label": App.i18n.get('Image'),
                "group": App.i18n.get('Core'),
                "icon": App.base('/assets/app/media/icons/photo.svg'),
                "fields": [
                    {"name": "image", label: App.i18n.get('Image'), "type": "image", "default": {}},
                    {"name": "filter", label: App.i18n.get('Filter'), "type": "boolean", "default": false},
                    {"name": "ratio", label: App.i18n.get('Ratio'), "type": "select", "options":{"options":['4:3', '1:1', '16:9', '21:7']}, "default": "16:9"},
                    {"name": "description", label: App.i18n.get('Description'), "type": "text", "default": ""}
                ]
            },

            /*
            "gallery": {
                "label": App.i18n.get('Gallery'),
                "group": App.i18n.get('Core'),
                "icon": App.base('/assets/app/media/icons/gallery.svg'),
                "fields": [
                    {"name": "gallery", label: App.i18n.get('Gallery'), "type": "gallery", "default": []}
                ]
            },
            "divider": {
                "label": App.i18n.get('Divider'),
                "group": App.i18n.get('Core'),
                "icon": App.base('/assets/app/media/icons/divider.svg'),
            },
            */
            
            "button": {
                "label": App.i18n.get('Button'),
                "group": App.i18n.get('Core'),
                "icon": App.base('/assets/app/media/icons/button.svg'),
                "fields": [
                    {"name": "text", label: App.i18n.get('Text'), "type": "text", "default": ""},
                    {"name": "url", label: App.i18n.get('Url'), "type": "text", "default": ""},
                    {"name": "target", label: App.i18n.get('Target'), "type": "select", "options":{"options":{
                        "_blank": App.i18n.get('New tab'),
                        "_top": App.i18n.get('Same tab')
                    }}, "default": "_top"},
                    {"name": "alignment", label: App.i18n.get('Alignment'), "type": "select", "options":{"options":{
                        "left": App.i18n.get('Left'),
                        "center": App.i18n.get('Center'),
                        "right": App.i18n.get('Right')
                    }}, "default": "Left"},
                    {"name": "link", label: App.i18n.get('Link'), "type": "collectionlink", "options": {
                        "link": "Pages",
                        "multiple": false,
                        "display": "fieldName"
                    }},
                    {"name": "download", label: App.i18n.get('Download'), "type": "asset", "options": {}},
                ]
            }
        };

        if (window.CP_LAYOUT_COMPONENTS && App.Utils.isObject(window.CP_LAYOUT_COMPONENTS)) {
            this.components = App.$.extend(true, this.components, window.CP_LAYOUT_COMPONENTS);
        }


        this.on('mount', function() {

            App.trigger('field.layout.components', {components:this.components, opts:opts});

            // exclude components?
            if (Array.isArray(opts.exclude) && opts.exclude.length) {

                opts.exclude.forEach(function(c) {
                    if ($this.components[c]) delete $this.components[c];
                });
            }


            if (opts.components && App.Utils.isObject(opts.components)) {
                this.components = App.$.extend(true, this.components, opts.components);
            }

            Object.keys(this.components).forEach(function(k) {

                $this.components[k].group = $this.components[k].group || 'Misc';

                var g = $this.components[k].group;

                if (!$this.componentGroups[g]) {
                    $this.componentGroups[g] = [];
                }

                $this.componentGroups[g].push(k);
            });

            window.___moved_layout_item = null;

            App.$(this.refs.components).on('start.uk.sortable', function(e, sortable, el, placeholder) {

                if (!el) return;
                e.stopPropagation();
                window.___moved_layout_item = {idx: el._tag.idx, item: el._tag.item, src: $this};
            });

            App.$(this.refs.components).on('change.uk.sortable', function(e, sortable, el, mode) {

                if (!el) return;

                e.stopPropagation();

                var item = window.___moved_layout_item;

                if ($this.refs.components === sortable.element[0]) {

                    switch(mode) {

                        case 'moved':
                            var items = [];

                            App.$($this.refs.components).children().each(function() {
                                items.push(this._tag.item);
                            });

                            $this.$setValue(items);
                            $this.update();

                            break;

                        case 'removed':

                            $this.items.splice(item.idx, 1);
                            $this.$setValue($this.items);
                            break;

                        case 'added':

                            $this.items.splice(el.index(), 0, item.item);
                            $this.$setValue($this.items);
                            el.remove();

                            if (opts.child) {
                                $this.propagateUpdate();
                            }
                            break;
                    }
                }
            });

            UIkit.modal(this.refs.modalSettings, {modal:false}).on('hide.uk.modal', function(e) {

                if (e.target !== $this.refs.modalSettings) {
                    return;
                }

                $this.$setValue($this.items);

                setTimeout(function(){
                    $this.settingsComponent = null;
                    $this.update();

                    if (opts.child) {
                        $this.propagateUpdate();
                    }
                }, 50);
            });

            this.update();
        });

        this.$initBind = function() {
            this.root.$value = this.items;
        };

        this.$updateValue = function(value) {

            if (!Array.isArray(value)) {
                value = [];
            }

            if (JSON.stringify(this.items) != JSON.stringify(value)) {
                this.items = value;
                this.update();
            }

        }.bind(this);

        this.propagateUpdate = function() {

            var n = this;

            while (n.parent) {
                if (n.parent.root.getAttribute('data-is') == 'field-layout') {
                    n.parent.$setValue(n.parent.items);
                }
                n = n.parent;
            }
        }

        addComponent(e) {
            this.componentGroup = null;
            this.refs.modalComponents.afterComponent = e.item && e.item.item ? e.item.idx : false;
            UIkit.modal(this.refs.modalComponents, {modal:false}).show();
        }

        add(e) {

            var item = {
                component: e.item.name,
                settings: { id: '', 'class': '', style: '' }
            };

            var settings = this.components[e.item.name];

            if (Array.isArray(settings.fields)) {

                settings.fields.forEach(function(field) {
                    item.settings[field.name] = field.options && field.options.default || null;
                })
            }

            if (this.components[e.item.name].children) {
                item.children = [];
            }

            if (e.item.name == 'grid') {
                item.columns = [];
            }

            if (App.Utils.isNumber(this.refs.modalComponents.afterComponent)) {
                this.items.splice(this.refs.modalComponents.afterComponent + 1, 0, item);
                this.refs.modalComponents.afterComponent = false;
            } else {
                this.items.push(item);
            }

            this.$setValue(this.items);

            setTimeout(function() {

                UIkit.modal(this.refs.modalComponents).hide();

                if (opts.child) {
                    $this.propagateUpdate();
                }

            }.bind(this));
        }

        remove(e) {
            this.items.splice(e.item.idx, 1);

            if (opts.child) {
                this.parent.update()
            }
        }

        settings(e) {

            var component = e.item.item;

            this.settingsComponent = e.item.item;

            this.settingsFields    = (this.components[component.component].fields || []).concat(this.generalSettingsFields);
            this.settingsFieldsIdx = {};
            this.settingsGroups    = {main:[]};
            this.settingsGroup     = 'main';

            // fill with default values
            this.settingsFields.forEach(function(field){

                $this.settingsFieldsIdx[field.name] = field;

                if (component.settings[field.name] === undefined) {
                    component.settings[field.name] = field.options && field.options.default || null;
                }

                if (field.group && !$this.settingsGroups[field.group]) {
                    $this.settingsGroups[field.group] = [];
                } else if (!field.group) {
                    field.group = 'main';
                }

                $this.settingsGroups[field.group || 'main'].push(field);
            });

            if (!this.settingsGroups[this.settingsGroup].length) {
                this.settingsGroup = Object.keys(this.settingsGroups)[1];
            }

            setTimeout(function() {
                UIkit.modal(this.refs.modalSettings, {modal:false}).show();
            }.bind(this));
        }

        toggleGroup(e) {
            e.preventDefault();
            this.settingsGroup = e.item && e.item.group || false;
        }

        toggleComponentGroup(e) {
            e.preventDefault();
            this.componentGroup = e.item && e.item.group || false;
        }

    </script>

</field-layout>

<field-layout-grid>

    <div class="uk-text-center uk-placeholder" if="{!columns.length}">
        <a class="uk-button uk-button-link" onclick="{ addColumn }">{ App.i18n.get('Add Column') }</a>
    </div>

    <div class="uk-sortable uk-grid uk-grid-match uk-grid-small uk-grid-width-medium-1-{columns.length > 4 ? 1 : columns.length}" show="{columns.length}" ref="columns" data-uk-sortable="animation:false">
        <div class="uk-grid-margin" each="{column,idx in columns}">
            <div class="uk-panel">
                <div class="uk-flex uk-flex-middle uk-text-small uk-visible-hover">
                    <div class="uk-flex-item-1 uk-margin-small-right"><a class="uk-text-muted uk-text-uppercase field-layout-column-label" onclick="{ parent.settings }" title="{ App.i18n.get('Settings') }">{ App.i18n.get('Column') } { (idx+1) }</a></div>
                    <a class="uk-invisible uk-margin-small-right" onclick="{ parent.addColumn }" title="{ App.i18n.get('Add Column') }"><i class="uk-icon-plus"></i></a>
                    <a class="uk-invisible" onclick="{ parent.remove }"><i class="uk-text-danger uk-icon-trash-o"></i></a>
                </div>
                <div class="uk-margin">
                    <field-layout bind="columns[{idx}].children" child="true" components="{ opts.components }" exclude="{ opts.exclude }"></field-layout>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-modal uk-sortable-nodrag" ref="modalSettings">
        <div class="uk-modal-dialog" if="{settingsComponent}">
            <h3 class="uk-flex uk-flex-middle uk-margin-large-bottom">
                <img class="uk-margin-small-right" riot-src="{App.base('/assets/app/media/icons/settings.svg')}" width="30">
                { App.i18n.get('Column') }
            </h3>
            <field-set class="uk-margin" bind="settingsComponent.settings" fields="{fields}"></field-set>

            <div class="uk-modal-footer uk-text-right">
                <a class="uk-button uk-button-link uk-button-large uk-modal-close">{ App.i18n.get('Close') }</a>
            </div>

        </div>
    </div>

    <script>

        var $this = this;

        riot.util.bind(this);

        this.columns = [];
        this.fields  = [
            {name: "id", type: "text" },
            {name: "class", type: "text" },
            {name: "style", type: "code", options: {syntax: "css", height: "100px"}  }
        ];
        this.settingsComponent = null;

        this.$updateValue = function(value) {

            if (!Array.isArray(value)) {
                value = [];
            }

            if (JSON.stringify(this.columns) !== JSON.stringify(value)) {
                this.columns = value;
                this.update();
            }

        }.bind(this);

        this.$initBind = function() {
            this.root.$value = this.columns;
        };

        this.propagateUpdate = function() {

            var n = this;

            while (n.parent) {
                if (n.parent.root.tagName == 'field-layout' || n.parent.root.getAttribute('data-is') == 'field-layout') {
                    n.parent.$setValue(n.parent.items);
                }
                n = n.parent;
            }
        }

        this.on('mount', function() {

            App.$(this.refs.columns).on('change.uk.sortable', function(e, sortable, el, mode) {

                if (!el) return;

                e.stopPropagation();

                if ($this.refs.columns === sortable.element[0]) {

                    var columns = [];

                    App.$($this.refs.columns).children().each(function() {
                        columns.push(this._tag.column);
                    });

                    $this.$setValue(columns);
                    $this.update();

                    $this.propagateUpdate();
                }
            });

            UIkit.modal(this.refs.modalSettings, {modal:false}).on('hide.uk.modal', function(e) {

                if (e.target !== $this.refs.modalSettings) {
                    return;
                }

                $this.$setValue($this.columns);

                setTimeout(function() {
                    $this.settingsComponent = null;
                    $this.update();
                }, 50);
            });


            this.update();
        });

        addColumn() {

            var column = {
                settings: { id: '', 'class': '', style: '' },
                children: []
            };

            this.columns.push(column);
            this.$setValue(this.columns);

            this.propagateUpdate();
        }

        settings(e) {

            this.settingsComponent = e.item.column;

            setTimeout(function() {
                UIkit.modal(this.refs.modalSettings).show();
            }.bind(this));
        }

        remove(e) {
            this.columns.splice(e.item.idx, 1);
        }

    </script>

</field-layout-grid>
