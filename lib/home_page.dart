import 'package:flutter/material.dart';
import 'package:xoxo/config/color/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTurn = true;

  List<String> displayElement = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor,
      appBar: AppBar(
        title: Text('XOXO'),
        centerTitle: true,
        backgroundColor: AppColor.mainAppColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: const Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Player X",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 39,
                      ),
                      Column(
                        children: [
                          Text(
                            "Player 0",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text(
                            displayElement[index],
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  })),
          Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.indigo[50]
                            )
                        ),
                        onPressed: () =>
                        _clearScoreBoard,
                        child: Text(
                          'Clear Score Board',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
    void _tapped(int index) {
      setState(() {
        if (onTurn && displayElement[index] == " ") {
          displayElement[index] = "0";
          filledBoxes++;
        } else if (onTurn && displayElement[index] == " ") {
          displayElement[index] = "X";
          filledBoxes++;
        }
        onTurn = !onTurn;
        _checkWinner;
      });
    }

  void _checkWinner(){

    if(displayElement[0] == displayElement[1] &&
    displayElement[0] == displayElement[2] &&
    displayElement[0] != ''){
      _showWinDialog(displayElement[0]);
    }
    if(displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[7] &&
        displayElement[3] != ''){
      _showWinDialog(displayElement[3]);
    }
    if(displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != ''){
      _showWinDialog(displayElement[6]);
    }

    if(displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != ''){
      _showWinDialog(displayElement[0]);
    }
    if(displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != ''){
      _showWinDialog(displayElement[1]);
    }
    if(displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != ''){
      _showWinDialog(displayElement[2]);
    }

    if(displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != ''){
      _showWinDialog(displayElement[0]);
    }
    if(displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != ''){
      _showWinDialog(displayElement[2]);
    }else if(filledBoxes==9){
      _showDrawDialog();
    }
  }
void _showWinDialog(String winner){
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              ElevatedButton(
          child: Text('Play again'),
                  onPressed: (){
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
              ),
                  ]
          );
        }
        );
      if(winner=="0"){
        oScore++;
      }else if(winner == "X"){
        xScore++;
      }
}

void _showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context ){
          return AlertDialog(
            title: Text('Draw'),
            actions: [
              ElevatedButton(
                  onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              }, child: Text('Play Again'))
            ],
          );
    });
}

void _clearBoard(){
    setState(() {
      for(int i=0;i<9;i++){
        displayElement[i]="";
      }
    });
    filledBoxes=0;
}

void _clearScoreBoard(){
    setState(() {
      oScore=0;
      xScore=0;
      for(int i=0;i<9;i++){
        displayElement[i]='';
      }
    });
    filledBoxes=0;
}
}
