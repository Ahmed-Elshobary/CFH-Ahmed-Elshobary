//
//  KeychainManager.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Security
import Foundation

class KeychainManager {
    static func savePassword(service: String, account: String, password: String) {
        guard let passwordData = password.data(using: .utf8) else {
            print("Error converting password to data")
            return
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData
        ]

        // Delete any existing password first
        SecItemDelete(query as CFDictionary)

        // Add the new password to the Keychain
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Error saving password to Keychain: \(status)")
            return
        }

        print("Password saved to Keychain")
    }
    
    static func getPassword(service: String, account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status == errSecSuccess else {
            print("Error retrieving password from Keychain: \(status)")
            return nil
        }

        guard let data = dataTypeRef as? Data else {
            print("Error converting password data")
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
}
