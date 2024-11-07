import QtQuick

Item {
    id: root
    implicitWidth: initialSize
    implicitHeight: initialSize

    property real value: 0
    property bool handleHasFocus: false
    property bool handlePressed: false
    property bool handleHovered: false
    readonly property int initialSize: 15
    readonly property var control: parent

    Rectangle {
        id: handleRect
        width: parent.width
        height: parent.height
        radius: width / 2
        scale: root.handlePressed ? 1.5 : 1
        color: !root.control.enabled ? root.control.palette.disabled.mid
                                     : root.handlePressed ? Qt.lighter( root.control.palette.active.accent, 1.2 )
                                                          : root.control.palette.active.light

        Behavior on scale {
            NumberAnimation {
                duration: 250
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
    }
}
