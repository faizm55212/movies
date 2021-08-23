import 'package:flutter/material.dart';
import 'package:movies/controllers/movies_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final movieController = Get.find<MovieController>();

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Appbar',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Company Info',
                content: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Company: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 180.0,
                          child: Text(
                            'Geeksynergy Technologies Pvt Ltd',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Address: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 180.0,
                          child: Text(
                            'Sanjaynagar, Bengaluru-56',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 180.0,
                          child: Text(
                            'xxxxxxxx09',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Email: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 180.0,
                          child: Text(
                            'xxxxx@gmail.com',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: movieController.movieList.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.arrow_drop_up),
                        Text((movieController.movieList[index].upVoted.length -
                                movieController
                                    .movieList[index].downVoted.length)
                            .toString()),
                        Icon(Icons.arrow_drop_down),
                        Text('votes'),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: 70.0,
                            height: 110.0,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(movieController
                                        .movieList[index].poster))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            movieController.movieList[index].title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Genre: ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                movieController.movieList[index].genre,
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Director: ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                movieController.movieList[index].director.first,
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Starring: ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                movieController.movieList[index].stars.first,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${movieController.movieList[index].runTime}' +
                                    " Min | kannada | ",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            Text(DateFormat('dd-MMM-yyyy')
                                .format(DateTime.fromMicrosecondsSinceEpoch(
                                    movieController
                                            .movieList[index].releasedDate *
                                        1000000))
                                .toString()),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${movieController.movieList[index].pageViews}' +
                                    " views | Voted by ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blue)),
                            Text(
                              (movieController.movieList[index].downVoted
                                              .length +
                                          movieController
                                              .movieList[index].upVoted.length)
                                      .toString() +
                                  " peoples",
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
