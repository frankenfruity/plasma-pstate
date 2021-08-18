import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    property alias cfg_useDefaultIcon: useDefaultIconCheckbox.checked
    property alias cfg_showIntelGPU: showIntelGPUCheckbox.checked
    property string cfg_customIcon: plasmoid.configuration.customIcon
    property alias cfg_useSudoForReading: useSudoForReadingCheckbox.checked
    property alias cfg_passiveMode: passiveModeCheckBox.checked
    property alias cfg_pollingInterval: pollingInterval.value
    property alias cfg_sensorInterval: sensorInterval.value

    GridLayout {
        Layout.fillWidth: true
        columns: 2

        CheckBox {
            id: useDefaultIconCheckbox
            text: i18n('Use Default Icon')
            Layout.columnSpan: 2
        }

        Label {
            text: i18n("Custom Icon:")
            Layout.alignment: Qt.AlignRight
        }

        IconPicker {
            currentIcon: cfg_customIcon
            onIconChanged: cfg_customIcon = iconName
            onIconCleared: {
                useDefaultIconCheckbox.checked = true
            }
            enabled: !useDefaultIconCheckbox.checked
        }

        CheckBox {
            id: showIntelGPUCheckbox
            text: i18n('Show Intel GPU')
            Layout.columnSpan: 2
        }

        CheckBox {
            id: useSudoForReadingCheckbox
            text: i18n('Use sudo for reading values')
            Layout.columnSpan: 2
        }

        CheckBox {
            id: passiveModeCheckBox
            text: i18n('Passive Mode')
            Layout.columnSpan: 2
        }

        Label {
            text: i18n("Polling Interval (seconds):")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: pollingInterval

            minimumValue: 2
            maximumValue: 3600

            enabled: !cfg_passiveMode
        }

        Label {
            text: i18n("Sensor update interval (seconds):")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sensorInterval

            minimumValue: 2
            maximumValue: 3600
        }
    }
}
