import QtQuick 2.1
import QtQuick.Window 2.1
import Deepin.Widgets 1.0

Window {
    id: rootWindow
    color: "transparent"
    flags: Qt.Popup | Qt.WindowStaysOnTopHint

    x: screenSize.x + screenSize.width - width
    y: screenSize.y
    width: 0
    height: screenSize.height

    property int displayWidth: 0

    property var dconstants: DConstants {}
    property var listModelComponent: DListModelComponent {}
    property bool clickedToHide: true

    function showModule(moduleId){
        panelContent.moduleIconList.iconClickAction(moduleId)
    }

    function showTrayOrPanel() {
        if(clickedToHide){
            if(!showAll.running && rootWindow.width != panelWidth){
                showAll.start()
            }
        }
    }

    function hideTrayIcon() {
        if(clickedToHide){
            if(!hideAll.running){
                if(showAll.running){
                    showAll.stop()
                }
                hideAll.start()
            }
        }
    }

    function showAllImmediately(){
        rootWindow.width = panelWidth + 16
        rootWindow.show()
        rootWindow.displayWidth = panelWidth
    }

    function hideAllImmediately(){
        rootWindow.width = 0
        rootWindow.hide()
        rootWindow.displayWidth = 0
    }

    PropertyAnimation {
        id: hideAll
        duration: 150
        target: rootWindow
        properties: "displayWidth"
        to: 0

        onStopped: {
            rootWindow.width = 0
            rootWindow.hide()
        }
    }

    SmoothedAnimation {
        id: showAll
        duration: 150
        target: rootWindow
        properties: "displayWidth"
        to: panelWidth

        onStarted: {
            rootWindow.width = panelWidth + 16
            rootWindow.show()
        }
    }

    Rectangle {
        id: frame
        color: dconstants.bgColor

        width: panelWidth
        height: parent.height
        x: rootWindow.width - displayWidth

        PanelContent {
            id: panelContent
            width: parent.width
            height: parent.height
        }
    }

    Image {
        anchors.right: frame.left
        width: 16
        height: parent.height
        source: "images/shadow.png"
    }
}
