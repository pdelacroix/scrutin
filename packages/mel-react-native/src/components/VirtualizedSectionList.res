include VirtualizedSectionListElement

type rec renderItemProps<'item, 'sectionData> = {
  item: 'item,
  index: int,
  section: section<'item, 'sectionData>,
  separators: separators,
}
and section<'item, 'sectionData> = {
  data: array<'item>,
  key: option<string>,
  renderItem: option<renderItemCallback<'item, 'sectionData>>,
  \"ItemSeparatorComponent": option<unit => React.element>,
  keyExtractor: option<('item, int) => string>,
  sectionData: option<'sectionData>,
}
and separators = {
  highlight: unit => unit,
  unhighlight: unit => unit,
}
and renderItemCallback<'item, 'sectionData> = renderItemProps<'item, 'sectionData> => React.element

type rec renderSectionHeaderCallback<'item, 'sectionData> = renderSectionHeaderProps<
  'item,
  'sectionData,
> => React.element
and renderSectionHeaderProps<'item, 'sectionData> = {section: section<'item, 'sectionData>}

type separatorProps<'item, 'sectionData> = {
  highlighted: bool,
  leadingItem: 'item,
  leadingSection: option<section<'item, 'sectionData>>,
  section: section<'item, 'sectionData>,
  trailingItem: option<'item>,
  trailingSection: option<section<'item, 'sectionData>>,
}

@obj
external // @deprecated("Directly create record instead")
section: (
  ~data: array<'item>,
  ~key: string=?,
  ~renderItem: renderItemCallback<'item, 'sectionData>=?,
  ~\"ItemSeparatorComponent": unit => React.element=?,
  ~keyExtractor: ('item, int) => string=?,
  ~sectionData: 'sectionData=?,
  unit,
) => section<'item, 'sectionData> = ""

@react.component @module("react-native")
external make: (
  ~ref: ref=?,
  // VirtualizedSectionList props
  ~\"ItemSeparatorComponent": React.component<separatorProps<'item, 'sectionData>>=?,
  ~\"SectionSeparatorComponent": React.component<separatorProps<'item, 'sectionData>>=?,
  ~renderItem: renderItemCallback<'item, 'sectionData>,
  ~renderSectionFooter: renderSectionHeaderCallback<'item, 'sectionData>=?,
  ~renderSectionHeader: renderSectionHeaderCallback<'item, 'sectionData>=?,
  ~sections: array<section<'item, 'sectionData>>,
  ~stickySectionHeadersEnabled: bool=?,
  // VirtualizedList props
  ~\"CellRendererComponent": VirtualizedList.cellRendererComponent<'item>=?,
  ~\"ListEmptyComponent": unit => React.element=?,
  ~\"ListFooterComponent": unit => React.element=?,
  ~\"ListFooterComponentStyle": Style.t=?,
  ~\"ListHeaderComponent": unit => React.element=?,
  ~\"ListHeaderComponentStyle": Style.t=?,
  ~debug: bool=?,
  // ~enableVirtualization: bool=?, // not working, disableVirtualization?
  // ~data: 'data, // any collection of 'item
  ~disableVirtualization: bool=?, // deprecated
  ~extraData: 'extraData=?,
  ~getItem: ('data, int) => 'item=?,
  ~getItemCount: 'data => int=?,
  ~getItemLayout: ('data, int) => VirtualizedList.itemLayout=?,
  ~initialNumToRender: int=?,
  ~initialScrollIndex: int=?,
  ~inverted: bool=?,
  ~keyExtractor: ('item, int) => string,
  ~maxToRenderPerBatch: int=?,
  ~onEndReached: VirtualizedList.onEndReachedParams => unit=?,
  ~onEndReachedThreshold: float=?,
  ~onRefresh: unit => unit=?,
  ~onScrollToIndexFailed: VirtualizedList.onScrollToIndexFailedParams => unit=?,
  ~onViewableItemsChanged: VirtualizedList.viewableItemsChanged<'item> => unit=?,
  ~progressViewOffset: float=?,
  ~refreshing: bool=?,
  // ~renderItem: VirtualizedList.renderItemCallback('item),
  ~renderScrollComponent: unit => React.element=?, // TODO: params?
  ~updateCellsBatchingPeriod: float=?,
  ~viewabilityConfig: VirtualizedList.viewabilityConfig=?,
  ~viewabilityConfigCallbackPairs: VirtualizedList.viewabilityConfigCallbackPairs<'item>=?,
  ~windowSize: int=?,
  // ScrollView props
  ~alwaysBounceHorizontal: bool=?,
  ~alwaysBounceVertical: bool=?,
  ~automaticallyAdjustContentInsets: bool=?,
  ~bounces: bool=?,
  ~bouncesZoom: bool=?,
  ~canCancelContentTouches: bool=?,
  ~centerContent: bool=?,
  ~contentContainerStyle: Style.t=?,
  ~contentInset: View.edgeInsets=?,
  ~contentInsetAdjustmentBehavior: ScrollView.contentInsetAdjustmentBehavior=?,
  ~contentOffset: ScrollView.contentOffset=?,
  ~decelerationRate: ScrollView.decelerationRate=?,
  ~directionalLockEnabled: bool=?,
  ~endFillColor: Color.t=?,
  ~fadingEdgeLength: float=?,
  ~horizontal: bool=?,
  ~indicatorStyle: ScrollView.indicatorStyle=?,
  ~keyboardDismissMode: ScrollView.keyboardDismissMode=?,
  ~keyboardShouldPersistTaps: ScrollView.keyboardShouldPersistTaps=?,
  ~maximumZoomScale: float=?,
  ~minimumZoomScale: float=?,
  ~nestedScrollEnabled: bool=?,
  ~onContentSizeChange: ((float, float)) => unit=?,
  ~onMomentumScrollBegin: Event.scrollEvent => unit=?,
  ~onMomentumScrollEnd: Event.scrollEvent => unit=?,
  ~onScroll: Event.scrollEvent => unit=?,
  ~onScrollBeginDrag: Event.scrollEvent => unit=?,
  ~onScrollEndDrag: Event.scrollEvent => unit=?,
  ~overScrollMode: ScrollView.overScrollMode=?,
  ~pagingEnabled: bool=?,
  ~pinchGestureEnabled: bool=?,
  ~refreshControl: React.element=?,
  ~scrollEnabled: bool=?,
  ~scrollEventThrottle: int=?,
  ~scrollIndicatorInsets: View.edgeInsets=?,
  ~scrollPerfTag: string=?,
  ~scrollsToTop: bool=?,
  ~scrollToOverflowEnabled: bool=?,
  ~showsHorizontalScrollIndicator: bool=?,
  ~showsVerticalScrollIndicator: bool=?,
  ~snapToAlignment: ScrollView.snapToAlignment=?,
  ~snapToEnd: bool=?,
  ~snapToInterval: float=?,
  ~snapToOffsets: array<float>=?,
  ~snapToStart: bool=?,
  ~stickyHeaderHiddenOnScroll: bool=?,
  ~stickyHeaderIndices: array<int>=?,
  ~zoomScale: float=?,
  // rescript-react-native 0.69 View props
  ~accessibilityActions: array<Accessibility.actionInfo>=?,
  ~accessibilityElementsHidden: bool=?,
  ~accessibilityHint: string=?,
  ~accessibilityIgnoresInvertColors: bool=?,
  ~accessibilityLabel: string=?,
  ~accessibilityLabelledBy: array<string>=?,
  ~accessibilityLanguage: string=?,
  ~accessibilityLiveRegion: Accessibility.liveRegion=?,
  ~accessibilityRole: Accessibility.role=?,
  ~accessibilityState: Accessibility.state=?,
  ~accessibilityValue: Accessibility.value=?,
  ~accessibilityViewIsModal: bool=?,
  ~accessible: bool=?,
  ~collapsable: bool=?,
  ~hitSlop: View.edgeInsets=?,
  ~importantForAccessibility: View.importantForAccessibility=?,
  ~nativeID: string=?,
  ~needsOffscreenAlphaCompositing: bool=?,
  ~onAccessibilityAction: Accessibility.actionEvent => unit=?,
  ~onAccessibilityEscape: unit => unit=?,
  ~onAccessibilityTap: unit => unit=?,
  ~onLayout: Event.layoutEvent => unit=?,
  ~onMagicTap: unit => unit=?,
  // Gesture Responder props
  ~onMoveShouldSetResponder: Event.pressEvent => bool=?,
  ~onMoveShouldSetResponderCapture: Event.pressEvent => bool=?,
  ~onResponderEnd: Event.pressEvent => unit=?,
  ~onResponderGrant: Event.pressEvent => unit=?,
  ~onResponderMove: Event.pressEvent => unit=?,
  ~onResponderReject: Event.pressEvent => unit=?,
  ~onResponderRelease: Event.pressEvent => unit=?,
  ~onResponderStart: Event.pressEvent => unit=?,
  ~onResponderTerminate: Event.pressEvent => unit=?,
  ~onResponderTerminationRequest: Event.pressEvent => bool=?,
  ~onStartShouldSetResponder: Event.pressEvent => bool=?,
  ~onStartShouldSetResponderCapture: Event.pressEvent => bool=?,
  ~pointerEvents: View.pointerEvents=?,
  ~removeClippedSubviews: bool=?,
  ~renderToHardwareTextureAndroid: bool=?,
  ~shouldRasterizeIOS: bool=?,
  ~style: Style.t=?,
  ~testID: string=?,
  ~children: React.element=?,
  // react-native-web 0.16 View props
  ~href: string=?,
  ~hrefAttrs: Web.hrefAttrs=?,
  ~onMouseDown: ReactEvent.Mouse.t => unit=?,
  ~onMouseEnter: ReactEvent.Mouse.t => unit=?,
  ~onMouseLeave: ReactEvent.Mouse.t => unit=?,
  ~onMouseMove: ReactEvent.Mouse.t => unit=?,
  ~onMouseOver: ReactEvent.Mouse.t => unit=?,
  ~onMouseOut: ReactEvent.Mouse.t => unit=?,
  ~onMouseUp: ReactEvent.Mouse.t => unit=?,
) => React.element = "VirtualizedSectionList"
