import 'package:flag_with_provider/controller/flag_controller.dart';
import 'package:flag_with_provider/model/flag_model.dart';
import 'package:flag_with_provider/repository/res/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FlagController flagController=FlagController();
  String query='';

  @override
  void initState() {
    flagController.FetchFlag();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<FlagController>(context,listen: false);
    provider.FetchFlag();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Country Flags"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 15),
            child: TextField(
              onChanged: (value){
                setState(() {
                  query=value.toString();
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                border:OutlineInputBorder()
              ),
            ),
          ),

          Expanded(child:Consumer<FlagController>(builder: (context, flag, child) {
            switch (flag.flagList.status!) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                return Center(
                  child: Text(flag.flagList.msg!.toString()),
                );
              case Status.COMPLETE:
                List data=provider.queryFlag(query);
                return ListView.builder(
                    itemCount:data.length,
                    itemBuilder: (_, index) {
                      Data flags = data[index];
                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.amber),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SvgPicture.network(
                              flags.flag != null ? flags.flag! : "",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(flags.name!),
                        trailing: Text(flags.iso3!),
                      );
                    });
            }
          })),
        ],
      ),
    );
  }
}
