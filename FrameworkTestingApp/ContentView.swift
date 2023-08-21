//
//  ContentView.swift
//  FrameworkTestingApp
//
//  Created by Mansoor Ali on 21/08/2023.
//

import SwiftUI
import DataFramework
import Alamofire
import RealmSwift

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            let logger = VersionLogger()
            /*
            logger.versionInfo()
            logger.printCustomEncoding()
            logger.getCategories { data, error in
                print(data)
                print(error)
            }
            
            AF.request("https://api.beautygo.it/api/categories/macro").responseString { response in
                switch response.result {
                case .success(let data):
                    print("Data:" + data)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }*/
            
            /*
            do {
                try logger.createDB(schemaVersion: 1)
                try logger.addUser(name: "User105")
                let users = logger.getUser()
                print(users)
                
            } catch {
                print("DB Error: \(error)")
            } */
            
            do {
                let config = Realm.Configuration(schemaVersion: 3)
                let realm = try Realm(configuration: config)
                
                let user = UserB()
                user.username = "Mad Boy"
                try realm.write{
                    realm.add(user)
                }
                
                let users = realm.objects(UserB.self)
                print(users)
                
            } catch {
                print("DB Error: \(error)")
            }
        }
    }
}

class UserB: Object {
    @objc dynamic var username = ""
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
