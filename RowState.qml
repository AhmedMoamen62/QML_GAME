import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    // set alias propeties to change rect and text components when it's setted
    // we can use signal and slots here but it's very simple
    property alias rect_text: text_id.text
    property alias rect_width: rect_id.width
    property alias rect_color: rect_id.color

    // define variables for each width in different states
    property int normal_width: 10
    property int hovered_width: 25
    property int clicked_width: 30

    // define variables for each color in different states
    property string normal_color: "red"
    property string clicked_color: "green"

    // set a string to know the current state, by default it's normal
    property string row_state: "normal"
    Rectangle {
        id: rect_id
        // set the height of the rect to be the height of the text plus small margin
        height: text_id.height + 10
        // set the default width
        width: normal_width
    }
    Text {
        id: text_id
        // set the default pixel size as required
        font.pixelSize: 16
        // set the anchors of the tex to be associated with the rect
        anchors.left: rect_id.right
        // set margin
        anchors.leftMargin: 5
    }
    MouseArea{
        // define the mouse area to fill the hole row
        anchors.fill: parent
        // enabling hover
        hoverEnabled: true

        // define the acceptable buttons of the mouse
        acceptedButtons: Qt.LeftButton

        // handling havering and check if the current state isn't clicked
        onEntered: {
            if(row_state != "clicked"){
                rect_width = hovered_width
                rect_color = normal_color
                row_state = "hovered"
            }
        }
        // set row in normal state and check if the current state isn't clicked
        onExited: {
            if(row_state != "clicked"){
                rect_width = normal_width
                rect_color = normal_color
                row_state = "normal"
            }
        }
        // handling clicked state
        onClicked: {
            // if the current state isn't clicked, set it to be clicked
            if(row_state != "clicked"){
                rect_width = clicked_width
                rect_color = clicked_color
                row_state = "clicked"
            }
            // if the current state is clicked, set it in hovered mode
            else{
                rect_width = hovered_width
                rect_color = normal_color
                row_state = "hovered"
            }
        }
    }
}
