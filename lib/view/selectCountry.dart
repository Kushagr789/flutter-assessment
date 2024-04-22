import 'package:Kushagra/resources/colors.dart';
import 'package:Kushagra/resources/components/country.dart';
import 'package:Kushagra/resources/components/roundButton.dart';
import 'package:Kushagra/view_model/SelectCountryViewModel.dart';
import 'package:Kushagra/resources/components/backButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50),
          color: AppColors.main,
          width: double.infinity,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: AppColors.main,
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackButtonCustom(),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Select Country",style: TextStyle(color: AppColors.textMain,fontSize: 24),),
                      SizedBox(height: 20,),
                      Text("Please select the country where\n you want to study",style: TextStyle(color: AppColors.textRed,fontSize: 14,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),


              SizedBox(height: 150,
                  child: Consumer<SelectCountryViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.countries.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: viewModel.countries.length,
                          itemBuilder: (context, index) {
                            final country = viewModel.countries[index];
                            return GestureDetector(
                              onTap: () {
                              },
                              child: CountryBox(title: viewModel.countries[index].name,
                                  image: viewModel.countries[index].flag, status: true,
                                  onPress: (){}),
                            );
                          },
                        );}
                    },
                  ),),


              RoundButton(title: "Proceed", status: true, onPress: (){}),
              SizedBox(height: 20,),
              Text("Can’t see the country of your interest?",style: TextStyle(color: AppColors.textMain,fontSize: 12,fontWeight: FontWeight.w400),),
              SizedBox(height: 20,),
              Text("Consult with us",style: TextStyle(color: AppColors.textRed,fontSize: 18,fontWeight: FontWeight.w500),),




            ],
          )
      ),
    );
  }
}
