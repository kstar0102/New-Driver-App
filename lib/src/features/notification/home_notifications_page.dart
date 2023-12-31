import 'dart:developer' as developer;
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'package:alwali_driver/src/features/notification/home_notifications_controller.dart';
import 'package:alwali_driver/src/features/notification/notif_card.dart';
import 'package:alwali_driver/src/utils/async_value_ui.dart';
import 'package:alwali_driver/src/widgets/progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../trip/trips_list_controller.dart';

class HomeNotificationsPage extends ConsumerStatefulWidget {
  const HomeNotificationsPage({super.key});

  @override
  ConsumerState<HomeNotificationsPage> createState() =>
      _HomeNotificationsPageState();
}

class _HomeNotificationsPageState extends ConsumerState<HomeNotificationsPage> {
  final int _perPage = 10;
  int _page = 1;
  bool _isLoading = true;
  final ScrollController _scrollController = new ScrollController();
  bool _dateType = true;

  getDateType() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _dateType = sharedPreferences.getBool("dateType") ?? true;
  }

  @override
  void initState() {
    super.initState();
    getDateType();
    // ref.read(todayTripsListCtrProvider.notifier).doFetchTrips();
    ref.read(pastTripsListCtrProvider.notifier).doFetchTrips();
    _scrollController.addListener(_scrollListener);
    ref.read(homeNotificationsCtrProvider.notifier).doFetchNotifs();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
        homeNotificationsCtrProvider.select((state) => state),
        (_, state) => state.showAlertDialogOnError(context));

    final state = ref.watch(homeNotificationsCtrProvider);
    final notis = state.value?.take(_perPage * _page).toList();
    _isLoading = _page == 1 ? state.isLoading : _isLoading;
    developer.log('NotifListView::build() - state=${state.isLoading}');
    developer.log('NotifListView::build() - state=${state.toString()}');
    final borderRadius = BorderRadius.circular(20.w);
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(homeNotificationsCtrProvider.notifier).doFetchNotifs();
        // setState(() {
        //   _page = 1;
        // });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(90.w),
          ),
        ),
        child: ProgressHUD(
          inAsyncCall: _isLoading,
          child: notis != null && notis.isNotEmpty
              ? GroupedListView(
                  controller: _scrollController,
                  elements: notis,
                  groupBy: (notif) => notif.notifyDate,
                  order: GroupedListOrder.DESC,
                  groupSeparatorBuilder: (value) {
                    final now = DateTime.now();
                    final today = DateTime(now.year, now.month, now.day);
                    final yesterday =
                        DateTime(now.year, now.month, now.day - 1);
                    final valueDate =
                        DateTime(value.year, value.month, value.day);

                    final String dateText;
                    if (valueDate == today) {
                      dateText = _dateType
                          ? 'Today, ${DateFormat('dd/MM/yyyy').format(valueDate)}'
                          : 'Today, ${DateFormat('MM/dd/yyyy').format(valueDate)}';
                    } else if (valueDate == yesterday) {
                      dateText = _dateType
                          ? 'Yesterday, ${DateFormat('dd/MM/yyyy').format(valueDate)}'
                          : 'Yesterday, ${DateFormat('MM/dd/yyyy').format(valueDate)}';
                    } else {
                      dateText = _dateType
                          ? DateFormat('E, dd/MM/yyyy').format(valueDate)
                          : DateFormat('E, dd/MM/yyyy').format(valueDate);
                    }
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 100.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(child: Divider(color: Colors.black)),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              dateText,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 32.sp,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider(color: Colors.black)),
                        ],
                      ),
                    );
                  },
                  itemBuilder: (context, element) {
                    return GestureDetector(
                      onTap: () {},
                      child: NotifCard(
                        info: element,
                        onPressed: () {},
                      ),
                    );
                  },
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 1.h),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Material(
                            borderRadius: borderRadius,
                            child: InkWell(
                              borderRadius: borderRadius,
                              onTap: null, //onPressed,
                              child: Container(
                                height: MediaQuery.of(context).size.height /1.3,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                                child: Center(
                                  child: Text("No data", style: TextStyle(fontSize: 15),)
                                  ),
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
    }
  }
}
