import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.3

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
                    display.fillMode = Image.Stretch
                    display.width = 100
                    display.height = 150
                    display.anchors.centerIn = viewport
                    display.clip = false
                    }
                }
            Button {
                text: "strech"
                onClicked:{
                    display.fillMode = Image.Stretch
                    display.width = 200
                    display.height = 20
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
            MouseArea {
                    id: mousearea
                    anchors.fill: parent
                    onClicked: console.log("MouseArea clicked")
                }

        }
}

onVideo_image: {
    if(video == true) {
      Rectangle {
        id: viewport}
        width: 200; height: 200

         AnimatedImage {
                 id: display
                 anchors.centerIn: parent
                 source: "/build-QTqml-Desktop_Qt_5_10_0_GCC_64bit-Debug/images/video.gif"
         }
        }
    }else {
         Image {
                 id: display1
                 anchors.centerIn: parent
                 source: "/build-QTqml-Desktop_Qt_5_10_0_GCC_64bit-Debug/images/TM_still.png"
         }
        }
}

}



