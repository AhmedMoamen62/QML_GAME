import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3

Window {
    id: game
    visible: true
    width: 600
    height: 500
    color: "white"
    title: qsTr("QML Game")
    // define column layout to configure the 3 states
    ColumnLayout{
        // set anchor and margins
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: parent.width * 0.05
        anchors.bottomMargin: parent.height * 0.2
        // define 3 row states
        RowState{
            rect_text: "Play"
            rect_width: 10
            rect_color: "red"
        }
        RowState{
            rect_text: "Settings"
            rect_width: 10
            rect_color: "red"
        }
        RowState{
            rect_text: "Quit"
            rect_width: 10
            rect_color: "red"
        }
    }
}
