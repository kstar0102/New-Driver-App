import 'package:alwali_driver/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alwali_driver/src/features/profile/supervisor_card.dart';
import 'package:alwali_driver/src/features/profile/profile_controllers.dart';
import 'package:alwali_driver/src/widgets/progress_hud.dart';
import 'package:alwali_driver/src/constants/app_styles.dart';
import 'package:go_router/go_router.dart';

class SuperVisorCallScreen extends ConsumerStatefulWidget {
  const SuperVisorCallScreen({super.key});

  @override
  ConsumerState<SuperVisorCallScreen> createState() => _SuperVisorCallScreen();
}

class _SuperVisorCallScreen extends ConsumerState<SuperVisorCallScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(superVisorCtrProvider.notifier).doFetchSuperVisors();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(superVisorCtrProvider.select((state) => state),
        (_, state) => state.showAlertDialogOnError(context));
    final state = ref.watch(superVisorCtrProvider);
    final visors = state.value;

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.read(superVisorCtrProvider.notifier).doFetchSuperVisors();
            await Future.delayed(Duration(seconds: 2));
          },
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            decoration: kBgDecoration,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    height: 260.h,
                    child: Image.asset('assets/images/home_icon.png'),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90.w),
                        ),
                      ),
                      child: ProgressHUD(
                        inAsyncCall: state.isLoading,
                        child: ListView.separated(
                          itemCount: visors?.length ?? 0,
                          itemBuilder: (BuildContext context, int itemIdx) {
                            return ProgressHUD(
                              inAsyncCall: state.isLoading,
                              child: SuperVisorCard(
                                info: visors!.elementAt(itemIdx),
                                onPressed: () {},
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 30.h),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.all(24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: const Offset(0, 25),
              )
            ],
          ),
          child: (Padding(
            padding: EdgeInsets.all(24.h),
          )),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 95.h),
        child: SizedBox(
          height: 138.h,
          child: IconButton(
            onPressed: () => context.pop(),
            //iconSize: 89.h,
            icon: Image.asset('assets/images/btn_back.png'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
