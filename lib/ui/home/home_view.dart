import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kaboshi_flutter_project/provider/home_future_provider.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModelFutureProvider = useProvider(homeViewModelFutureProvider);
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          elevation: 0,
          centerTitle: true,
          title: Text('Riverpod Recommended Movies'),
          actions: [
            // DarkModeSwitcher(),
          ],
        ),
        body: viewModelFutureProvider.when(
          error: (e, s) {

          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          // when data comes...
          data: (movies) {
            return RefreshIndicator(
              onRefresh: () {
                return context.refresh(homeViewModelFutureProvider);
              },
              // actual UI
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(

                    ),
                  );
                },
                child: GridView.extent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
