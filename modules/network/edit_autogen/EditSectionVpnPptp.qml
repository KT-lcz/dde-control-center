// This file is automatically generated, please don't edit manully.
import QtQuick 2.1
import Deepin.Widgets 1.0
import "../edit"

BaseEditSection { 
    id: sectionVpnPptp
    virtualSection: "vs-vpn-pptp"
    
    header.sourceComponent: EditDownArrowHeader{
        text: dsTr("VPN")
    }

    content.sourceComponent: Column { 
        EditLineTextInput {
            id: lineAliasVpnPptpGateway
            connectionSession: sectionVpnPptp.connectionSession
            availableSections: sectionVpnPptp.availableSections
            availableKeys: sectionVpnPptp.availableKeys
            connectionData: sectionVpnPptp.connectionData
            errors: sectionVpnPptp.errors
            section: "alias-vpn-pptp"
            key: "gateway"
            text: dsTr("Gateway")
        }
        EditLineTextInput {
            id: lineAliasVpnPptpUser
            connectionSession: sectionVpnPptp.connectionSession
            availableSections: sectionVpnPptp.availableSections
            availableKeys: sectionVpnPptp.availableKeys
            connectionData: sectionVpnPptp.connectionData
            errors: sectionVpnPptp.errors
            section: "alias-vpn-pptp"
            key: "user"
            text: dsTr("Username")
        }
        EditLineComboBox {
            id: lineAliasVpnPptpPasswordFlags
            connectionSession: sectionVpnPptp.connectionSession
            availableSections: sectionVpnPptp.availableSections
            availableKeys: sectionVpnPptp.availableKeys
            connectionData: sectionVpnPptp.connectionData
            errors: sectionVpnPptp.errors
            section: "alias-vpn-pptp"
            key: "password-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnPptpPassword
            connectionSession: sectionVpnPptp.connectionSession
            availableSections: sectionVpnPptp.availableSections
            availableKeys: sectionVpnPptp.availableKeys
            connectionData: sectionVpnPptp.connectionData
            errors: sectionVpnPptp.errors
            section: "alias-vpn-pptp"
            key: "password"
            text: dsTr("Password")
        }
        EditLineTextInput {
            id: lineAliasVpnPptpDomain
            connectionSession: sectionVpnPptp.connectionSession
            availableSections: sectionVpnPptp.availableSections
            availableKeys: sectionVpnPptp.availableKeys
            connectionData: sectionVpnPptp.connectionData
            errors: sectionVpnPptp.errors
            section: "alias-vpn-pptp"
            key: "domain"
            text: dsTr("Domain")
        }
    }
}
