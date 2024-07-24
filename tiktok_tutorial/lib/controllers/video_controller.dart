

List<Video> get videolist => _videoList.value;

@override
void onInit(){
  super.onInit();
  _videoList.bindStream(
      firestore.collection('videos').snapshots().map((QuerySnapshot query){
        List<videos> retVal = [];
        for (var element in query.docs){
          retval.add (
            Video.fromSnap(element),
          );
        }
        return retVal;
      }))

  likeVideo (String id) async {
    DocumentSnapshot doc = awai firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if(doc.data()! as dynamic)['Likes'].contains((uid)){
      await firestore.collection('videos').doc(id).update({
        'likes': Fieldvalue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
      'likes': Fieldvalue.arrayUnion([uid]),
    });
    }
  }
}