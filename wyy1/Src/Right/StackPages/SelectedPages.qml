import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Text {
        id: selectedPages
        Item {
            anchors.fill: parent
            anchors.leftMargin: 36
            anchors.rightMargin: 24
            Flow {
                id: titleFlow
                anchors.left: parent.left
                anchors.top: parent.top
                height: 25
                spacing: 20
                Repeater {
                    id: selectorRep
                    anchors.fill: parent
                    model: ["精选", "歌单广场", "排行榜", "歌手"]
                    property int selectedIndex: 0
                    Behavior on opacity {
                        PropertyAnimation{
                            duration: 200
                        }
                    }
                    Item {
                        height: 40
                        width: selectorLabel.implicitWidth + 10
                        Label {
                            id: selectorLabel
                            text: modelData
                            font.pixelSize: 20
                            font.bold: true
                            font.family: "黑体"
                            color: selectorRep.selectedIndex === index ? "black" : "#a1a1a3"
                            anchors.centerIn: parent
                        }
                        Rectangle {
                            visible: selectorRep.selectedIndex === index
                            anchors.left: selectorLabel.left
                            anchors.right: selectorLabel.right
                            anchors.top: selectorLabel.bottom
                            anchors.leftMargin: selectorLabel.implicitWidth / selectorLabel.font.pixelSize * 2
                            anchors.rightMargin: selectorLabel.implicitWidth / selectorLabel.font.pixelSize * 2
                            anchors.topMargin: 3
                            height: 3
                            color: "#eb4d44"
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                selectorLabel.opacity = 0.6
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                selectorLabel.opacity = 1
                            }
                            onClicked: {
                                selectorRep.selectedIndex = index
                            }
                        }
                    }
                }
            }
        }
    }
}
