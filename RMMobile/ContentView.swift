//
//  ContentView.swift
//  RMMobile
//
//  Created by Dev on 2/13/22.
//

import SwiftUI

struct MSAccount{
    var userName,userEmail: String
    init(userName: String ,userEmail: String){
        self.userName = userName
        self.userEmail = userEmail
    }
}

struct ContentView: View {
    var msAccount: MSAccount
    var body: some View {
        TabView{
            HomeView(title: "Hello \(msAccount.userName)").tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            SettingsView().tabItem{
                Image(systemName: "person")
                Text("Account")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let acc = MSAccount(userName: "Test", userEmail: "test@domain.com")
        ContentView(msAccount: acc)
    }
}
