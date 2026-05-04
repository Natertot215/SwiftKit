# Triage Part B — toolbars / search / view_fundamentals / view_configuration / view_styles

> Sections view_fundamentals, view_configuration, and view_styles: every leaf is already wired in PageRegistry — zero unwired leaves to triage in those three sections.
> All 34 unwired leaves come from toolbars (26) and search (8 — the searchable family + article pages are already wired).

---

## Implement

| Leaf id | API | Section |
|---|---|---|
| swiftui.toolbars.toolbar(id:content:) | View/toolbar(id:content:) | toolbars |
| swiftui.toolbars.toolbaritem | ToolbarItem | toolbars |
| swiftui.toolbars.toolbaritemgroup | ToolbarItemGroup | toolbars |
| swiftui.toolbars.toolbarspacer | ToolbarSpacer | toolbars |
| swiftui.toolbars.defaulttoolbaritem | DefaultToolbarItem | toolbars |
| swiftui.toolbars.toolbarvisibility(_:for:) | View/toolbarVisibility(_:for:) | toolbars |
| swiftui.toolbars.toolbarbackgroundvisibility(_:for:) | View/toolbarBackgroundVisibility(_:for:) | toolbars |
| swiftui.toolbars.toolbarrole(_:) | View/toolbarRole(_:) | toolbars |
| swiftui.toolbars.toolbarbackground(_:for:) | View/toolbarBackground(_:for:) | toolbars |
| swiftui.toolbars.toolbarcolorscheme(_:for:) | View/toolbarColorScheme(_:for:) | toolbars |
| swiftui.toolbars.toolbartitledisplaymode(_:) | View/toolbarTitleDisplayMode(_:) | toolbars |
| swiftui.toolbars.toolbartitlemenu(content:) | View/toolbarTitleMenu(content:) | toolbars |
| swiftui.toolbars.toolbar(removing:) | View/toolbar(removing:) | toolbars |
| swiftui.search.searchfieldplacement | SearchFieldPlacement | search |
| swiftui.search.searchsuggestions(_:) | View/searchSuggestions(_:) | search |
| swiftui.search.searchsuggestions(_:for:) | View/searchSuggestions(_:for:) | search |
| swiftui.search.searchcompletion(_:) | View/searchCompletion(_:) | search |
| swiftui.search.searchscopes(_:scopes:) | View/searchScopes(_:scopes:) | search |
| swiftui.search.searchscopes(_:activation:_:) | View/searchScopes(_:activation:_:) | search |
| swiftui.search.searchpresentationtoolbarbehavior(_:) | View/searchPresentationToolbarBehavior(_:) | search |
| swiftui.search.findnavigator(ispresented:) | View/findNavigator(isPresented:) | search |
| swiftui.search.finddisabled(_:) | View/findDisabled(_:) | search |
| swiftui.search.replacedisabled(_:) | View/replaceDisabled(_:) | search |

---

## Describe

| Leaf id | API | Section | Reason |
|---|---|---|---|
| swiftui.toolbars.toolbaritemplacement | ToolbarItemPlacement | toolbars | Enum/value type — configures placement, not a renderable view |
| swiftui.toolbars.toolbarcontent | ToolbarContent | toolbars | Protocol — defines toolbar content conformance, not a view |
| swiftui.toolbars.toolbarcontentbuilder | ToolbarContentBuilder | toolbars | Result builder — cannot be rendered directly |
| swiftui.toolbars.customizabletoolbarcontent | CustomizableToolbarContent | toolbars | Protocol — conformance type, not a standalone renderable view |
| swiftui.toolbars.toolbarcustomizationbehavior | ToolbarCustomizationBehavior | toolbars | Enum/value type — option passed to customizable toolbar API |
| swiftui.toolbars.toolbarcustomizationoptions | ToolbarCustomizationOptions | toolbars | OptionSet — configuration value, not a renderable view |
| swiftui.toolbars.searchtoolbarbehavior | SearchToolbarBehavior | toolbars | Enum/value type — used only as parameter to searchable placement |
| swiftui.toolbars.toolbarplacement | ToolbarPlacement | toolbars | Struct/value type — placement descriptor, not a view |
| swiftui.toolbars.contenttoolbarplacement | ContentToolbarPlacement | toolbars | Struct/value type — placement descriptor, not a view |
| swiftui.toolbars.toolbarrole | ToolbarRole | toolbars | Enum — value type, not directly renderable |
| swiftui.toolbars.toolbarforegroundstyle(_:for:) | View/toolbarForegroundStyle(_:for:) | toolbars | watchOS 9.0 only — macOS unavailable |
| swiftui.toolbars.toolbarlabelstyle | EnvironmentValues/toolbarLabelStyle | toolbars | Environment value key — not directly renderable |
| swiftui.toolbars.toolbarlabelstyle.type | ToolbarLabelStyle | toolbars | Protocol — style conformance type, not directly renderable |
| swiftui.toolbars.spacersizing | SpacerSizing | toolbars | Enum — sizing option for ToolbarSpacer, not a standalone view |
| swiftui.toolbars.toolbartitledisplaymode | ToolbarTitleDisplayMode | toolbars | Enum — value type passed to modifier, not a view |
| swiftui.toolbars.toolbartitlemenu | ToolbarTitleMenu | toolbars | Toolbar content type — only valid as toolbar content, not a standalone view |
| swiftui.toolbars.ornament(visibility:attachmentanchor:contentalignment:ornament:) | View/ornament(visibility:attachmentAnchor:contentAlignment:ornament:) | toolbars | visionOS 1.0 only — macOS unavailable |
| swiftui.toolbars.ornamentattachmentanchor | OrnamentAttachmentAnchor | toolbars | visionOS 1.0 only — macOS unavailable |
| swiftui.toolbars.toolbardefaultitemkind | ToolbarDefaultItemKind | toolbars | Enum — identifies built-in toolbar items, not a renderable view |
| swiftui.search.issearching | EnvironmentValues/isSearching | search | Environment value — Bool read from environment, not renderable |
| swiftui.search.dismisssearch | EnvironmentValues/dismissSearch | search | Environment value (action) — not directly renderable |
| swiftui.search.dismisssearchaction | DismissSearchAction | search | Action struct — invocable value type, not a view |
| swiftui.search.searchsuggestionsplacement | SearchSuggestionsPlacement | search | Enum/value type — placement option passed to modifier |
| swiftui.search.searchscopeactivation | SearchScopeActivation | search | Enum — controls activation mode, not a view |
| swiftui.search.searchpresentationtoolbarbehavior | SearchPresentationToolbarBehavior | search | Struct/value type — passed as modifier parameter, not renderable |
| swiftui.search.findcontext | FindContext | search | Environment struct for custom text editor implementors — no standalone renderable representation |
