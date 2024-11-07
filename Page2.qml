pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Origin

Page {
  id: control
  title: qsTr("Page 2")

  required property Dialog dialog
  required property Popup popup

  RowLayout {
    anchors.fill: parent
    spacing: 12

    ColumnLayout {
      Layout.fillWidth: true
      Layout.fillHeight: true
      spacing: 6

      ButtonGroup {
        id: radiobuttonGroup
      }

      RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Frame {
          Layout.fillWidth: true

          ColumnLayout {
            anchors.fill: parent

            Repeater {
              clip: true
              model: 3
              delegate: ItemDelegate {
                required property string modelData
                Layout.fillWidth: true
                text: `Item Delegate ${parseInt(modelData) + 1}`
                icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
              }
            }
          }
        }

        Frame {
          Layout.fillWidth: true
          enabled: false

          ColumnLayout {
            anchors.fill: parent

            Repeater {
              clip: true
              model: 3
              delegate: ItemDelegate {
                required property string modelData
                Layout.fillWidth: true
                text: `Item Delegate ${parseInt(modelData) + 1}`
                icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
              }
            }
          }
        }
      }

      RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Frame {
          Layout.fillWidth: true

          ColumnLayout {
            anchors.fill: parent

            Repeater {
              id: radioDelegate
              clip: true
              model: 3
              delegate: RadioDelegate {
                required property string modelData
                Layout.fillWidth: true
                text: `RadioDelegate ${parseInt(modelData) + 1}`
                checked: parseInt(modelData) === 0
                ButtonGroup.group: radiobuttonGroup
              }
            }
          }
        }

        Frame {
          Layout.fillWidth: true

          ColumnLayout {
            anchors.fill: parent

            Repeater {
              clip: true
              Layout.preferredWidth: 200
              Layout.fillHeight: true
              Layout.alignment: Qt.AlignHCenter;
              model: 3
              delegate: CheckDelegate {
                required property string modelData
                Layout.fillWidth: true
                text: `Check Delegate ${parseInt(modelData) + 1}`
                checked: parseInt(modelData) === 0
              }
            }
          }
        }

        Frame {
          Layout.fillWidth: true

          ColumnLayout {
            anchors.fill: parent

            Repeater {
              clip: true
              Layout.preferredWidth: 200
              Layout.fillHeight: true
              Layout.alignment: Qt.AlignHCenter;
              model: 3
              delegate: SwitchDelegate {
                required property string modelData
                Layout.fillWidth: true
                text: `Switch Delegate ${parseInt(modelData) + 1}`
                checked: parseInt(modelData) === 0
              }
            }
          }
        }
      }

      GroupBox {
        id: switchs
        title: "Switchs"
        Layout.fillWidth: true

        RowLayout{
          anchors.fill: parent

          Switch {
            Layout.alignment: Qt.AlignHCenter;
            text: qsTr("Wi-Fi")
          }

          Switch {
            Layout.alignment: Qt.AlignHCenter;
            text: qsTr("Checked")
            checked: true
          }

          Switch {
            Layout.alignment: Qt.AlignHCenter;
            text: qsTr("Disable")
            enabled: false
          }
        }
      }

      RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true



        GroupBox {
          Layout.fillWidth: true
          title: qsTr("Radio Button")

          ColumnLayout {
            anchors.fill: parent

            RadioButton {
              Layout.fillWidth: true
              checked: true
              text: qsTr("First")
            }

            RadioButton {
              Layout.fillWidth: true
              text: qsTr("Second")
            }

            RadioButton {
              Layout.fillWidth: true
              text: qsTr("Third")
            }

            RadioButton {
              Layout.fillWidth: true
              text: qsTr("Disable")
              enabled: false
            }
          }
        }

        GroupBox {
          Layout.fillWidth: true
          title: qsTr("Check Box")

          ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter;

            CheckBox {
              checked: true
              text: qsTr("First")
            }
            CheckBox {
              text: qsTr("Second")
            }
            CheckBox {
              checked: true
              text: qsTr("Third")
            }

            CheckBox {
              checked: true
              text: qsTr("Disable")
              enabled: false
            }
          }
        }

        GroupBox {
          Layout.fillWidth: true
          title: qsTr("Check Box")

          ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter;

            ButtonGroup {
              id: childGroup
              exclusive: false
              checkState: parentBox.checkState
            }

            CheckBox {
              id: parentBox
              text: qsTr("Parent")
              checkState: childGroup.checkState
            }

            CheckBox {
              checked: true
              text: qsTr("Child 1")
              leftPadding: indicator.width
              ButtonGroup.group: childGroup
            }

            CheckBox {
              text: qsTr("Child 2")
              leftPadding: indicator.width
              ButtonGroup.group: childGroup
            }

            CheckBox {
              text: qsTr("Child 2")
              leftPadding: indicator.width
              ButtonGroup.group: childGroup
              enabled: false
            }
          }
        }
      }

      GroupBox {
        title: "SpinBox"
        id: spinbox
        Layout.fillWidth: true

        RowLayout {
          anchors.fill: parent

          SpinBox{
            Layout.alignment: Qt.AlignHCenter
            wheelEnabled: true
            editable: true
          }

          SpinBox {
            id: spinDoble
            Layout.alignment: Qt.AlignHCenter;

            from: 0
            value: 110
            to: 1000
            stepSize: 1
            editable: true
            wheelEnabled: true

            property int decimals: 2
            property real realValue: value / 100

            textFromValue: function( value, locale ) {
              return Number( value / 100 ).toLocaleString( locale, 'f', spinDoble.decimals )
            }

            valueFromText: function( text, locale ) {
              return Number.fromLocaleString( locale, text ) * 100
            }
          }

          SpinBox {
            id: spinBox
            Layout.alignment: Qt.AlignHCenter;
            Layout.preferredWidth: 150

            from: 0
            to: items.length - 1
            value: 1 // "Medium" // TODO: Adicionar um ENUM
            wheelEnabled: true

            property var items: ["Small", "Medium", "Large"]

            validator: RegularExpressionValidator {
              regularExpression: new RegExp("(Small|Medium|Large)", "i")
            }

            textFromValue: function(value) {
              return items[value];
            }

            valueFromText: function(text) {
              for (var i = 0; i < items.length; ++i) {
                if (items[i].toLowerCase().indexOf(text.toLowerCase()) === 0)
                  return i
              }
              return spinBox.value
            }
          }
        }
      }

      GroupBox {
        id: comboBox
        Layout.fillWidth: true
        title: "Combo box"

        RowLayout {
          anchors.fill: parent

          ComboBox { Layout.alignment: Qt.AlignHCenter; model: ["First", "Second", "Third"] }

          ComboBox { Layout.alignment: Qt.AlignHCenter; flat: true; model: ["First", "Second", "Third"] }

          ComboBox {
            Layout.alignment: Qt.AlignHCenter
            editable: true
            selectTextByMouse: true

            model: ListModel {
              id: model
              ListElement { text: "Banana" }
              ListElement { text: "Apple" }
              ListElement { text: "Coconut" }
            }
            onAccepted: {
              if (find(editText) === -1)
              model.append({text: editText})
            }
          }
        }
      }

      RowLayout {
        Layout.fillWidth: true

        GroupBox {
          Layout.fillWidth: true
          title: qsTr("Busy Indicator")

          RowLayout {
            anchors.fill: parent
            BusyIndicator {Layout.alignment: Qt.AlignHCenter;}
          }
        }

        GroupBox {
          id: contextMenu
          title: "Context Menu"
          Layout.fillWidth: true
          Layout.fillHeight: true

          Label {
            anchors.fill: parent
            text: "Right click me"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
          }

          MouseArea {
            id: mouse
            anchors.fill: parent
            acceptedButtons: Qt.RightButton
            onClicked: zoomMenu.open()
          }

          Menu {
            id: zoomMenu
            x: mouse.mouseX
            y: mouse.mouseY
            title: qsTr("Edit")

            Menu {
              title: qsTr("Advanced")

              MenuItem {
                text: qsTr("Open Dialog")
                onTriggered: control.dialog.open()
              }

              MenuItem {
                text: qsTr("Popup")
                onTriggered: control.popup.open()
              }
            }
          }
        } // contextMenu
      }
    }

    ColumnLayout {
      id: col
      spacing: 24
      Layout.fillWidth: true
      Layout.fillHeight: true

      GroupBox {
        id: progressBar_and_sliders
        title: "Progress Bar and Sliders"
        Layout.fillWidth: true

        QtObject {
          id: sliderInternal
          property real value: 0
          property real rValue1: 0
          property real rValue2: 10
        }

        Timer {
          id: timer
          repeat: true
          interval: 3000
          triggeredOnStart: true
          onTriggered: {
            progress1.value = (progress1.value + 1) % 2
          }
          Component.onCompleted: timer.start()
        }

        RowLayout {
          anchors.fill: parent

          Slider {
            id: slider2
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter
            orientation: Qt.Vertical
            value: sliderInternal.value
            onMoved: {
              sliderInternal.value = value
            }
          }

          ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
              Layout.fillWidth: true

              Label {
                Layout.minimumWidth: 130
                text: qsTr("Progress Bar:")
              }

              ProgressBar {
                id: progress1
                Layout.fillWidth: true
                Behavior on value { NumberAnimation { duration: 2000 } }
              }

              ProgressBar{
                Layout.fillWidth: true
                indeterminate: true
              }
            }

            RowLayout {
              Layout.fillWidth: true

              Label {
                Layout.minimumWidth: 130
                text: qsTr("Slider / Range Slider:")
              }

              Slider{
                id: slider1
                Layout.fillWidth: true
                value: sliderInternal.value
                onMoved: {
                  sliderInternal.value = value
                }
              }

              RangeSlider {
                id: rSlider1
                Layout.fillWidth: true
                first.value: sliderInternal.rValue1
                second.value: sliderInternal.rValue2
                first.onMoved: {
                  sliderInternal.rValue1 = first.value
                }
                second.onMoved: {
                  sliderInternal.rValue2 = second.value
                }
              }
            }

            RowLayout {
              Layout.fillWidth: true

              Label {
                Layout.minimumWidth: 130
                text: qsTr("Slider / Range Slider:")
              }

              Slider{
                id: slider3
                Layout.fillWidth: true
                enabled: false
                value: sliderInternal.value
                onMoved: {
                  sliderInternal.value = value
                }
              }

              RangeSlider {
                id: rSlider3
                Layout.fillWidth: true
                enabled: false
                first.value: sliderInternal.rValue1
                second.value: sliderInternal.rValue2
                first.onMoved: {
                  sliderInternal.rValue1 = first.value
                }
                second.onMoved: {
                  sliderInternal.rValue2 = second.value
                }
              }
            }
          }

          RangeSlider{
            id: rSlider2
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter
            orientation: Qt.Vertical
            first.value: sliderInternal.rValue1
            second.value: sliderInternal.rValue2
            first.onMoved: {
              sliderInternal.rValue1 = first.value
            }
            second.onMoved: {
              sliderInternal.rValue2 = second.value
            }
          }
        }
      }

      Page {
        id: tabbar_and_stack
        Layout.fillWidth: true
        Layout.fillHeight: true
        padding: 0

        header: TabBar {
          id: bar
          TabButton {
            text: qsTr("Flickable Image")
            icon.source: "qrc:/qt/qml/Sandbox/assets/atom-solid.svg"
          }
          TabButton {
            text: qsTr("Discover")
          }
          TabButton {
            text: qsTr("Activity")
          }
        }

        StackLayout {
          anchors.fill: parent
          clip: true

          currentIndex: bar.currentIndex

          Item {

            Flickable {
              anchors.fill: parent
              clip: true
              contentWidth: image.width
              contentHeight: image.height
              contentX: (image.width / 2) - (width / 2)
              contentY: (image.height / 2) - (height / 2)
              boundsBehavior: Flickable.StopAtBounds

              ScrollIndicator.horizontal: ScrollIndicator { }
              ScrollIndicator.vertical: ScrollIndicator { }

              Image {
                id: image
                source: "qrc:/qt/qml/Sandbox/assets/posaidus-AXb-QW_EeuU-unsplash.jpg"
              }
            }

            Label {
              anchors.bottom: parent.bottom
              anchors.right: parent.right
              anchors.margins: 12
              verticalAlignment: Text.AlignBottom
              horizontalAlignment: Text.AlignRight
              font.pointSize: 8
              opacity: 0.5
              text: `Foto de <a href="https://unsplash.com/pt-br/@posaidus?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">PosaiDus</a> na <a href="https://unsplash.com/pt-br/fotografias/um-close-up-de-um-padrao-roxo-e-preto-AXb-QW_EeuU?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>`
            }
          }
        }
      }
    }
  }
}
