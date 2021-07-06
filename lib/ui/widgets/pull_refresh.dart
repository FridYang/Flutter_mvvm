import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'over_scroll_behavior.dart';

class PullRefresh extends StatelessWidget {
  final RefreshController controller;
  final VoidCallback onRefresh;
  final Widget content;

  PullRefresh({this.controller, this.onRefresh,  this.content});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      context: context,
      child: RefreshConfiguration.copyAncestor(
        context: context,
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: SmartRefresher(
            controller: this.controller,
            enablePullDown: true,
            enablePullUp: true,
            header: CustomHeader(
              builder: (BuildContext context, RefreshStatus mode) {
                Widget body;
                if (mode == RefreshStatus.canRefresh) {
                  body = textIndicator("松开刷新");
                } else if (mode == RefreshStatus.refreshing) {
                  body = textIndicator("加载中...");
                } else if (mode == RefreshStatus.idle) {
                  body = textIndicator("下拉刷新");
                } else if (mode == RefreshStatus.completed) {
                  body = textIndicator("加载成功");
                }
                return Container(
                  padding: EdgeInsets.only(top: 6),
                  height: 76,
                  child: Center(
                    child: body,
                  ),
                );
              },
            ),
            onRefresh: this.onRefresh,
            child: this.content,
          ),
        ),
        enableLoadingWhenFailed: true,
        maxUnderScrollExtent: 100.0,
        footerTriggerDistance: -45.0,
      ),
      enableLoadingWhenFailed: true,
      footerTriggerDistance: -60.0,
    );
  }

  Widget textIndicator(String statusStr) {
    return Container(
      child: Stack(
        children: [
          Lottie.asset(
            'assets/json/loading2.json',
            width: 96,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: -2,
            left: 24,
            right: 0,
            child: Text(
              statusStr,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
