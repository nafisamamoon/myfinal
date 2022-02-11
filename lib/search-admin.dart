import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/admin-home.dart';
import 'package:project/patient-for-search-admin.dart';
class SearchAdmin extends StatefulWidget {
  const SearchAdmin({ Key? key }) : super(key: key);

  @override
  _SearchAdminState createState() => _SearchAdminState();
}

class _SearchAdminState extends State<SearchAdmin> {
  final TextEditingController _filter=new TextEditingController();
  String _searchText="";
  List names=[];
  List filterNames=[];
  Icon _searchIcon=new Icon(Icons.search);
  Widget _appbartitle=new Text('Search For Patient');
  void _getName()async{
    var response=await http.get(Uri.parse('http://192.168.2.189:8000/api/allpatient'));
    var i=jsonDecode(response.body);
    print('/////////////////////////////////');
    print(i);
    List templist=[];
    for(int m=0;m<i.length;m++){
      templist.add(i[m]);
    }
    setState(() {
      names=templist;
      filterNames=names;
    });
    print('********************');
    print(templist);
  }
  @override
  void initState() {
    _getName();
    // TODO: implement initState
    super.initState();
  }
  void _searchPreased(){
 setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appbartitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appbartitle = new Text('Search For Patient');
        filterNames = names;
        _filter.clear();
      }
    });
  }
  _SearchAdminState(){
       _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filterNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }
   Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = [];
      for (int i = 0; i < filterNames.length; i++) {
        if (filterNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filterNames[i]);
        }
      }
      filterNames = tempList;
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: names == null ? 0 : filterNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filterNames[index]['name']),
          onTap: (){
            print(filterNames[index]['id']);
            int m=filterNames[index]['id'];
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientForSearchAdmin(id: filterNames[index]['id'],)));
          }
        );
      },
    );
  }
  PreferredSizeWidget _buildBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      title: _appbartitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPreased,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child:Column(
          children: [
            _buildList(),
            ElevatedButton(
                    onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHome()));
                    },
                    child: Text('Back',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      fixedSize: Size(250, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    ),
          ],
        ) ,
        ),
        resizeToAvoidBottomInset: false,
    );
  }
}