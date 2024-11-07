pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs

import Origin

ApplicationWindow {
  id: root
  width: 1920
  height: 1080
  visible: true
  title: qsTr("Sandbox")

  font.pointSize: 10
  palette: theme.dark

  Themes {
    id: theme
  }

  header: ToolBar {
    implicitHeight: 32

    RowLayout {
      anchors.fill: parent
      anchors.topMargin: 1
      anchors.bottomMargin: 1
      spacing: 1

      ToolButton {
        Layout.fillHeight: true

        text: "<"

        onClicked: {
          if (view.currentIndex > 0) {
            view.currentIndex--
          }
        }
      }

      Pane {
        padding: 0
        Layout.fillWidth: true
        Layout.fillHeight: true

        Label {
          anchors.fill: parent
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: view.itemAt(view.currentIndex).title
        }
      }


      ToolButton {
        Layout.fillHeight: true

        text: ">"

        onClicked: {
          if (view.currentIndex < (view.count - 1)) {
            view.currentIndex++
          }
        }
      }
    }
  } // header

  footer: Item {
    implicitHeight: 32

    PageIndicator {
      id: indicator
      anchors.centerIn: parent

      count: view.count
      currentIndex: view.currentIndex
    }
  } // footer


  menuBar: MenuBar {
    Menu {
      title: qsTr("&File")
      MenuItem {
        text: qsTr("Test")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
        checkable: true
      }

      Action { text: qsTr("&New...") }
      Action {
        text: qsTr("&Open...")
        onTriggered: fileDialog.open()
      }
      Action { text: qsTr("&Save") }
      Action { text: qsTr("Save &As...") }
      MenuSeparator { }
      Action { text: qsTr("&Quit") }
    }
    Menu {
      title: qsTr("&Edit")
      Action { text: qsTr("Cu&t") }
      Action { text: qsTr("&Copy") }
      Action { text: qsTr("&Paste") }
    }
    Menu {
      title: qsTr("&Help")
      Action { text: qsTr("&About") }
    }
  } // menuBar





  SwipeView {
    id: view

    anchors.fill: parent

    Page1 {}
    Page2 {
      dialog: dialog
      popup: popup
    }
    Page3 {}
  }

  Popup {
    id: popup
    anchors.centerIn: Overlay.overlay

    Rectangle {
      anchors.fill: parent
      color: "black"
      opacity: 0.1
      Label {
        anchors.centerIn: parent
        text: "Popup"
        font.pointSize: 18
        opacity: 1
      }
    }

  }

  Dialog {
    id: dialog
    anchors.centerIn: Overlay.overlay
    // popupType: Popup.Window
    modal: true
    title: "Dialog"
    standardButtons: Dialog.Ok | Dialog.Cancel

    icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"

    GridLayout {
      anchors.fill: parent
      columns: 4

      Repeater {
        model: 16
        delegate: Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          color: "silver"
          opacity: 0.1
        }
      }
    }
  }

  FileDialog {
    id: fileDialog
    title: qsTr("Open File")
    options: FileDialog.DontUseNativeDialog
    fileMode: FileDialog.SaveFile
    // fileMode: FileDialog.OpenFile
  }

}
