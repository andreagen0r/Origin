import QtQuick
import QtQuick.Templates as T

T.Label {
  linkColor: palette.active.text
  color: enabled ? palette.inactive.text : palette.disabled.text
}
