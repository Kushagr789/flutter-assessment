import 'package:Kushagra/data/data.dart';
import 'package:Kushagra/resources/colors.dart';
import 'package:Kushagra/resources/components/backButton.dart';
import 'package:Kushagra/resources/components/listItem.dart';
import 'package:Kushagra/resources/components/searchBar.dart';
import 'package:Kushagra/view/phone.dart';
import 'package:flutter/material.dart';
import 'package:Kushagra/view_model/CountryViewModel.dart';
import 'package:provider/provider.dart';
class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    final viewModel = Provider.of<CountryViewModel>(context);
    final view=CountryViewModel();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30,right: 30,top: 50),
        color: AppColors.main,
        width: double.infinity,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButtonCustom(),
              ],
            ),
            SizedBox(height: 20,),
            Text("Select your country",style: TextStyle(color: AppColors.textMain,fontSize: 24),),
            SizedBox(height: 20,),
            SearchBarWidget(),
            SizedBox(height: 10,),
            Expanded(
              child: FutureBuilder(future: viewModel.fetchCountries(),
                  builder: (context,snapShot){
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: viewModel.filterCountries.length,
                    itemBuilder: (context,index){
                      final country = viewModel.filterCountries[index];
                      return InkWell(child: ListItem(flagUrl: country.flag, name: country.name, code: country.telCode),
                      onTap: (){
                        Data.flag=country.flag;
                        Data.teleCode=country.telCode;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneNumScreen()));
                      },);
                    },
                  );
                }
              ),
            )


          ],
        )
      ),
    );
  }


}
