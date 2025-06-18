import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../generated/assets.dart';
import 'empty_view.dart';

class PaginationListView<PageKeyType, ItemType> extends StatelessWidget {
  final PagingController<PageKeyType, ItemType>? pagingController;
  final IndexedWidgetBuilder? separatorBuilder;

  final ItemWidgetBuilder<ItemType> itemBuilder;

  /// The builder for the first page's error indicator.
  final WidgetBuilder? firstPageErrorIndicatorBuilder;

  /// The builder for a new page's error indicator.
  final WidgetBuilder? newPageErrorIndicatorBuilder;

  /// The builder for the first page's progress indicator.
  final WidgetBuilder? firstPageProgressIndicatorBuilder;

  /// The builder for a new page's progress indicator.
  final WidgetBuilder? newPageProgressIndicatorBuilder;

  /// The builder for a no items list indicator.
  final WidgetBuilder? noItemsFoundIndicatorBuilder;

  /// The builder for an indicator that all items have been fetched.
  final WidgetBuilder? noMoreItemsIndicatorBuilder;

  /// Whether status transitions should be animated.
  final bool animateTransitions;

  /// The duration of animated transitions when [animateTransitions] is `true`.
  final Duration transitionDuration;

  // Matches [ScrollView.controller].
  final ScrollController? scrollController;

  // Matches [ScrollView.scrollDirection].
  final Axis scrollDirection = Axis.vertical;

  // Matches [ScrollView.physics].
  final ScrollPhysics? physics;

  // Matches [ScrollView.shrinkWrap].
  final bool shrinkWrap;

  // Matches [BoxScrollView.padding].
  final EdgeInsetsGeometry? padding;

  /// The function to fetch the next page.
  final Function() fetchNextPage;

  /// The state of the paging controller.
  final PagingState<PageKeyType, ItemType> state;

  const PaginationListView({
    super.key,
    this.pagingController,
    required this.fetchNextPage,
    required this.state,
    this.separatorBuilder,
    required this.itemBuilder,
    this.firstPageErrorIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.noMoreItemsIndicatorBuilder,
    this.animateTransitions = false,
    this.transitionDuration = const Duration(milliseconds: 250),
    this.scrollController,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      scrollController: scrollController,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      padding: padding,
      physics: physics,
      fetchNextPage: fetchNextPage,
      state: state,
      builderDelegate: PagedChildBuilderDelegate<ItemType>(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: firstPageErrorIndicatorBuilder,
        newPageErrorIndicatorBuilder: newPageErrorIndicatorBuilder,
        firstPageProgressIndicatorBuilder:
            firstPageProgressIndicatorBuilder ??
            (context) => Skeletonizer(
              child: Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Skeletonizer(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 24.r,
                          backgroundImage: AssetImage(Assets.iconsEmpty),
                        ),
                        title: Text("itemjhkjhkjhkjhkjkjkjkjk$index"),
                        subtitle: Text("itemkjhjhkjhkjhhkj$index"),
                      ),
                    ),
                  );
                }),
              ),
            ),
        newPageProgressIndicatorBuilder:
            newPageProgressIndicatorBuilder ?? (context) => Center(child: const CircularProgressIndicator()),
        noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder ?? (_) => EmptyView(
          height: .5.sh,
          title: "No items found",
          image: Assets.iconsEmpty,
        ),
        noMoreItemsIndicatorBuilder: noMoreItemsIndicatorBuilder,
        animateTransitions: animateTransitions,
        transitionDuration: transitionDuration,
      ),
      separatorBuilder: separatorBuilder ?? (context, index) => 16.verticalSpace,
    );
  }
}
