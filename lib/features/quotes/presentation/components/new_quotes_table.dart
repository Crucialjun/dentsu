import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:dentsu/features/quotes/presentation/quotes/bloc/quotes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';

class NewQuotesTable extends StatelessWidget {
  const NewQuotesTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      width: double.infinity,
      child: BlocBuilder<QuotesBloc, QuotesState>(
        builder: (context, state) {
          if (state is QuotesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is QuotesError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is QuotesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: const Row(
                    children: [
                      Text("New Quotes",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: DataTable(
                    showCheckboxColumn: false,
                    columnSpacing: 74.w,
                    columns: const [
                      DataColumn(
                          label: Text(
                        "#",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                      DataColumn(
                          label: Text("Customer Name",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ))),
                    ],
                    rows: state.quotes
                        .map((e) => DataRow(
                                onSelectChanged: (val) {
                                  context
                                      .read<QuotesBloc>()
                                      .add(OnQuoteSelectedEvent(quote: e));
                                },
                                color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (e.index?.isEven ?? false) {
                                      return Colors.white;
                                    } else {
                                      return AppColors.tableOddBackgroundColor;
                                    }
                                  },
                                ),
                                cells: [
                                  DataCell(Text(e.index.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ))),
                                  DataCell(Text("${e.firstName}${e.lastName}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ))),
                                ]))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 42.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 42.w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Showing ${(state.currentPage) * 10 - 9} to ${(state.currentPage) * 10} of ${state.totalQuotes}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 42.w,
                  ),
                  child: NumberPaginator(
                    onPageChange: (int page) {
                      context
                          .read<QuotesBloc>()
                          .add(QuotesPaginationPageChangedEvent(page: page));
                    },
                    initialPage: state.currentPage - 1,
                    numberPages: state.totalQuotes ~/ 10,
                    config: const NumberPaginatorUIConfig(
                        buttonTextStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        buttonUnselectedForegroundColor: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
