# Triage Part E — input_events / drag_and_drop / accessibility / appkit_integration / technology_specific

## Implement

| Leaf id | API | Section |
|---|---|---|
| swiftui.accessible-appearance.accessibilityignoresinvertcolors(_:) | View/accessibilityIgnoresInvertColors(_:) | accessible_appearance |
| swiftui.accessible-appearance.accessibilityshowslargecontentviewer() | View/accessibilityShowsLargeContentViewer() | accessible_appearance |
| swiftui.accessible-appearance.accessibilityshowslargecontentviewer(_:) | View/accessibilityShowsLargeContentViewer(_:) | accessible_appearance |
| swiftui.accessible-appearance.legibilityweight | LegibilityWeight | accessible_appearance |
| swiftui.accessible-controls.accessibilityadjustableaction(_:) | View/accessibilityAdjustableAction(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityadjustmentdirection | AccessibilityAdjustmentDirection | accessible_controls |
| swiftui.accessible-controls.accessibilityaction(_:_:) | View/accessibilityAction(_:_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityaction(_:intent:) | View/accessibilityAction(_:intent:) | accessible_controls |
| swiftui.accessible-controls.accessibilityaction(action:label:) | View/accessibilityAction(action:label:) | accessible_controls |
| swiftui.accessible-controls.accessibilityaction(intent:label:) | View/accessibilityAction(intent:label:) | accessible_controls |
| swiftui.accessible-controls.accessibilityaction(named:_:) | View/accessibilityAction(named:_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityaction(named:intent:) | View/accessibilityAction(named:intent:) | accessible_controls |
| swiftui.accessible-controls.accessibilityactioncategory | AccessibilityActionCategory | accessible_controls |
| swiftui.accessible-controls.accessibilityactionkind | AccessibilityActionKind | accessible_controls |
| swiftui.accessible-controls.accessibilityactions(_:) | View/accessibilityActions(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityactions(category:_:) | View/accessibilityActions(category:_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityactivationpoint(_:) | View/accessibilityActivationPoint(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityactivationpoint(_:isenabled:) | View/accessibilityActivationPoint(_:isEnabled:) | accessible_controls |
| swiftui.accessible-controls.accessibilitydirecttouch(_:options:) | View/accessibilityDirectTouch(_:options:) | accessible_controls |
| swiftui.accessible-controls.accessibilitydirecttouchoptions | AccessibilityDirectTouchOptions | accessible_controls |
| swiftui.accessible-controls.accessibilitydragpoint(_:description:) | View/accessibilityDragPoint(_:description:) | accessible_controls |
| swiftui.accessible-controls.accessibilitydragpoint(_:description:isenabled:) | View/accessibilityDragPoint(_:description:isEnabled:) | accessible_controls |
| swiftui.accessible-controls.accessibilitydroppoint(_:description:) | View/accessibilityDropPoint(_:description:) | accessible_controls |
| swiftui.accessible-controls.accessibilitydroppoint(_:description:isenabled:) | View/accessibilityDropPoint(_:description:isEnabled:) | accessible_controls |
| swiftui.accessible-controls.accessibilityfocused(_:) | View/accessibilityFocused(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityfocused(_:equals:) | View/accessibilityFocused(_:equals:) | accessible_controls |
| swiftui.accessible-controls.accessibilityfocusstate | AccessibilityFocusState | accessible_controls |
| swiftui.accessible-controls.accessibilityrespondstouserinteraction(_:) | View/accessibilityRespondsToUserInteraction(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityrespondstouserinteraction(_:isenabled:) | View/accessibilityRespondsToUserInteraction(_:isEnabled:) | accessible_controls |
| swiftui.accessible-controls.accessibilityscrollaction(_:) | View/accessibilityScrollAction(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityzoomaction(_:) | View/accessibilityZoomAction(_:) | accessible_controls |
| swiftui.accessible-controls.accessibilityzoomgestureaction | AccessibilityZoomGestureAction | accessible_controls |
| swiftui.accessible-descriptions.accessibilitychartdescriptor(_:) | View/accessibilityChartDescriptor(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitycustomcontent(_:_:importance:) | View/accessibilityCustomContent(_:_:importance:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitycustomcontentkey | AccessibilityCustomContentKey | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityaddtraits(_:) | View/accessibilityAddTraits(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityheading(_:) | View/accessibilityHeading(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityheadinglevel | AccessibilityHeadingLevel | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityhint(_:) | View/accessibilityHint(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityhint(_:isenabled:) | View/accessibilityHint(_:isEnabled:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityinputlabels(_:) | View/accessibilityInputLabels(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityinputlabels(_:isenabled:) | View/accessibilityInputLabels(_:isEnabled:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitylabel(_:isenabled:) | View/accessibilityLabel(_:isEnabled:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitylabel(content:) | View/accessibilityLabel(content:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitylabeledpair(role:id:in:) | View/accessibilityLabeledPair(role:id:in:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitylabeledpairrole | AccessibilityLabeledPairRole | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityremovetraits(_:) | View/accessibilityRemoveTraits(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitytextcontenttype | AccessibilityTextContentType | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitytextcontenttype(_:) | View/accessibilityTextContentType(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilitytraits | AccessibilityTraits | accessible_descriptions |
| swiftui.accessible-descriptions.accessibilityvalue(_:isenabled:) | View/accessibilityValue(_:isEnabled:) | accessible_descriptions |
| swiftui.accessible-descriptions.axchartdescriptorrepresentable | AXChartDescriptorRepresentable | accessible_descriptions |
| swiftui.accessible-descriptions.speechadjustedpitch(_:) | View/speechAdjustedPitch(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.speechalwaysincludespunctuation(_:) | View/speechAlwaysIncludesPunctuation(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.speechannouncementsqueued(_:) | View/speechAnnouncementsQueued(_:) | accessible_descriptions |
| swiftui.accessible-descriptions.speechspellsoutcharacters(_:) | View/speechSpellsOutCharacters(_:) | accessible_descriptions |
| swiftui.accessible-navigation.accessibilitylinkedgroup(id:in:) | View/accessibilityLinkedGroup(id:in:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotor(_:entries:) | View/accessibilityRotor(_:entries:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotor(_:entries:entryid:entrylabel:) | View/accessibilityRotor(_:entries:entryID:entryLabel:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotor(_:entries:entrylabel:) | View/accessibilityRotor(_:entries:entryLabel:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotor(_:textranges:) | View/accessibilityRotor(_:textRanges:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotorcontent | AccessibilityRotorContent | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotorcontentbuilder | AccessibilityRotorContentBuilder | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotorentry | AccessibilityRotorEntry | accessible_navigation |
| swiftui.accessible-navigation.accessibilityrotorentry(id:in:) | View/accessibilityRotorEntry(id:in:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilitysortpriority(_:) | View/accessibilitySortPriority(_:) | accessible_navigation |
| swiftui.accessible-navigation.accessibilitysystemrotor | AccessibilitySystemRotor | accessible_navigation |
| swiftui.appkit-integration.nsgesturerecognizerrepresentable | NSGestureRecognizerRepresentable | appkit_integration |
| swiftui.appkit-integration.nsgesturerecognizerrepresentablecontext | NSGestureRecognizerRepresentableContext | appkit_integration |
| swiftui.appkit-integration.nsgesturerecognizerrepresentablecoordinatespaceconverter | NSGestureRecognizerRepresentableCoordinateSpaceConverter | appkit_integration |
| swiftui.appkit-integration.nshostingcontroller | NSHostingController | appkit_integration |
| swiftui.appkit-integration.nshostingmenu | NSHostingMenu | appkit_integration |
| swiftui.appkit-integration.nshostingscenebridgingoptions | NSHostingSceneBridgingOptions | appkit_integration |
| swiftui.appkit-integration.nshostingscenerepresentation | NSHostingSceneRepresentation | appkit_integration |
| swiftui.appkit-integration.nshostingsizingoptions | NSHostingSizingOptions | appkit_integration |
| swiftui.appkit-integration.nshostingview | NSHostingView | appkit_integration |
| swiftui.drag-and-drop.dragconfiguration | DragConfiguration | drag_and_drop |
| swiftui.drag-and-drop.draggable(_:) | View/draggable(_:) | drag_and_drop |
| swiftui.drag-and-drop.draggable(_:preview:) | View/draggable(_:preview:) | drag_and_drop |
| swiftui.drag-and-drop.dragdroppreviewsformation | DragDropPreviewsFormation | drag_and_drop |
| swiftui.drag-and-drop.dragsession | DragSession | drag_and_drop |
| swiftui.drag-and-drop.dropconfiguration | DropConfiguration | drag_and_drop |
| swiftui.drag-and-drop.dropdelegate | DropDelegate | drag_and_drop |
| swiftui.drag-and-drop.dropinfo | DropInfo | drag_and_drop |
| swiftui.drag-and-drop.dropdestination(for:action:istargeted:) | View/dropDestination(for:action:isTargeted:) | drag_and_drop |
| swiftui.drag-and-drop.dropoperation | DropOperation | drag_and_drop |
| swiftui.drag-and-drop.dropproposal | DropProposal | drag_and_drop |
| swiftui.drag-and-drop.dropsession | DropSession | drag_and_drop |
| swiftui.drag-and-drop.itemprovider(_:) | View/itemProvider(_:) | drag_and_drop |
| swiftui.drag-and-drop.ondrag(_:) | View/onDrag(_:) | drag_and_drop |
| swiftui.drag-and-drop.ondrag(_:preview:) | View/onDrag(_:preview:) | drag_and_drop |
| swiftui.drag-and-drop.ondrop(of:delegate:) | View/onDrop(of:delegate:) | drag_and_drop |
| swiftui.drag-and-drop.ondrop(of:istargeted:perform:) | View/onDrop(of:isTargeted:perform:) | drag_and_drop |
| swiftui.drag-and-drop.springloadingbehavior | SpringLoadingBehavior | drag_and_drop |
| swiftui.drag-and-drop.springloadingbehavior(_:) | View/springLoadingBehavior(_:) | drag_and_drop |
| swiftui.input-events.contentshape(_:_:eofill:) | View/contentShape(_:_:eoFill:) | input_events |
| swiftui.input-events.contentshape(_:eofill:) | View/contentShape(_:eoFill:) | input_events |
| swiftui.input-events.contentshapekinds | ContentShapeKinds | input_events |
| swiftui.input-events.eventmodifiers | EventModifiers | input_events |
| swiftui.input-events.keyboardshortcut | KeyboardShortcut | input_events |
| swiftui.input-events.keyboardshortcut(_:) | View/keyboardShortcut(_:) | input_events |
| swiftui.input-events.keyboardshortcut(_:modifiers:) | View/keyboardShortcut(_:modifiers:) | input_events |
| swiftui.input-events.keyboardshortcut(_:modifiers:localization:) | View/keyboardShortcut(_:modifiers:localization:) | input_events |
| swiftui.input-events.keyequivalent | KeyEquivalent | input_events |
| swiftui.input-events.keypress | KeyPress | input_events |
| swiftui.input-events.modifierkeyalternate(_:_:) | View/modifierKeyAlternate(_:_:) | input_events |
| swiftui.input-events.movecommanddirection | MoveCommandDirection | input_events |
| swiftui.input-events.oncontinuoushover(coordinatespace:perform:) | View/onContinuousHover(coordinateSpace:perform:) | input_events |
| swiftui.input-events.oncommand(_:perform:) | View/onCommand(_:perform:) | input_events |
| swiftui.input-events.ondeletecommand(perform:) | View/onDeleteCommand(perform:) | input_events |
| swiftui.input-events.onexitcommand(perform:) | View/onExitCommand(perform:) | input_events |
| swiftui.input-events.onhover(perform:) | View/onHover(perform:) | input_events |
| swiftui.input-events.onkeypress(_:action:) | View/onKeyPress(_:action:) | input_events |
| swiftui.input-events.onkeypress(_:phases:action:) | View/onKeyPress(_:phases:action:) | input_events |
| swiftui.input-events.onkeypress(characters:phases:action:) | View/onKeyPress(characters:phases:action:) | input_events |
| swiftui.input-events.onkeypress(keys:phases:action:) | View/onKeyPress(keys:phases:action:) | input_events |
| swiftui.input-events.onkeypress(phases:action:) | View/onKeyPress(phases:action:) | input_events |
| swiftui.input-events.onmovecommand(perform:) | View/onMoveCommand(perform:) | input_events |
| swiftui.input-events.onmodifierkeyschanged(mask:initial:_:) | View/onModifierKeysChanged(mask:initial:_:) | input_events |
| swiftui.input-events.onsubmit(of:_:) | View/onSubmit(of:_:) | input_events |
| swiftui.input-events.pointerstyle(_:) | View/pointerStyle(_:) | input_events |
| swiftui.input-events.pointerstyle | PointerStyle | input_events |
| swiftui.input-events.pointervisibility(_:) | View/pointerVisibility(_:) | input_events |
| swiftui.input-events.submitlabel | SubmitLabel | input_events |
| swiftui.input-events.submitlabel(_:) | View/submitLabel(_:) | input_events |
| swiftui.input-events.submitscope(_:) | View/submitScope(_:) | input_events |
| swiftui.input-events.submittriggers | SubmitTriggers | input_events |
| swiftui.input-events.touchbar | TouchBar | input_events |
| swiftui.input-events.touchbar(_:) | View/touchBar(_:) | input_events |
| swiftui.input-events.touchbar(content:) | View/touchBar(content:) | input_events |
| swiftui.input-events.touchbarcustomizationlabel(_:) | View/touchBarCustomizationLabel(_:) | input_events |
| swiftui.input-events.touchbaritempresence | TouchBarItemPresence | input_events |
| swiftui.input-events.touchbaritempresence(_:) | View/touchBarItemPresence(_:) | input_events |
| swiftui.input-events.touchbaritemprincipal(_:) | View/touchBarItemPrincipal(_:) | input_events |
| swiftui.input-events.hoverphase | HoverPhase | input_events |
| swiftui.technology-specific-views.currententitlementtask(for:priority:action:) | View/currentEntitlementTask(for:priority:action:) | technology_specific_views |
| swiftui.technology-specific-views.healthdataaccessrequest(store:objecttype:predicate:trigger:completion:) | View/healthDataAccessRequest(store:objectType:predicate:trigger:completion:) | technology_specific_views |
| swiftui.technology-specific-views.healthdataaccessrequest(store:readtypes:trigger:completion:) | View/healthDataAccessRequest(store:readTypes:trigger:completion:) | technology_specific_views |
| swiftui.technology-specific-views.healthdataaccessrequest(store:sharetypes:readtypes:trigger:completion:) | View/healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:) | technology_specific_views |
| swiftui.technology-specific-views.inapppurchaseoptions(_:) | View/inAppPurchaseOptions(_:) | technology_specific_views |
| swiftui.technology-specific-views.mapcamerakeyframeanimator(trigger:keyframes:) | View/mapCameraKeyframeAnimator(trigger:keyframes:) | technology_specific_views |
| swiftui.technology-specific-views.mapcontrols(_:) | View/mapControls(_:) | technology_specific_views |
| swiftui.technology-specific-views.mapcontrolvisibility(_:) | View/mapControlVisibility(_:) | technology_specific_views |
| swiftui.technology-specific-views.mapitemdetailpopover(ispresented:item:displaysmap:attachmentanchor:) | View/mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:) | technology_specific_views |
| swiftui.technology-specific-views.mapitemdetailpopover(ispresented:item:displaysmap:attachmentanchor:arrowedge:) | View/mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:) | technology_specific_views |
| swiftui.technology-specific-views.mapitemdetailpopover(item:displaysmap:attachmentanchor:) | View/mapItemDetailPopover(item:displaysMap:attachmentAnchor:) | technology_specific_views |
| swiftui.technology-specific-views.mapitemdetailpopover(item:displaysmap:attachmentanchor:arrowedge:) | View/mapItemDetailPopover(item:displaysMap:attachmentAnchor:arrowEdge:) | technology_specific_views |
| swiftui.technology-specific-views.mapitemdetailsheet(ispresented:item:displaysmap:) | View/mapItemDetailSheet(isPresented:item:displaysMap:) | technology_specific_views |
| swiftui.technology-specific-views.mapitemdetailsheet(item:displaysmap:) | View/mapItemDetailSheet(item:displaysMap:) | technology_specific_views |
| swiftui.technology-specific-views.mapscope(_:) | View/mapScope(_:) | technology_specific_views |
| swiftui.technology-specific-views.mapstyle(_:) | View/mapStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.musicsubscriptionoffer(ispresented:options:onloadcompletion:) | View/musicSubscriptionOffer(isPresented:options:onLoadCompletion:) | technology_specific_views |
| swiftui.technology-specific-views.onapplepaycouponcodechange(perform:) | View/onApplePayCouponCodeChange(perform:) | technology_specific_views |
| swiftui.technology-specific-views.onapplepaypaymentmethodchange(perform:) | View/onApplePayPaymentMethodChange(perform:) | technology_specific_views |
| swiftui.technology-specific-views.onapplepayshippingcontactchange(perform:) | View/onApplePayShippingContactChange(perform:) | technology_specific_views |
| swiftui.technology-specific-views.onapplepayshippingmethodchange(perform:) | View/onApplePayShippingMethodChange(perform:) | technology_specific_views |
| swiftui.technology-specific-views.onmapcamerachange(frequency:_:) | View/onMapCameraChange(frequency:_:) | technology_specific_views |
| swiftui.technology-specific-views.oninapppurchasecompletion(perform:) | View/onInAppPurchaseCompletion(perform:) | technology_specific_views |
| swiftui.technology-specific-views.oninapppurchasestart(perform:) | View/onInAppPurchaseStart(perform:) | technology_specific_views |
| swiftui.technology-specific-views.paywithapplepaybuttonstyle(_:) | View/payWithApplePayButtonStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.photospicker(ispresented:selection:matching:preferreditemencoding:) | View/photosPicker(isPresented:selection:matching:preferredItemEncoding:) | technology_specific_views |
| swiftui.technology-specific-views.photospicker(ispresented:selection:matching:preferreditemencoding:photolibrary:) | View/photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:) | technology_specific_views |
| swiftui.technology-specific-views.photospicker(ispresented:selection:maxselectioncount:selectionbehavior:matching:preferreditemencoding:) | View/photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:) | technology_specific_views |
| swiftui.technology-specific-views.photospicker(ispresented:selection:maxselectioncount:selectionbehavior:matching:preferreditemencoding:photolibrary:) | View/photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:) | technology_specific_views |
| swiftui.technology-specific-views.photospickeraccessoryvisibility(_:edges:) | View/photosPickerAccessoryVisibility(_:edges:) | technology_specific_views |
| swiftui.technology-specific-views.photospickerdisabledcapabilities(_:) | View/photosPickerDisabledCapabilities(_:) | technology_specific_views |
| swiftui.technology-specific-views.photospickerstyle(_:) | View/photosPickerStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.popovertip(_:arrowedge:action:) | View/popoverTip(_:arrowEdge:action:) | technology_specific_views |
| swiftui.technology-specific-views.preferredsubscriptionoffer(_:) | View/preferredSubscriptionOffer(_:) | technology_specific_views |
| swiftui.technology-specific-views.producticonborder() | View/productIconBorder() | technology_specific_views |
| swiftui.technology-specific-views.productdescription(_:) | View/productDescription(_:) | technology_specific_views |
| swiftui.technology-specific-views.productviewstyle(_:) | View/productViewStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.quicklookpreview(_:) | View/quickLookPreview(_:) | technology_specific_views |
| swiftui.technology-specific-views.quicklookpreview(_:in:) | View/quickLookPreview(_:in:) | technology_specific_views |
| swiftui.technology-specific-views.realityviewcameracontrols(_:) | View/realityViewCameraControls(_:) | technology_specific_views |
| swiftui.technology-specific-views.refundrequestsheet(for:ispresented:ondismiss:) | View/refundRequestSheet(for:isPresented:onDismiss:) | technology_specific_views |
| swiftui.technology-specific-views.storebutton(_:for:) | View/storeButton(_:for:) | technology_specific_views |
| swiftui.technology-specific-views.storeproducttask(for:priority:action:) | View/storeProductTask(for:priority:action:) | technology_specific_views |
| swiftui.technology-specific-views.storeproductstask(for:priority:action:) | View/storeProductsTask(for:priority:action:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionpromotionaloffer(offer:signature:) | View/subscriptionPromotionalOffer(offer:signature:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstatustask(for:priority:action:) | View/subscriptionStatusTask(for:priority:action:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorebuttonlabel(_:) | View/subscriptionStoreButtonLabel(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorecontrolbackground(_:) | View/subscriptionStoreControlBackground(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorecontrolicon(icon:) | View/subscriptionStoreControlIcon(icon:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorecontrolstyle(_:) | View/subscriptionStoreControlStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorecontrolstyle(_:placement:) | View/subscriptionStoreControlStyle(_:placement:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorepickeritembackground(_:) | View/subscriptionStorePickerItemBackground(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorepickeritembackground(_:in:) | View/subscriptionStorePickerItemBackground(_:in:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorepolicydestination(for:destination:) | View/subscriptionStorePolicyDestination(for:destination:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorepolicydestination(url:for:) | View/subscriptionStorePolicyDestination(url:for:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorepolicyforegroundstyle(_:) | View/subscriptionStorePolicyForegroundStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorepolicyforegroundstyle(_:_:) | View/subscriptionStorePolicyForegroundStyle(_:_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstorebuttonlabel(_:) | View/subscriptionStoreButtonLabel(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstoresigninaction(_:) | View/subscriptionStoreSignInAction(_:) | technology_specific_views |
| swiftui.technology-specific-views.subscriptionstoreoptiongroupstyle(_:) | View/subscriptionStoreOptionGroupStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.tipbackground(_:) | View/tipBackground(_:) | technology_specific_views |
| swiftui.technology-specific-views.tipcornerradius(_:antialiased:) | View/tipCornerRadius(_:antialiased:) | technology_specific_views |
| swiftui.technology-specific-views.tipimagesize(_:) | View/tipImageSize(_:) | technology_specific_views |
| swiftui.technology-specific-views.tipimagestyle(_:) | View/tipImageStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.tipimagestyle(_:_:) | View/tipImageStyle(_:_:) | technology_specific_views |
| swiftui.technology-specific-views.tipimagestyle(_:_:_:) | View/tipImageStyle(_:_:_:) | technology_specific_views |
| swiftui.technology-specific-views.tipviewstyle(_:) | View/tipViewStyle(_:) | technology_specific_views |
| swiftui.technology-specific-views.translationpresentation(ispresented:text:attachmentanchor:arrowedge:replacementaction:) | View/translationPresentation(isPresented:text:attachmentAnchor:arrowEdge:replacementAction:) | technology_specific_views |
| swiftui.technology-specific-views.translationtask(_:action:) | View/translationTask(_:action:) | technology_specific_views |
| swiftui.technology-specific-views.translationtask(source:target:action:) | View/translationTask(source:target:action:) | technology_specific_views |
| swiftui.technology-specific-views.translationtask(source:target:preferredstrategy:action:) | View/translationTask(source:target:preferredStrategy:action:) | technology_specific_views |
| swiftui.technology-specific-views.webviewbackforwardnavigationgestures(_:) | View/webViewBackForwardNavigationGestures(_:) | technology_specific_views |
| swiftui.technology-specific-views.webviewcontentbackground(_:) | View/webViewContentBackground(_:) | technology_specific_views |
| swiftui.technology-specific-views.webviewcontextmenu(menu:) | View/webViewContextMenu(menu:) | technology_specific_views |
| swiftui.technology-specific-views.webviewelementfullscreenbehavior(_:) | View/webViewElementFullscreenBehavior(_:) | technology_specific_views |
| swiftui.technology-specific-views.webviewlinkpreviews(_:) | View/webViewLinkPreviews(_:) | technology_specific_views |
| swiftui.technology-specific-views.webviewmagnificationgestures(_:) | View/webViewMagnificationGestures(_:) | technology_specific_views |
| swiftui.technology-specific-views.webviewonscrollgeometrychange(for:of:action:) | View/webViewOnScrollGeometryChange(for:of:action:) | technology_specific_views |
| swiftui.technology-specific-views.webviewscrollinputbehavior(_:for:) | View/webViewScrollInputBehavior(_:for:) | technology_specific_views |
| swiftui.technology-specific-views.webviewscrollposition(_:) | View/webViewScrollPosition(_:) | technology_specific_views |
| swiftui.technology-specific-views.webviewtextselection(_:) | View/webViewTextSelection(_:) | technology_specific_views |
| swiftui.technology-specific-views.workoutpreview(_:ispresented:) | View/workoutPreview(_:isPresented:) | technology_specific_views |

## Describe

| Leaf id | API | Section | Reason |
|---|---|---|---|
| swiftui.accessible-appearance.assistiveaccess | AssistiveAccess | accessible_appearance | Scene-level type (iOS/iPadOS Assistive Access scene, no-op on macOS per docs) |
| swiftui.accessible-controls.accessibilityquickaction(style:content:) | View/accessibilityQuickAction(style:content:) | accessible_controls | watchOS-only (availability: watchOS 9.0) |
| swiftui.accessible-controls.accessibilityquickaction(style:isactive:content:) | View/accessibilityQuickAction(style:isActive:content:) | accessible_controls | watchOS-only (availability: watchOS 9.0) |
| swiftui.accessible-controls.accessibilityquickactionstyle | AccessibilityQuickActionStyle | accessible_controls | watchOS-only (availability: watchOS 9.0) |
| swiftui.appkit-integration.unifying-your-app-s-animations | Unifying your app's animations | appkit_integration | Article/guide — no renderable API |
| swiftui.drag-and-drop.adopting-drag-and-drop-using-swiftui | Adopting drag and drop using SwiftUI | drag_and_drop | Article/guide — no renderable API |
| swiftui.drag-and-drop.making-a-view-into-a-drag-source | Making a view into a drag source | drag_and_drop | Article/guide — no renderable API |
| swiftui.input-events.contenthovereffect | ContentHoverEffect | input_events | visionOS-only (visionOS 26.0) |
| swiftui.input-events.customhovereffect | CustomHoverEffect | input_events | iOS/visionOS-only (no macOS) |
| swiftui.input-events.defaulthovereffect(_:) | View/defaultHoverEffect(_:) | input_events | iOS/visionOS-only (no macOS) |
| swiftui.input-events.digitalcrownaccessory(_:) | View/digitalCrownAccessory(_:) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownaccessory(content:) | View/digitalCrownAccessory(content:) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownrotation(_:) | View/digitalCrownRotation(_:) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownrotation(_:from:through:by:sensitivity:iscontinuous:ishapticfeedbackenabled:) | View/digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownrotation(_:from:through:sensitivity:iscontinuous:ishapticfeedbackenabled:onchange:onidle:) | View/digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownrotation(_:onchange:onidle:) | View/digitalCrownRotation(_:onChange:onIdle:) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownrotation(detent:from:through:by:sensitivity:iscontinuous:ishapticfeedbackenabled:onchange:onidle:) | View/digitalCrownRotation(detent:from:through:by:...) | input_events | watchOS-only |
| swiftui.input-events.digitalcrownevent | DigitalCrownEvent | input_events | watchOS-only |
| swiftui.input-events.digitalcrownrotationalsensitivity | DigitalCrownRotationalSensitivity | input_events | watchOS-only |
| swiftui.input-events.emptyhovereffectcontent | EmptyHoverEffectContent | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.grouphovereffect | GroupHoverEffect | input_events | visionOS-only (visionOS 26.0) |
| swiftui.input-events.handpointerbehavior(_:) | View/handPointerBehavior(_:) | input_events | visionOS-only |
| swiftui.input-events.handpointerbehavior | HandPointerBehavior | input_events | visionOS-only |
| swiftui.input-events.hovereffect | HoverEffect | input_events | iOS-only (availability: iOS 13.4, no macOS) |
| swiftui.input-events.hovereffect(_:) | View/hoverEffect(_:) | input_events | iOS/visionOS-only (no macOS) |
| swiftui.input-events.hovereffect(_:in:isenabled:) | View/hoverEffect(_:in:isEnabled:) | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffect(_:isenabled:) | View/hoverEffect(_:isEnabled:) | input_events | iOS/tvOS-only (no macOS) |
| swiftui.input-events.hovereffect(in:isenabled:body:) | View/hoverEffect(in:isEnabled:body:) | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffectcontent | HoverEffectContent | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffectdisabled(_:) | View/hoverEffectDisabled(_:) | input_events | iOS/visionOS-only (no macOS) |
| swiftui.input-events.hovereffectgroup | HoverEffectGroup | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffectgroup() | View/hoverEffectGroup() | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffectgroup(_:) | View/hoverEffectGroup(_:) | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffectgroup(id:in:behavior:) | View/hoverEffectGroup(id:in:behavior:) | input_events | visionOS-only (visionOS 2.0) |
| swiftui.input-events.hovereffectphaseoverride | HoverEffectPhaseOverride | input_events | visionOS-only (visionOS 26.0) |
| swiftui.input-events.oncameracaptureevent(isenabled:action:) | View/onCameraCaptureEvent(isEnabled:action:) | input_events | iOS-only (iOS 18.0) |
| swiftui.input-events.oncameracaptureevent(isenabled:primaryaction:secondaryaction:) | View/onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:) | input_events | iOS-only (iOS 18.0) |
| swiftui.input-events.ornamenthovercontenteffect | OrnamentHoverContentEffect | input_events | visionOS-only (visionOS 26.0) |
| swiftui.input-events.ornamenthovereffect | OrnamentHoverEffect | input_events | visionOS-only |
| swiftui.input-events.pagecommand(value:in:step:) | View/pageCommand(value:in:step:) | input_events | visionOS-only (no macOS) |
| swiftui.input-events.onplaypausecommand(perform:) | View/onPlayPauseCommand(perform:) | input_events | tvOS/visionOS-only (no macOS) |
| swiftui.technology-specific-views.activitybackgroundtint(_:) | View/activityBackgroundTint(_:) | technology_specific_views | iOS-only (Live Activities — iOS 16.0) |
| swiftui.technology-specific-views.activitysystemactionforegroundcolor(_:) | View/activitySystemActionForegroundColor(_:) | technology_specific_views | iOS-only (Live Activities — iOS 16.1) |
| swiftui.technology-specific-views.addordertowalletbuttonstyle(_:) | View/addOrderToWalletButtonStyle(_:) | technology_specific_views | iOS-only (iOS 17.0) |
| swiftui.technology-specific-views.addpasstowalletbuttonstyle(_:) | View/addPassToWalletButtonStyle(_:) | technology_specific_views | iOS-only (iOS 16.0) |
| swiftui.technology-specific-views.appstoreoverlay(ispresented:configuration:) | View/appStoreOverlay(isPresented:configuration:) | technology_specific_views | iOS/visionOS-only (no macOS) |
| swiftui.technology-specific-views.automateddeviceenrollmentaddition(ispresented:) | View/automatedDeviceEnrollmentAddition(isPresented:) | technology_specific_views | iOS-only (iOS 16.0) |
| swiftui.technology-specific-views.cameraanchor(isactive:) | View/cameraAnchor(isActive:) | technology_specific_views | visionOS-only (visionOS 2.0) |
| swiftui.technology-specific-views.contactaccessbuttoncaption(_:) | View/contactAccessButtonCaption(_:) | technology_specific_views | iOS-only (iOS 18.0) |
| swiftui.technology-specific-views.contactaccessbuttonstyle(_:) | View/contactAccessButtonStyle(_:) | technology_specific_views | iOS-only (iOS 18.0) |
| swiftui.technology-specific-views.contactaccesspicker(ispresented:completionhandler:) | View/contactAccessPicker(isPresented:completionHandler:) | technology_specific_views | iOS-only (iOS 18.0) |
| swiftui.technology-specific-views.continuitydevicepicker(ispresented:ondidconnect:) | View/continuityDevicePicker(isPresented:onDidConnect:) | technology_specific_views | iOS-only (no macOS availability listed) |
| swiftui.technology-specific-views.familyactivitypicker(ispresented:selection:) | View/familyActivityPicker(isPresented:selection:) | technology_specific_views | iOS-only (iOS 15.0, Screen Time framework) |
| swiftui.technology-specific-views.familyactivitypicker(headertext:footertext:ispresented:selection:) | View/familyActivityPicker(headerText:footerText:isPresented:selection:) | technology_specific_views | iOS-only (iOS 15.0, Screen Time framework) |
| swiftui.technology-specific-views.handlesgamecontrollerevents(matching:) | View/handlesGameControllerEvents(matching:) | technology_specific_views | iOS/visionOS-only (no macOS) |
| swiftui.technology-specific-views.journalingsuggestionspicker(ispresented:oncompletion:) | View/journalingSuggestionsPicker(isPresented:onCompletion:) | technology_specific_views | iOS-only (iOS 17.2) |
| swiftui.technology-specific-views.lookaroundviewer(ispresented:scene:allowsnavigation:showsroadlabels:pointsofinterest:ondismiss:) | View/lookAroundViewer(isPresented:scene:...) | technology_specific_views | iOS-only (iOS 17.0, no macOS) |
| swiftui.technology-specific-views.lookaroundviewer(ispresented:initialscene:allowsnavigation:showsroadlabels:pointsofinterest:ondismiss:) | View/lookAroundViewer(isPresented:initialScene:...) | technology_specific_views | iOS-only (iOS 17.0, no macOS) |
| swiftui.technology-specific-views.managedcontentstyle(_:) | View/managedContentStyle(_:) | technology_specific_views | macOS 26.4 only — future release, describe for now |
| swiftui.technology-specific-views.managesubscriptionssheet(ispresented:) | View/manageSubscriptionsSheet(isPresented:) | technology_specific_views | iOS/visionOS-only (no macOS) |
| swiftui.technology-specific-views.managesubscriptionssheet(ispresented:subscriptiongroupid:) | View/manageSubscriptionsSheet(isPresented:subscriptionGroupID:) | technology_specific_views | iOS/visionOS-only (no macOS) |
| swiftui.technology-specific-views.mapfeatureselectionaccessory(_:) | View/mapFeatureSelectionAccessory(_:) | technology_specific_views | iOS-only (no macOS in docs) |
| swiftui.technology-specific-views.mapfeatureselectioncontent(content:) | View/mapFeatureSelectionContent(content:) | technology_specific_views | iOS-only (no macOS in docs) |
| swiftui.technology-specific-views.mapfeatureselectiondisabled(_:) | View/mapFeatureSelectionDisabled(_:) | technology_specific_views | iOS-only (iOS 17.0, no macOS) |
| swiftui.technology-specific-views.offercoderedemption(ispresented:oncompletion:) | View/offerCodeRedemption(isPresented:onCompletion:) | technology_specific_views | macOS 15.0 but StoreKit sheet-only; describe (sheet presentation, nothing renderable in child view) |
| swiftui.technology-specific-views.paylaterviewaction(_:) | View/payLaterViewAction(_:) | technology_specific_views | iOS-only (iOS 17.0, Apple Pay Later) |
| swiftui.technology-specific-views.paylaterviewdisplaystyle(_:) | View/payLaterViewDisplayStyle(_:) | technology_specific_views | iOS-only (iOS 17.0, Apple Pay Later) |
| swiftui.technology-specific-views.tabletopgame(_:parent:automaticupdate:) | View/tabletopGame(_:parent:automaticUpdate:) | technology_specific_views | visionOS-only (visionOS 2.0) |
| swiftui.technology-specific-views.tabletopgame(_:parent:automaticupdate:interaction:) | View/tabletopGame(_:parent:automaticUpdate:interaction:) | technology_specific_views | visionOS-only (visionOS 2.0) |
| swiftui.technology-specific-views.transactionpicker(ispresented:selection:) | View/transactionPicker(isPresented:selection:) | technology_specific_views | iOS-only (iOS 18.0) |
| swiftui.technology-specific-views.transactiontask(_:action:) | View/transactionTask(_:action:) | technology_specific_views | iOS-only (no macOS listed) |
| swiftui.technology-specific-views.verifyidentitywithwalletbuttonstyle(_:) | View/verifyIdentityWithWalletButtonStyle(_:) | technology_specific_views | iOS-only (iOS 16.0) |
