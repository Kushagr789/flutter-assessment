import 'package:assessment/resources/colors.dart';
import 'package:assessment/view_model/CountryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel= Provider.of<CountryViewModel>(context);

    return Container(
      height: 50,
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: AppColors.textRed,
          ),
          SizedBox(width: 10),
          Expanded(
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  viewModel.search(value);
                },
              ),

          ),
        ],
      ),
    );
  }
}
