//
//  SettingsView.swift
//  RMMobile
//
//  Created by Dev on 2/13/22.
//

import Foundation
import SwiftUI

struct SettingsView: View{
    var body: some View{
        VStack{
            Image(systemName: "a")
                .resizable()
                .frame(width: 64.0, height: 64.0)
                .foregroundColor(.black)
            Text("Username")
        }
    }
}

struct Settings_Previews: PreviewProvider{
    static var previews: some View{
        SettingsView()
    }
}
