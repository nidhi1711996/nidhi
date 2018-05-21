import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.3
import QtMultimedia 5.0

Window {
    visible: true
    property bool video: true
    id: root
    width: 640
    height: 480
    title: qsTr("Image Video Animation")
    signal video_image
    Column {
        Row {
            id: tools

            Button {
                text: "Reset"
                onClicked:{
                    display.source= "build-QTqml-Desktop_Qt_5_10_0_GCC_64bit-Debug/images/video.gif"
                    console.log("reset to play video")
                    display.fillMode = Image.Stretch
                    display.width = viewport.width
                    display.height = viewport.height
                    display.anchors.centerIn = viewport
                    display.clip = false
                    }
                }
            Button {
                text: "PreserveAspectfit"
                onClicked:{
                    display.fillMode = Image.PreserveAspectFit
                    display.width = 400
                    display.height = 400
                }
            }
            Button {
                text: "TileHorizontally"
                onClicked:{
                    display.fillMode = Image.TileHorizontally
                    display.width = viewport.width
                    display.height = viewport.height
                }
            }
            Button {
                text: "TileVertically"
                onClicked:{
                    display.fillMode = Image.TileVertically
                    display.width = viewport.width
                    display.height = viewport.height
                }
            }
        }
}
      Rectangle {
        id: viewport
        width: 325
        height: 200
        color: "#7483f2"
        border.width: 1
        border.color: "red"
        radius:20
        anchors.centerIn: parent

        /* Rectangle {
            id: doo
            width: 323
            height: 20
            color: "#7483f2"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2*/

         Video {
                 id: display
                 anchors.centerIn: parent
                 //source: "/build-QTqml-Desktop_Qt_5_10_0_GCC_64bit-Debug/images/video.gif"
                 onStatusChanged: {
                    if(status == MediaPlayer.Loaded){
                        console.log(metaData.duration)
                    }
                }
         }
         VideoOutput {
             anchors.fill: parent
             source: Video
         }

        /* Image {
                 id: display1
                 anchors.centerIn: parent
                 source: "/build-QTqml-Desktop_Qt_5_10_0_GCC_64bit-Debug/images/TM_still.png"
         }*/

}
}
