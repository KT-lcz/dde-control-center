// This file is automatically generated, please don't edit manully.
import QtQuick 2.1
import Deepin.Widgets 1.0
import "../edit"

BaseEditSection { 
    id: sectionVpnOpenvpn
    virtualSection: "vs-vpn-openvpn"
    
    header.sourceComponent: EditDownArrowHeader{
        text: dsTr("VPN")
    }

    content.sourceComponent: Column { 
        EditLineTextInput {
            id: lineAliasVpnOpenvpnRemote
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "remote"
            text: dsTr("Gateway")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnConnectionType
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "connection-type"
            text: dsTr("Auth Type")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnUsername
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "username"
            text: dsTr("Username")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnPasswordFlags
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "password-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnOpenvpnPassword
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "password"
            text: dsTr("Password")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnCert
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "cert"
            text: dsTr("User Cert")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnCa
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "ca"
            text: dsTr("CA Cert")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnKey
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "key"
            text: dsTr("Private Key")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnCertPassFlags
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "cert-pass-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnOpenvpnCertPass
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "cert-pass"
            text: dsTr("Private Pwd")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnStaticKey
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "static-key"
            text: dsTr("Static Key")
        }
        EditLineSwitchButton {
            id: lineAliasVpnOpenvpnVkStaticKeyDirection
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "vk-static-key-direction"
            text: dsTr("Use Key Direction")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnStaticKeyDirection
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "static-key-direction"
            text: dsTr("Key Direction")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnRemoteIp
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "remote-ip"
            text: dsTr("Remote IP")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnLocalIp
            connectionSession: sectionVpnOpenvpn.connectionSession
            availableSections: sectionVpnOpenvpn.availableSections
            availableKeys: sectionVpnOpenvpn.availableKeys
            connectionData: sectionVpnOpenvpn.connectionData
            errors: sectionVpnOpenvpn.errors
            section: "alias-vpn-openvpn"
            key: "local-ip"
            text: dsTr("Local IP")
        }
    }
}
