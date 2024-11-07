import QtQuick
import QtQuick.Layouts

import Origin

Frame {
  clip: true

  ColumnLayout {
    anchors.fill: parent
    spacing: 12

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        text: qsTr("Normal")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        text: qsTr("Button")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        text: qsTr("Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        text: qsTr("Checkable")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        checked: true
        text: qsTr("Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        enabled: false
        text: qsTr("Disabled")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        text: qsTr("Highlighted")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        highlighted: true
        text: qsTr("Button")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        highlighted: true
        text: qsTr("Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        highlighted: true
        text: qsTr("Checkable")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        checked: true
        highlighted: true
        text: qsTr("Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        highlighted: true
        enabled: false
        text: qsTr("Disabled")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        highlighted: true
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        text: qsTr("Flat")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        flat: true
        text: qsTr("Button")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        flat: true
        text: qsTr("Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        flat: true
        text: qsTr("Checkable")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        checked: true
        flat: true
        text: qsTr("Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        flat: true
        enabled: false
        text: qsTr("Disabled")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        flat: true
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        text: qsTr("Flat Highlighted")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        flat: true
        highlighted: true
        text: qsTr("Button")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        flat: true
        highlighted: true
        text: qsTr("Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        flat: true
        highlighted: true
        text: qsTr("Checkable")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        checked: true
        flat: true
        highlighted: true
        text: qsTr("Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        highlighted: true
        flat: true
        enabled: false
        text: qsTr("Disabled")
      }

      Button {
        Layout.alignment: Qt.AlignHCenter;
        highlighted: true
        flat: true
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        Layout.maximumWidth: 100
        wrapMode: Text.WordWrap
        text: qsTr("Tool Buttons in the Tool Bar")
      }

      ToolBar {
        // Layout.fillWidth: true
        position: ToolBar.Footer

        RowLayout {
          Layout.fillWidth: true
          Layout.fillHeight: true
          spacing: 1

          ToolButton {
            Layout.fillHeight: true
            text: qsTr("Button")
          }

          ToolButton {
            Layout.fillHeight: true
            text: qsTr("Button")
            icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
          }

          ToolButton {
            Layout.fillHeight: true
            checkable: true
            text: qsTr("Checkable")
          }

          ToolButton {
            Layout.fillHeight: true
            checkable: true
            text: qsTr("Checkable")
            icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
          }

          ToolButton {
            Layout.fillHeight: true
            enabled: false
            text: qsTr("Button")
          }

          ToolButton {
            Layout.fillHeight: true
            enabled: false
            text: qsTr("Disabled")
            icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
          }
        }
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        Layout.maximumWidth: 100
        wrapMode: Text.WordWrap
        text: qsTr("Tool Buttons Text Under Icon")
      }

      ToolButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.TextUnderIcon
        text: qsTr("Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      ToolButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.TextUnderIcon
        checkable: true
        text: qsTr("Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      ToolButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.TextUnderIcon
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        Layout.maximumWidth: 100
        wrapMode: Text.WordWrap
        text: qsTr("Tool Buttons Icon Only")
      }

      ToolButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.IconOnly
        text: qsTr("Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      ToolButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.IconOnly
        checkable: true
        text: qsTr("Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      ToolButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.IconOnly
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    RowLayout {
      spacing: 12
      Layout.fillWidth: true

      Label {
        Layout.minimumWidth: 100
        Layout.maximumWidth: 100
        wrapMode: Text.WordWrap
        text: qsTr("Delay Button & RoundButton")
      }

      DelayButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.TextUnderIcon
        text: qsTr("Delay")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      RoundButton {
        Layout.alignment: Qt.AlignHCenter;
        display: AbstractButton.IconOnly
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      RoundButton {
        Layout.alignment: Qt.AlignHCenter;
        text: qsTr("Round Button")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      RoundButton {
        Layout.alignment: Qt.AlignHCenter;
        checkable: true
        checked: true
        text: qsTr("Round Checkable")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }

      RoundButton {
        Layout.alignment: Qt.AlignHCenter;
        enabled: false
        text: qsTr("Disabled")
        icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
      }
    }

    Item {
      Layout.fillHeight: true
    }
  }
}
