import 'dart:developer' as developer;
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alwali_driver/src/constants/app_constants.dart';
import 'package:alwali_driver/src/constants/app_styles.dart';
import 'package:alwali_driver/src/features/trip/trip_card.dart';
import 'package:alwali_driver/src/features/trip/trip.dart';
import 'package:alwali_driver/src/features/trip/trips_list_controller.dart';
import 'package:alwali_driver/src/utils/async_value_ui.dart';
import 'package:alwali_driver/src/widgets/buttons_tabbar.dart';
import 'package:alwali_driver/src/widgets/dialogs.dart';
import 'package:alwali_driver/src/widgets/progress_hud.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const kTodayFilters = [
  TripStatus.all,
  TripStatus.pending,
  TripStatus.accepted,
  TripStatus.rejected,
  TripStatus.started,
  TripStatus.finished,
  TripStatus.canceled,
];
const kPastFilters = [
  TripStatus.all,
  TripStatus.rejected,
  TripStatus.finished,
  TripStatus.canceled,
];

// * ---------------------------------------------------------------------------
// * TripsListView
// * ---------------------------------------------------------------------------

class TripsListView extends ConsumerStatefulWidget {
  const TripsListView({
    Key? key,
    required this.kind,
  }) : super(key: key);

  final TripKind kind;

  @override
  ConsumerState<TripsListView> createState() => _TripsListViewState();
}

class _TripsListViewState extends ConsumerState<TripsListView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrler;

  final _searchController = TextEditingController();

  String get searchWord => _searchController.text;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.kind == TripKind.today) {
        ref.read(todayFilterProvider.state).state = kTodayFilters[0];
      } else {
        ref.read(pastFilterProvider.state).state = kPastFilters[0];
      }
    });

    int length = 0;
    if (widget.kind == TripKind.today) {
      length = kTodayFilters.length;
    } else {
      length = kPastFilters.length;
    }
    _tabCtrler = TabController(length: length, vsync: this);
    // _tabCtrler.addListener(() {
    //   if (_tabCtrler.previousIndex != _tabCtrler.index &&
    //       !_tabCtrler.indexIsChanging) {
    //     //setState(() {}); // * rebuild body according to tab change.
    // });
  }

  @override
  void dispose() {
    _tabCtrler.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filterTabs =
        widget.kind == TripKind.today ? kTodayFilters : kPastFilters;
    const tabColor = Color(0xFFB3B3B3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: widget.kind == TripKind.today
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 60.w, right: 20.w),
                        height: 60.h,
                        child: Image.asset('assets/images/home_icon2.png'),
                      ),
                      ButtonsTabBar(
                        controller: _tabCtrler,
                        duration: 0,
                        backgroundColor: kColorPrimaryBlue,
                        unselectedBackgroundColor: Colors.transparent,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 30.sp,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 30.sp,
                        ),
                        borderWidth: 1,
                        borderColor: kColorPrimaryBlue,
                        unselectedBorderColor: tabColor,
                        radius: 100,
                        height: 70.h,
                        buttonMargin: EdgeInsets.symmetric(horizontal: 10.w),
                        // contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
                        tabs: filterTabs
                            .map(
                                (t) => Tab(text: getTabTitleFromID(t, context)))
                            .toList(),
                        onTap: (index) {
                          if (widget.kind == TripKind.today) {
                            ref.read(todayFilterProvider.state).state =
                                kTodayFilters[index];
                          } else {
                            ref.read(pastFilterProvider.state).state =
                                kPastFilters[index];
                          }
                        },
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 60.w, right: 20.w),
                            height: 60.h,
                            child: Image.asset('assets/images/home_icon2.png'),
                          ),
                          ButtonsTabBar(
                            controller: _tabCtrler,
                            duration: 0,
                            backgroundColor: kColorPrimaryBlue,
                            unselectedBackgroundColor: Colors.transparent,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 30.sp,
                            ),
                            unselectedLabelStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 30.sp,
                            ),
                            borderWidth: 1,
                            borderColor: kColorPrimaryBlue,
                            unselectedBorderColor: tabColor,
                            radius: 100,
                            height: 70.h,
                            buttonMargin:
                                EdgeInsets.symmetric(horizontal: 10.w),
                            // contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
                            tabs: filterTabs
                                .map((t) =>
                                    Tab(text: getTabTitleFromID(t, context)))
                                .toList(),
                            onTap: (index) {
                              if (widget.kind == TripKind.today) {
                                ref.read(todayFilterProvider.state).state =
                                    kTodayFilters[index];
                              } else {
                                ref.read(pastFilterProvider.state).state =
                                    kPastFilters[index];
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              hintText: AppLocalizations.of(context).search_hint,
              contentPadding: kContentPadding,
            ),
            onChanged: (String value) async {
              if (widget.kind == TripKind.today) {
                ref.read(searchFilterProvider.state).state = value;
              } else {
                ref.read(searchFilterProvider.state).state = value;
              }
            },
          ),
        ),
        Expanded(
          child: TripsListViewBody(
            kind: widget.kind,
            tabNumber: _tabCtrler.index,
          ),
        ),
      ],
    );
  }
}

// * ---------------------------------------------------------------------------
// * TripsListViewBody
// * ---------------------------------------------------------------------------

class TripsListViewBody extends ConsumerStatefulWidget {
  const TripsListViewBody({
    Key? key,
    required this.kind,
    required this.tabNumber,
  }) : super(key: key);

  final TripKind kind;
  final int tabNumber;

  @override
  ConsumerState<TripsListViewBody> createState() => _TripsTabBodyState();
}

class _TripsTabBodyState extends ConsumerState<TripsListViewBody> {
  final int _perPage = 10;
  int _page = 1;
  bool _isLoading = true;
  final ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    if (widget.kind == TripKind.today) {
      ref.read(todayTripsListCtrProvider.notifier).doFetchTrips();
    } else {
      ref.read(pastTripsListCtrProvider.notifier).doFetchTrips();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<void> state;
    TripList? trips;

    if (widget.kind == TripKind.today) {
      ref.listen<AsyncValue>(todayTripsListCtrProvider.select((state) => state),
          (_, state) => state.showAlertDialogOnError(context));

      state = ref.watch(todayTripsListCtrProvider);
      trips = ref
          .watch(todayFilteredTripsProvider)
          .value
          ?.take(_perPage * _page)
          .toList();
      _isLoading = _page == 1 ? state.isLoading : _isLoading;
    } else {
      ref.listen<AsyncValue>(pastTripsListCtrProvider.select((state) => state),
          (_, state) => state.showAlertDialogOnError(context));

      state = ref.watch(pastTripsListCtrProvider);
      trips = ref
          .watch(pastFilteredTripsProvider)
          .value
          ?.take(_perPage * _page)
          .toList();
      _isLoading = _page == 1 ? state.isLoading : _isLoading;
    }

    developer
        .log('TripsBody: type=${widget.kind}, isLoading=${state.isLoading}, '
            'trips=${trips?.length}');

    return ProgressHUD(
      inAsyncCall: _isLoading,
      child: RefreshIndicator(
        onRefresh: () async {
          if (widget.kind == TripKind.today) {
            await ref.read(todayTripsListCtrProvider.notifier).doFetchTrips();
          } else {
            await ref.read(pastTripsListCtrProvider.notifier).doFetchTrips();
          }
        },
        child: trips?.length == 0
            ? Center(child: Text(AppLocalizations.of(context).no_data))
            : ListView.separated(
                controller: _scrollController,
                itemCount: trips?.length ?? 0,
                itemBuilder: (BuildContext context, int itemIdx) {
                  return ProgressHUD(
                    inAsyncCall: state.isLoading,
                    child: TripCard(
                      info: trips!.elementAt(itemIdx),
                      onYesNo: (info, targetStatus, extra) {
                        successCallback(value) {
                          if (value == true) {
                            showOkayDialog(context, info, targetStatus);
                          }
                        }

                        if (widget.kind == TripKind.today) {
                          ref
                              .read(todayTripsListCtrProvider.notifier)
                              .doChangeTrip(info, targetStatus, extra)
                              .then(successCallback);
                        } else {
                          ref
                              .read(pastTripsListCtrProvider.notifier)
                              .doChangeTrip(info, targetStatus, extra)
                              .then(successCallback);
                        }
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 30.h),
              ),
      ),
    );
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _page++;
        _isLoading = false;
      });
      print('============${_page}');
    }
  }
}
