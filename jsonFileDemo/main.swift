//
//  main.swift
//  jsonFileDemo
//
//  Created by Axel Schwarz on 10.03.21.
//

import Foundation
import SwiftyJSON

struct Config: Codable
{
    var PackageName: String
    var AppName: String
    var AppPath: String
    var KeyStore: String
    var KeyPass: String
    var SigningScheme: Int
}

let jsonString = """
{
       "PackageName": "de.telekom.appstarter",
       "AppName": "appstarter",
       "AppPath": "User/axelscwharz/Desktop",
       "KeyStore": "test.keystore",
       "KeyPass": "pass.txt",
       "SigningScheme": 2
}
"""

if let jsonData = jsonString.data(using: .utf8)
{
    let decoder = JSONDecoder()

    do {
        let config = try decoder.decode(Config.self, from: jsonData)
        print(config.AppName)
        print(config.AppPath)
        print(config.PackageName)
        print(config.KeyStore)
        print(config.KeyPass)
        print(config.SigningScheme)
        /*
        let appName:String = config.AppName
        let appPath:String = config.AppPath
        let packageName:String = config.PackageName
        let keyStore:String = config.KeyStore
        let keyPass:String = config.KeyPass
        let signingScheme:Int = config.SigningScheme
        */
    } catch {
        print(error.localizedDescription)
    }
}


struct Make: Codable {
    var PackageName: String?
    var AppName: String?
    var AppPath: String?
    var KeyStore: String?
    var KeyPass: String?
    var SingingScheme: Int?
}

var make = Make()
make.PackageName = ""
make.AppName = ""
make.AppPath = ""
make.KeyStore = ""
make.KeyPass = ""
make.SingingScheme = 0

let initJsonData = try! JSONEncoder().encode(make)
let initJsonString = String(data: initJsonData, encoding: .utf8)!
print(initJsonString)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
    let initJsonData = try encoder.encode(make)

    if let initJsonString = String(data: initJsonData, encoding: .utf8) {
        print(initJsonString)
    }
} catch {
    print(error.localizedDescription)
}

/*
let intAppName:String? = nil
let initAppPath:String? = nil
let initPackageName:String? = nil
let initKeyStore:String? = nil
let initKeyPass:String? = nil
let initSigningScheme:Int? = nil
 
 let jsonStringEncoding = """
 {
        "PackageName": "",
        "AppName": "",
        "AppPath": "",
        "KeyStore": "",
        "KeyPass": "",
        "SigningScheme": 0
 }
 """
*/
