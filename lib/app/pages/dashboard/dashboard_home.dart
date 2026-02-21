import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_divider.dart';
import 'package:trufapp/app/core/components/dashboard_card.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Casa',
              color: AppColors.darkMocha240,
              fontSize: 28,
              fontWeight: AppFontsWeight.bold,
            ),
            SizedBox(height: 8),
            MasonryGridView(
              shrinkWrap: true,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                DashboardCard(
                  texto: 'Estoque',
                  quantidade: '10',
                  cardClaro: false,
                ),
                DashboardCard(
                  texto: 'Vendas do dia',
                  quantidade: '3',
                  cardClaro: false,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Estoque por produto',
                  color: AppColors.darkMocha240,
                  fontSize: 18,
                  fontWeight: AppFontsWeight.light,
                ),
                Icon(LucideIcons.funnel),
              ],
            ),
            SizedBox(height: 8),
            CustomDivider(),
            Expanded(
              child: MasonryGridView(
                padding: EdgeInsets.only(bottom: 92, top: 12),
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Beijinho',
                    quantidade: '2',
                    cardClaro: true,
                  ),
                  DashboardCard(
                    texto: 'Chocolate',
                    quantidade: '3',
                    cardClaro: true,
                  ),
                ],
              ),
            ),
            // GridView.count(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   primary: false,
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            //   crossAxisCount: 2,
            //   mainAxisExtent: 160,
            //   children: <Widget>[
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Beijinho',
            //       quantidade: '2',
            //       cardClaro: true,
            //     ),
            //     DashboardCard(
            //       texto: 'Chocolate',
            //       quantidade: '3',
            //       cardClaro: true,
            //     ),
            //   ],
            // ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     spacing: 10,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           DashboardCard(texto: 'Beijinho', quantidade: '2', cardClaro: true,),
            //           DashboardCard(texto: 'Chocolate', quantidade: '3', cardClaro: true,)
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           DashboardCard(texto: 'Chocolate', quantidade: '3', cardClaro: true,),
            //           DashboardCard(texto: 'Maracujá', quantidade: '1', cardClaro: true,),

            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           DashboardCard(texto: 'Chocolate', quantidade: '3', cardClaro: true,),
            //           DashboardCard(texto: 'Maracujá', quantidade: '1', cardClaro: true,),

            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           DashboardCard(texto: 'Chocolate', quantidade: '3', cardClaro: true,),
            //           DashboardCard(texto: 'Maracujá', quantidade: '1', cardClaro: true,),

            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
