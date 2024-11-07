import QtQuick
import QtQuick.Layouts
import Origin

Frame {
  id: control
  clip: true

  Component.onCompleted: {

    // Usa a Palette atual para mostrar as cores

    for (let key in control.palette.active) {

      if (key !== "objectName" && typeof control.palette.active[key] !== "function") {

        const baseColor = control.palette[key]
        const activeColor = control.palette.active[key]
        const inactiveColor = control.palette.inactive[key]
        const disabledColor = control.palette.disabled[key]

        // console.debug(key, " -> ", baseColor, activeColor)

        colorModel.append( {
                            "label": key,
                            "baseColor" : baseColor,
                            "activeColor" : activeColor,
                            "inactiveColor" : inactiveColor,
                            "disabledColor" : disabledColor
                          } )

      }
    }
  }

  // Rectangle {
  //   anchors.fill: parent
  //   anchors.margins: -12
  // }

  ListModel {
    id: colorModel


  }

  GridLayout {
    anchors.fill: parent
    Layout.alignment: Qt.AlignHCenter;
    Layout.fillWidth: true
    columns: 7
    columnSpacing: 6
    rowSpacing: 6
    uniformCellWidths: true
    uniformCellHeights: true

    Repeater {
      model: colorModel
      delegate: Rectangle {
        id: del
        required property string label
        required property color baseColor
        required property color activeColor
        required property color inactiveColor
        required property color disabledColor
        Layout.fillWidth: true
        Layout.fillHeight: true
        implicitWidth: lb.implicitWidth + 12
        implicitHeight: 32
        color: "black"

        ColumnLayout {
          anchors.fill: parent
          anchors.margins: 1
          spacing: 1

          RowLayout {
            spacing: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 70

            Rectangle {
              Layout.fillWidth: true
              Layout.fillHeight: true
              color: del.activeColor

              MouseArea {
                id: maActivated
                anchors.fill: parent
                hoverEnabled: true

                ToolTip {
                  text: qsTr(`${del.label}\n${del.activeColor}`)
                  visible: maActivated.containsMouse
                }
              }

            }
            Rectangle {
              Layout.fillWidth: true
              Layout.fillHeight: true
              color: del.inactiveColor

              MouseArea {
                id: maIactivated
                anchors.fill: parent
                hoverEnabled: true
                ToolTip {
                  text: qsTr(`${del.label}\n${del.inactiveColor}`)
                  visible: maIactivated.containsMouse
                }
              }

            }
            Rectangle {
              Layout.fillWidth: true
              Layout.fillHeight: true
              color: del.disabledColor

              MouseArea {
                id: maDisabled
                anchors.fill: parent
                hoverEnabled: true
                ToolTip {
                  text: qsTr(`${del.label}\n${del.disabledColor}`)
                  visible: maDisabled.containsMouse
                }
              }
            }
          }

          Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 30
            color: del.baseColor

            Rectangle {
              id: pill
              anchors.centerIn: parent
              implicitWidth: lb.implicitWidth + 12
              implicitHeight: lb.implicitHeight + 6
              radius: height / 2
              color: "lightgray"


              Label {
                id: lb
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: del.label
                color: "black"
                font.capitalization: Font.AllUppercase
                font.pointSize: 7
              }
            }
          }
        }
      }
    }
  }
}
