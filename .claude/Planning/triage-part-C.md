# Triage Part C — animations / text_input / images / controls / menus / shapes / drawing

**Already-wired leaves (skipped):** `swiftui.text-input-and-output.label` (`.real(symbol: "Label")`)

---

## Implement

| Leaf id | API | Section |
|---|---|---|
| swiftui.animations.animation | Animation | animations |
| swiftui.animations.animation(_:) | View/animation(_:) | animations |
| swiftui.animations.animation(_:value:) | View/animation(_:value:) | animations |
| swiftui.animations.animation(_:body:) | View/animation(_:body:) | animations |
| swiftui.animations.animation(_:).modifier | Binding/animation(_:) | animations |
| swiftui.animations.animatablemodifier | AnimatableModifier | animations |
| swiftui.animations.animatablepair | AnimatablePair | animations |
| swiftui.animations.animatablevalues | AnimatableValues | animations |
| swiftui.animations.animationcompletioncriteria | AnimationCompletionCriteria | animations |
| swiftui.animations.animationcontext | AnimationContext | animations |
| swiftui.animations.animationstate | AnimationState | animations |
| swiftui.animations.animationstatekey | AnimationStateKey | animations |
| swiftui.animations.anytransition | AnyTransition | animations |
| swiftui.animations.asymmetrictransition | AsymmetricTransition | animations |
| swiftui.animations.contenttransition(_:) | View/contentTransition(_:) | animations |
| swiftui.animations.contenttransition | EnvironmentValues/contentTransition | animations |
| swiftui.animations.contenttransitionaddsdrawinggroup | EnvironmentValues/contentTransitionAddsDrawingGroup | animations |
| swiftui.animations.contenttransition.type | ContentTransition | animations |
| swiftui.animations.cubickeyframe | CubicKeyframe | animations |
| swiftui.animations.emptyanimatabledata | EmptyAnimatableData | animations |
| swiftui.animations.emptymatchedtransitionsourceconfiguration | EmptyMatchedTransitionSourceConfiguration | animations |
| swiftui.animations.geometryeffect | GeometryEffect | animations |
| swiftui.animations.geometrygroup() | View/geometryGroup() | animations |
| swiftui.animations.keyframeanimator(initialvalue:repeating:content:keyframes:) | View/keyframeAnimator(initialValue:repeating:content:keyframes:) | animations |
| swiftui.animations.keyframeanimator(initialvalue:trigger:content:keyframes:) | View/keyframeAnimator(initialValue:trigger:content:keyframes:) | animations |
| swiftui.animations.keyframeanimator | KeyframeAnimator | animations |
| swiftui.animations.keyframes | Keyframes | animations |
| swiftui.animations.keyframetimeline | KeyframeTimeline | animations |
| swiftui.animations.keyframetrack | KeyframeTrack | animations |
| swiftui.animations.keyframetrackcontentbuilder | KeyframeTrackContentBuilder | animations |
| swiftui.animations.keyframesbuilder | KeyframesBuilder | animations |
| swiftui.animations.keyframetrackcontent | KeyframeTrackContent | animations |
| swiftui.animations.linearkeyframe | LinearKeyframe | animations |
| swiftui.animations.matchedgeometryeffect(id:in:properties:anchor:issource:) | View/matchedGeometryEffect(id:in:properties:anchor:isSource:) | animations |
| swiftui.animations.matchedgeometryproperties | MatchedGeometryProperties | animations |
| swiftui.animations.matchedtransitionsource(id:in:) | View/matchedTransitionSource(id:in:) | animations |
| swiftui.animations.matchedtransitionsource(id:in:configuration:) | View/matchedTransitionSource(id:in:configuration:) | animations |
| swiftui.animations.matchedtransitionsourceconfiguration | MatchedTransitionSourceConfiguration | animations |
| swiftui.animations.movekeyframe | MoveKeyframe | animations |
| swiftui.animations.namespace | Namespace | animations |
| swiftui.animations.navigationtransition(_:) | View/navigationTransition(_:) | animations |
| swiftui.animations.navigationtransition | NavigationTransition | animations |
| swiftui.animations.phaseanimator(_:content:animation:) | View/phaseAnimator(_:content:animation:) | animations |
| swiftui.animations.phaseanimator(_:trigger:content:animation:) | View/phaseAnimator(_:trigger:content:animation:) | animations |
| swiftui.animations.phaseanimator | PhaseAnimator | animations |
| swiftui.animations.placeholdercontentview | PlaceholderContentView | animations |
| swiftui.animations.scale | AnyTransition/scale | animations |
| swiftui.animations.slide | AnyTransition/slide | animations |
| swiftui.animations.spring | Spring | animations |
| swiftui.animations.springkeyframe | SpringKeyframe | animations |
| swiftui.animations.timelineschedule | TimelineSchedule | animations |
| swiftui.animations.timelineview | TimelineView | animations |
| swiftui.animations.timelineviewdefaultcontext | TimelineViewDefaultContext | animations |
| swiftui.animations.transaction(_:) | View/transaction(_:) | animations |
| swiftui.animations.transaction(value:_:) | View/transaction(value:_:) | animations |
| swiftui.animations.transaction(_:body:) | View/transaction(_:body:) | animations |
| swiftui.animations.transaction | Transaction | animations |
| swiftui.animations.transactionkey | TransactionKey | animations |
| swiftui.animations.transition(_:) | View/transition(_:) | animations |
| swiftui.animations.transition | Transition | animations |
| swiftui.animations.transitionphase | TransitionPhase | animations |
| swiftui.animations.transitionproperties | TransitionProperties | animations |
| swiftui.animations.unitcurve | UnitCurve | animations |
| swiftui.animations.withtransaction(_:_:) | withTransaction(_:_:) | animations |
| swiftui.animations.withtransaction(_:_:_:) | withTransaction(_:_:_:) | animations |
| swiftui.animations.withanimation(_:_:) | withAnimation(_:_:) | animations |
| swiftui.animations.withanimation(_:completioncriteria:_:completion:) | withAnimation(_:completionCriteria:_:completion:) | animations |
| swiftui.text-input-and-output.text | Text | text_input_and_output |
| swiftui.text-input-and-output.textfield | TextField | text_input_and_output |
| swiftui.text-input-and-output.securefield | SecureField | text_input_and_output |
| swiftui.text-input-and-output.texteditor | TextEditor | text_input_and_output |
| swiftui.text-input-and-output.textselection(_:) | View/textSelection(_:) | text_input_and_output |
| swiftui.text-input-and-output.textselectionaffinity(_:) | View/textSelectionAffinity(_:) | text_input_and_output |
| swiftui.text-input-and-output.textselectionaffinity | TextSelectionAffinity | text_input_and_output |
| swiftui.text-input-and-output.textselection | TextSelection | text_input_and_output |
| swiftui.text-input-and-output.attributedtextselection | AttributedTextSelection | text_input_and_output |
| swiftui.text-input-and-output.font(_:) | View/font(_:) | text_input_and_output |
| swiftui.text-input-and-output.fontdesign(_:) | View/fontDesign(_:) | text_input_and_output |
| swiftui.text-input-and-output.fontweight(_:) | View/fontWeight(_:) | text_input_and_output |
| swiftui.text-input-and-output.fontwidth(_:) | View/fontWidth(_:) | text_input_and_output |
| swiftui.text-input-and-output.font | Font | text_input_and_output |
| swiftui.text-input-and-output.textscale(_:isenabled:) | View/textScale(_:isEnabled:) | text_input_and_output |
| swiftui.text-input-and-output.dynamictypesize(_:) | View/dynamicTypeSize(_:) | text_input_and_output |
| swiftui.text-input-and-output.dynamictypesize | DynamicTypeSize | text_input_and_output |
| swiftui.text-input-and-output.scaledmetric | ScaledMetric | text_input_and_output |
| swiftui.text-input-and-output.textvariantpreference | TextVariantPreference | text_input_and_output |
| swiftui.text-input-and-output.fixedtextvariant | FixedTextVariant | text_input_and_output |
| swiftui.text-input-and-output.sizedependenttextvariant | SizeDependentTextVariant | text_input_and_output |
| swiftui.text-input-and-output.bold(_:) | View/bold(_:) | text_input_and_output |
| swiftui.text-input-and-output.italic(_:) | View/italic(_:) | text_input_and_output |
| swiftui.text-input-and-output.underline(_:pattern:color:) | View/underline(_:pattern:color:) | text_input_and_output |
| swiftui.text-input-and-output.strikethrough(_:pattern:color:) | View/strikethrough(_:pattern:color:) | text_input_and_output |
| swiftui.text-input-and-output.textcase(_:) | View/textCase(_:) | text_input_and_output |
| swiftui.text-input-and-output.monospaced(_:) | View/monospaced(_:) | text_input_and_output |
| swiftui.text-input-and-output.monospaceddigit() | View/monospacedDigit() | text_input_and_output |
| swiftui.text-input-and-output.attributedtextformattingdefinition | AttributedTextFormattingDefinition | text_input_and_output |
| swiftui.text-input-and-output.attributedtextvalueconstraint | AttributedTextValueConstraint | text_input_and_output |
| swiftui.text-input-and-output.attributedtextformatting | AttributedTextFormatting | text_input_and_output |
| swiftui.text-input-and-output.truncationmode(_:) | View/truncationMode(_:) | text_input_and_output |
| swiftui.text-input-and-output.allowstightening(_:) | View/allowsTightening(_:) | text_input_and_output |
| swiftui.text-input-and-output.minimumscalefactor(_:) | View/minimumScaleFactor(_:) | text_input_and_output |
| swiftui.text-input-and-output.baselineoffset(_:) | View/baselineOffset(_:) | text_input_and_output |
| swiftui.text-input-and-output.kerning(_:) | View/kerning(_:) | text_input_and_output |
| swiftui.text-input-and-output.tracking(_:) | View/tracking(_:) | text_input_and_output |
| swiftui.text-input-and-output.flipsforrighttoleftlayoutdirection(_:) | View/flipsForRightToLeftLayoutDirection(_:) | text_input_and_output |
| swiftui.text-input-and-output.textalignment | TextAlignment | text_input_and_output |
| swiftui.text-input-and-output.textattribute | TextAttribute | text_input_and_output |
| swiftui.text-input-and-output.textrenderer(_:) | View/textRenderer(_:) | text_input_and_output |
| swiftui.text-input-and-output.textrenderer | TextRenderer | text_input_and_output |
| swiftui.text-input-and-output.textproxy | TextProxy | text_input_and_output |
| swiftui.text-input-and-output.linelimit(_:) | View/lineLimit(_:) | text_input_and_output |
| swiftui.text-input-and-output.linelimit(_:reservesspace:) | View/lineLimit(_:reservesSpace:) | text_input_and_output |
| swiftui.text-input-and-output.linespacing(_:) | View/lineSpacing(_:) | text_input_and_output |
| swiftui.text-input-and-output.multilinetextalignment(_:) | View/multilineTextAlignment(_:) | text_input_and_output |
| swiftui.text-input-and-output.systemformatstyle | SystemFormatStyle | text_input_and_output |
| swiftui.text-input-and-output.timedatasource | TimeDataSource | text_input_and_output |
| swiftui.text-input-and-output.autocorrectiondisabled(_:) | View/autocorrectionDisabled(_:) | text_input_and_output |
| swiftui.text-input-and-output.scrolldismisseskeyboard(_:) | View/scrollDismissesKeyboard(_:) | text_input_and_output |
| swiftui.text-input-and-output.textcontenttype(_:) | View/textContentType(_:) | text_input_and_output |
| swiftui.text-input-and-output.textcontenttype(_:)-6fic1 | View/textContentType(_:)-6fic1 | text_input_and_output |
| swiftui.text-input-and-output.textinputcompletion(_:) | View/textInputCompletion(_:) | text_input_and_output |
| swiftui.text-input-and-output.textinputsuggestions(_:) | View/textInputSuggestions(_:) | text_input_and_output |
| swiftui.text-input-and-output.textinputsuggestions(_:content:) | View/textInputSuggestions(_:content:) | text_input_and_output |
| swiftui.text-input-and-output.textinputsuggestions(_:id:content:) | View/textInputSuggestions(_:id:content:) | text_input_and_output |
| swiftui.text-input-and-output.textinputformattingcontrolplacement | TextInputFormattingControlPlacement | text_input_and_output |
| swiftui.text-input-and-output.writingtoolsbehavior(_:) | View/writingToolsBehavior(_:) | text_input_and_output |
| swiftui.text-input-and-output.writingtoolsbehavior | WritingToolsBehavior | text_input_and_output |
| swiftui.text-input-and-output.typeselectequivalent(_:) | View/typeSelectEquivalent(_:) | text_input_and_output |
| swiftui.text-input-and-output.localizedstringkey | LocalizedStringKey | text_input_and_output |
| swiftui.text-input-and-output.typesettinglanguage(_:isenabled:) | View/typesettingLanguage(_:isEnabled:) | text_input_and_output |
| swiftui.text-input-and-output.typesettinglanguage | TypesettingLanguage | text_input_and_output |
| swiftui.images.image | Image | images |
| swiftui.images.imagescale(_:) | View/imageScale(_:) | images |
| swiftui.images.scale | Image/Scale | images |
| swiftui.images.orientation | Image/Orientation | images |
| swiftui.images.resizingmode | Image/ResizingMode | images |
| swiftui.images.asyncimage | AsyncImage | images |
| swiftui.images.asyncimagephase | AsyncImagePhase | images |
| swiftui.images.symbolvariant(_:) | View/symbolVariant(_:) | images |
| swiftui.images.symbolvariants | SymbolVariants | images |
| swiftui.images.symboleffect(_:options:isactive:) | View/symbolEffect(_:options:isActive:) | images |
| swiftui.images.symboleffect(_:options:value:) | View/symbolEffect(_:options:value:) | images |
| swiftui.images.symboleffectsremoved(_:) | View/symbolEffectsRemoved(_:) | images |
| swiftui.images.symboleffecttransition | SymbolEffectTransition | images |
| swiftui.images.symbolrenderingmode(_:) | View/symbolRenderingMode(_:) | images |
| swiftui.images.symbolrenderingmode | SymbolRenderingMode | images |
| swiftui.images.symbolcolorrenderingmode | SymbolColorRenderingMode | images |
| swiftui.images.symbolvariablevaluemode | SymbolVariableValueMode | images |
| swiftui.images.imagerenderer | ImageRenderer | images |
| swiftui.controls-and-indicators.button | Button | controls_and_indicators |
| swiftui.controls-and-indicators.buttonbordershape(_:) | View/buttonBorderShape(_:) | controls_and_indicators |
| swiftui.controls-and-indicators.buttonrepeatbehavior(_:) | View/buttonRepeatBehavior(_:) | controls_and_indicators |
| swiftui.controls-and-indicators.buttonbordershape | ButtonBorderShape | controls_and_indicators |
| swiftui.controls-and-indicators.buttonrole | ButtonRole | controls_and_indicators |
| swiftui.controls-and-indicators.buttonrepeatbehavior | ButtonRepeatBehavior | controls_and_indicators |
| swiftui.controls-and-indicators.buttonsizing | ButtonSizing | controls_and_indicators |
| swiftui.controls-and-indicators.pastebutton | PasteButton | controls_and_indicators |
| swiftui.controls-and-indicators.link | Link | controls_and_indicators |
| swiftui.controls-and-indicators.sharelink | ShareLink | controls_and_indicators |
| swiftui.controls-and-indicators.sharepreview | SharePreview | controls_and_indicators |
| swiftui.controls-and-indicators.helplink | HelpLink | controls_and_indicators |
| swiftui.controls-and-indicators.slider | Slider | controls_and_indicators |
| swiftui.controls-and-indicators.stepper | Stepper | controls_and_indicators |
| swiftui.controls-and-indicators.toggle | Toggle | controls_and_indicators |
| swiftui.controls-and-indicators.picker | Picker | controls_and_indicators |
| swiftui.controls-and-indicators.horizontalradiogrouplayout() | View/horizontalRadioGroupLayout() | controls_and_indicators |
| swiftui.controls-and-indicators.paletteselectioneffect(_:) | View/paletteSelectionEffect(_:) | controls_and_indicators |
| swiftui.controls-and-indicators.paletteselectioneffect | PaletteSelectionEffect | controls_and_indicators |
| swiftui.controls-and-indicators.datepicker | DatePicker | controls_and_indicators |
| swiftui.controls-and-indicators.colorpicker | ColorPicker | controls_and_indicators |
| swiftui.controls-and-indicators.gauge | Gauge | controls_and_indicators |
| swiftui.controls-and-indicators.progressview | ProgressView | controls_and_indicators |
| swiftui.controls-and-indicators.defaultdateprogresslabel | DefaultDateProgressLabel | controls_and_indicators |
| swiftui.controls-and-indicators.defaultbuttonlabel | DefaultButtonLabel | controls_and_indicators |
| swiftui.controls-and-indicators.contentunavailableview | ContentUnavailableView | controls_and_indicators |
| swiftui.controls-and-indicators.sensoryfeedback(_:trigger:) | View/sensoryFeedback(_:trigger:) | controls_and_indicators |
| swiftui.controls-and-indicators.sensoryfeedback(trigger:_:) | View/sensoryFeedback(trigger:_:) | controls_and_indicators |
| swiftui.controls-and-indicators.sensoryfeedback(_:trigger:condition:) | View/sensoryFeedback(_:trigger:condition:) | controls_and_indicators |
| swiftui.controls-and-indicators.controlsize(_:) | View/controlSize(_:) | controls_and_indicators |
| swiftui.controls-and-indicators.controlsize | ControlSize | controls_and_indicators |
| swiftui.menus-and-commands.contextmenu(menuitems:) | View/contextMenu(menuItems:) | menus_and_commands |
| swiftui.menus-and-commands.contextmenu(menuitems:preview:) | View/contextMenu(menuItems:preview:) | menus_and_commands |
| swiftui.menus-and-commands.contextmenu(forselectiontype:menu:primaryaction:) | View/contextMenu(forSelectionType:menu:primaryAction:) | menus_and_commands |
| swiftui.menus-and-commands.menu | Menu | menus_and_commands |
| swiftui.menus-and-commands.divider | Divider | menus_and_commands |
| swiftui.menus-and-commands.menuactiondismissbehavior(_:) | View/menuActionDismissBehavior(_:) | menus_and_commands |
| swiftui.menus-and-commands.menuactiondismissbehavior | MenuActionDismissBehavior | menus_and_commands |
| swiftui.menus-and-commands.menuorder(_:) | View/menuOrder(_:) | menus_and_commands |
| swiftui.menus-and-commands.menuorder | MenuOrder | menus_and_commands |
| swiftui.menus-and-commands.pulldownbutton | PullDownButton | menus_and_commands |
| swiftui.shapes.rectangle | Rectangle | shapes |
| swiftui.shapes.roundedrectangle | RoundedRectangle | shapes |
| swiftui.shapes.roundedcornerstyle | RoundedCornerStyle | shapes |
| swiftui.shapes.roundedrectangularshape | RoundedRectangularShape | shapes |
| swiftui.shapes.roundedrectangularshapecorners | RoundedRectangularShapeCorners | shapes |
| swiftui.shapes.unevenroundedrectangle | UnevenRoundedRectangle | shapes |
| swiftui.shapes.rectanglecornerradii | RectangleCornerRadii | shapes |
| swiftui.shapes.rectanglecornerinsets | RectangleCornerInsets | shapes |
| swiftui.shapes.concentricrectangle | ConcentricRectangle | shapes |
| swiftui.shapes.circle | Circle | shapes |
| swiftui.shapes.ellipse | Ellipse | shapes |
| swiftui.shapes.capsule | Capsule | shapes |
| swiftui.shapes.path | Path | shapes |
| swiftui.shapes.shapeview | ShapeView | shapes |
| swiftui.shapes.shape | Shape | shapes |
| swiftui.shapes.anyshape | AnyShape | shapes |
| swiftui.shapes.shaperole | ShapeRole | shapes |
| swiftui.shapes.strokestyle | StrokeStyle | shapes |
| swiftui.shapes.strokeshapeview | StrokeShapeView | shapes |
| swiftui.shapes.strokebordershapeview | StrokeBorderShapeView | shapes |
| swiftui.shapes.fillstyle | FillStyle | shapes |
| swiftui.shapes.fillshapeview | FillShapeView | shapes |
| swiftui.shapes.scaledshape | ScaledShape | shapes |
| swiftui.shapes.rotatedshape | RotatedShape | shapes |
| swiftui.shapes.offsetshape | OffsetShape | shapes |
| swiftui.shapes.transformedshape | TransformedShape | shapes |
| swiftui.shapes.containershape(_:) | View/containerShape(_:) | shapes |
| swiftui.shapes.insettableshape | InsettableShape | shapes |
| swiftui.shapes.containerrelativeshape | ContainerRelativeShape | shapes |
| swiftui.drawing-and-graphics.canvas | Canvas | drawing_and_graphics |
| swiftui.drawing-and-graphics.graphicscontext | GraphicsContext | drawing_and_graphics |
| swiftui.drawing-and-graphics.tint(_:) | View/tint(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.color | Color | drawing_and_graphics |
| swiftui.drawing-and-graphics.border(_:width:) | View/border(_:width:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.foregroundstyle(_:) | View/foregroundStyle(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.foregroundstyle(_:_:) | View/foregroundStyle(_:_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.foregroundstyle(_:_:_:) | View/foregroundStyle(_:_:_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.backgroundstyle(_:) | View/backgroundStyle(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.anyshapestyle | AnyShapeStyle | drawing_and_graphics |
| swiftui.drawing-and-graphics.gradient | Gradient | drawing_and_graphics |
| swiftui.drawing-and-graphics.meshgradient | MeshGradient | drawing_and_graphics |
| swiftui.drawing-and-graphics.anygradient | AnyGradient | drawing_and_graphics |
| swiftui.drawing-and-graphics.shadowstyle | ShadowStyle | drawing_and_graphics |
| swiftui.drawing-and-graphics.glass | Glass | drawing_and_graphics |
| swiftui.drawing-and-graphics.brightness(_:) | View/brightness(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.contrast(_:) | View/contrast(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.colorinvert() | View/colorInvert() | drawing_and_graphics |
| swiftui.drawing-and-graphics.colormultiply(_:) | View/colorMultiply(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.saturation(_:) | View/saturation(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.grayscale(_:) | View/grayscale(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.huerotation(_:) | View/hueRotation(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.luminancetoalpha() | View/luminanceToAlpha() | drawing_and_graphics |
| swiftui.drawing-and-graphics.materialactiveappearance(_:) | View/materialActiveAppearance(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.materialactiveappearance | MaterialActiveAppearance | drawing_and_graphics |
| swiftui.drawing-and-graphics.scaledtofill() | View/scaledToFill() | drawing_and_graphics |
| swiftui.drawing-and-graphics.scaledtofit() | View/scaledToFit() | drawing_and_graphics |
| swiftui.drawing-and-graphics.scaleeffect(_:anchor:) | View/scaleEffect(_:anchor:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.scaleeffect(x:y:anchor:) | View/scaleEffect(x:y:anchor:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.aspectratio(_:contentmode:) | View/aspectRatio(_:contentMode:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.rotationeffect(_:anchor:) | View/rotationEffect(_:anchor:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.rotation3deffect(_:axis:anchor:anchorz:perspective:) | View/rotation3DEffect(_:axis:anchor:anchorZ:perspective:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.transformeffect(_:) | View/transformEffect(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.projectioneffect(_:) | View/projectionEffect(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.projectiontransform | ProjectionTransform | drawing_and_graphics |
| swiftui.drawing-and-graphics.contentmode | ContentMode | drawing_and_graphics |
| swiftui.drawing-and-graphics.mask(alignment:_:) | View/mask(alignment:_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.clipped(antialiased:) | View/clipped(antialiased:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.clipshape(_:style:) | View/clipShape(_:style:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.blur(radius:opaque:) | View/blur(radius:opaque:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.shadow(color:radius:x:y:) | View/shadow(color:radius:x:y:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.colormatrix | ColorMatrix | drawing_and_graphics |
| swiftui.drawing-and-graphics.visualeffect(_:) | View/visualEffect(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.visualeffect | VisualEffect | drawing_and_graphics |
| swiftui.drawing-and-graphics.emptyvisualeffect | EmptyVisualEffect | drawing_and_graphics |
| swiftui.drawing-and-graphics.blendmode(_:) | View/blendMode(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.compositinggroup() | View/compositingGroup() | drawing_and_graphics |
| swiftui.drawing-and-graphics.drawinggroup(opaque:colormode:) | View/drawingGroup(opaque:colorMode:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.blendmode | BlendMode | drawing_and_graphics |
| swiftui.drawing-and-graphics.colorrenderingmode | ColorRenderingMode | drawing_and_graphics |
| swiftui.drawing-and-graphics.compositorcontent | CompositorContent | drawing_and_graphics |
| swiftui.drawing-and-graphics.compositorcontentbuilder | CompositorContentBuilder | drawing_and_graphics |
| swiftui.drawing-and-graphics.anycompositorcontent | AnyCompositorContent | drawing_and_graphics |
| swiftui.drawing-and-graphics.geometryreader | GeometryReader | drawing_and_graphics |
| swiftui.drawing-and-graphics.geometryproxy | GeometryProxy | drawing_and_graphics |
| swiftui.drawing-and-graphics.coordinatespace(_:) | View/coordinateSpace(_:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.coordinatespace | CoordinateSpace | drawing_and_graphics |
| swiftui.drawing-and-graphics.coordinatespaceprotocol | CoordinateSpaceProtocol | drawing_and_graphics |
| swiftui.drawing-and-graphics.ongeometrychange(for:of:action:) | View/onGeometryChange(for:of:action:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.coloreffect(_:isenabled:) | View/colorEffect(_:isEnabled:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.distortioneffect(_:maxsampleoffset:isenabled:) | View/distortionEffect(_:maxSampleOffset:isEnabled:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.layereffect(_:maxsampleoffset:isenabled:) | View/layerEffect(_:maxSampleOffset:isEnabled:) | drawing_and_graphics |
| swiftui.drawing-and-graphics.shader | Shader | drawing_and_graphics |
| swiftui.drawing-and-graphics.shaderfunction | ShaderFunction | drawing_and_graphics |
| swiftui.drawing-and-graphics.shaderlibrary | ShaderLibrary | drawing_and_graphics |
| swiftui.drawing-and-graphics.axis | Axis | drawing_and_graphics |
| swiftui.drawing-and-graphics.angle | Angle | drawing_and_graphics |
| swiftui.drawing-and-graphics.unitpoint | UnitPoint | drawing_and_graphics |
| swiftui.drawing-and-graphics.anchor | Anchor | drawing_and_graphics |

---

## Describe

| Leaf id | API | Section | Reason |
|---|---|---|---|
| swiftui.animations.animatable | Animatable | animations | protocol — conformance type, not directly renderable |
| swiftui.animations.controlling-the-timing-and-movements-of-your-animations | Controlling the timing and movements of your animations | animations | article / conceptual doc |
| swiftui.animations.customanimation | CustomAnimation | animations | protocol — implement to create custom animations, not directly renderable |
| swiftui.animations.vectorarithmetic | VectorArithmetic | animations | protocol — math conformance type, not renderable |
| swiftui.text-input-and-output.building-rich-swiftui-text-experiences | Building rich SwiftUI text experiences | text_input_and_output | article / conceptual doc |
| swiftui.text-input-and-output.applying-custom-fonts-to-text | Applying custom fonts to text | text_input_and_output | article / conceptual doc |
| swiftui.text-input-and-output.creating-visual-effects-with-swiftui | Creating visual effects with SwiftUI | text_input_and_output | article / conceptual doc |
| swiftui.text-input-and-output.preparing-views-for-localization | Preparing views for localization | text_input_and_output | article / conceptual doc |
| swiftui.text-input-and-output.textselectability | TextSelectability | text_input_and_output | protocol — conformance type (EnabledTextSelectability etc.) |
| swiftui.text-input-and-output.keyboardtype(_:) | View/keyboardType(_:) | text_input_and_output | iOS/watchOS/Mac Catalyst only — macOS unavailable |
| swiftui.text-input-and-output.textinputautocapitalization(_:) | View/textInputAutocapitalization(_:) | text_input_and_output | iOS/Mac Catalyst only — macOS unavailable |
| swiftui.text-input-and-output.textinputautocapitalization | TextInputAutocapitalization | text_input_and_output | iOS/Mac Catalyst only — macOS unavailable |
| swiftui.text-input-and-output.searchdictationbehavior(_:) | View/searchDictationBehavior(_:) | text_input_and_output | iOS/Mac Catalyst only — macOS unavailable |
| swiftui.text-input-and-output.textinputdictationactivation | TextInputDictationActivation | text_input_and_output | iOS/Mac Catalyst only — macOS unavailable |
| swiftui.text-input-and-output.textinputdictationbehavior | TextInputDictationBehavior | text_input_and_output | iOS/Mac Catalyst only — macOS unavailable |
| swiftui.text-input-and-output.textcontenttype(_:)-4dqqb | View/textContentType(_:)-4dqqb | text_input_and_output | watchOS only — macOS unavailable |
| swiftui.text-input-and-output.textcontenttype(_:)-ufdv | View/textContentType(_:)-ufdv | text_input_and_output | iOS/tvOS only — macOS unavailable |
| swiftui.text-input-and-output.contentsizecategory | ContentSizeCategory | text_input_and_output | deprecated (deprecated in macOS 26.5); replaced by DynamicTypeSize |
| swiftui.images.fitting-images-into-available-space | Fitting images into available space | images | article / conceptual doc |
| swiftui.controls-and-indicators.editbutton | EditButton | controls_and_indicators | iOS/visionOS only — macOS unavailable |
| swiftui.controls-and-indicators.textfieldlink | TextFieldLink | controls_and_indicators | watchOS only — macOS unavailable |
| swiftui.controls-and-indicators.defaultwheelpickeritemheight(_:) | View/defaultWheelPickerItemHeight(_:) | controls_and_indicators | watchOS only — macOS unavailable |
| swiftui.controls-and-indicators.multidatepicker | MultiDatePicker | controls_and_indicators | iOS/visionOS only — macOS unavailable |
| swiftui.controls-and-indicators.sensoryfeedback | SensoryFeedback | controls_and_indicators | no macOS haptic hardware; struct is available but `.alignment` / `.impact` have no effect on macOS |
| swiftui.menus-and-commands.building-and-customizing-the-menu-bar-with-swiftui | Building and customizing the menu bar with SwiftUI | menus_and_commands | article / conceptual doc |
| swiftui.menus-and-commands.populating-swiftui-menus-with-adaptive-controls | Populating SwiftUI menus with adaptive controls | menus_and_commands | article / conceptual doc |
| swiftui.menus-and-commands.commands(content:) | Scene/commands(content:) | menus_and_commands | Scene-level modifier — cannot be applied in a child view |
| swiftui.menus-and-commands.commandsremoved() | Scene/commandsRemoved() | menus_and_commands | Scene-level modifier — cannot be applied in a child view |
| swiftui.menus-and-commands.commandsreplaced(content:) | Scene/commandsReplaced(content:) | menus_and_commands | Scene-level modifier — cannot be applied in a child view |
| swiftui.menus-and-commands.commands | Commands | menus_and_commands | protocol — Scene-level type, not renderable in a child view |
| swiftui.menus-and-commands.commandmenu | CommandMenu | menus_and_commands | Scene/Commands scope only — not renderable in a child view |
| swiftui.menus-and-commands.commandgroup | CommandGroup | menus_and_commands | Scene/Commands scope only — not renderable in a child view |
| swiftui.menus-and-commands.commandsbuilder | CommandsBuilder | menus_and_commands | result-builder for Commands scope — not a renderable view |
| swiftui.menus-and-commands.commandgroupplacement | CommandGroupPlacement | menus_and_commands | configuration type for menu bar placement — not renderable |
| swiftui.menus-and-commands.sidebarcommands | SidebarCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.texteditingcommands | TextEditingCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.textformattingcommands | TextFormattingCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.toolbarcommands | ToolbarCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.importfromdevicescommands | ImportFromDevicesCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.inspectorcommands | InspectorCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.emptycommands | EmptyCommands | menus_and_commands | Commands conformance — Scene scope only |
| swiftui.menus-and-commands.contextmenu | ContextMenu | menus_and_commands | deprecated struct (deprecated macOS 26.5) — replaced by View/contextMenu modifier |
| swiftui.menus-and-commands.menubutton | MenuButton | menus_and_commands | deprecated (deprecated macOS 26.5) — replaced by Menu |
| swiftui.drawing-and-graphics.add-rich-graphics-to-your-swiftui-app | Add rich graphics to your SwiftUI app | drawing_and_graphics | article / conceptual doc |
| swiftui.drawing-and-graphics.shapestyle | ShapeStyle | drawing_and_graphics | protocol — conformance type, not directly renderable alone |
| swiftui.drawing-and-graphics.geometryreader3d | GeometryReader3D | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.geometryproxy3d | GeometryProxy3D | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.physicalmetric | PhysicalMetric | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.physicalmetricsconverter | PhysicalMetricsConverter | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.unitpoint3d | UnitPoint3D | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.depthalignmentid | DepthAlignmentID | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.alignment3d | Alignment3D | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.geometryproxycoordinatespace3d | GeometryProxyCoordinateSpace3D | drawing_and_graphics | visionOS only (26.0) — macOS unavailable |
| swiftui.drawing-and-graphics.visualeffect3d(_:) | View/visualEffect3D(_:) | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.transform3deffect(_:) | View/transform3DEffect(_:) | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.rotation3deffect(_:anchor:) | View/rotation3DEffect(_:anchor:) | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.rotation3deffect(_:axis:anchor:) | View/rotation3DEffect(_:axis:anchor:) | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.perspectiverotationeffect(_:axis:anchor:anchorz:perspective:) | View/perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:) | drawing_and_graphics | visionOS only — macOS unavailable |
| swiftui.drawing-and-graphics.scaleeffect(x:y:z:anchor:) | View/scaleEffect(x:y:z:anchor:) | drawing_and_graphics | visionOS only — macOS unavailable |
