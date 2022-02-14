//
//  HomeView.swift
//  RMMobile
//
//  Created by Dev on 2/13/22.
//

import Foundation
import SwiftUI

struct MenuItem{
    let id = UUID()
    var title:String
    var image:String
    init(title:String, image:String){
        self.title = title
        self.image = image
    }
}

struct HomeView: View{
    let menuItems = [MenuItem(title: "Corporate Directory", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart"),
                     MenuItem(title: "Menu 1", image: "heart")]
//    let layout = [GridItem(.flexible()),
//                  GridItem(.flexible())]
    let layoutColumn = [
        GridItem(.fixed(130), spacing: 4),
        GridItem(.fixed(130), spacing: 4),
        GridItem(.fixed(130), spacing: 4),]
    var title:String
    var body: some View{
        ScrollView{
            Text(title).font(.title2)
            LazyVGrid(columns: layoutColumn, spacing: 10 ){
                ForEach(menuItems, id: \.id){ item in
                    
                            ZStack{
                                RoundedRectangle(cornerRadius: 17, style: .continuous)
                                                .fill(Color.gray)
                                                .frame(width: 124, height: 124)
                                VStack{
                                    Image(systemName: item.image)
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                    .foregroundColor(Color.white)
                                    Text(item.title)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)
                                }
                            }
                }
            }
        }

    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView(title: "User")
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
#endif
