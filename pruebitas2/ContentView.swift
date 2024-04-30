//
//  ContentView.swift
//  pruebitas2
//
//  Created by Isidro Jesus Muñoz on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var pathNav : [String] = []
    @State var nav: Bool = false
    var body: some View {
        TabView{
            home()
            .tabItem {
                Image(systemName: "house")
            }
            
            search()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
}


struct CustomTabs: View {
    @Binding var index: [String]
    var body: some View{
        ZStack {
            HStack(){
                //home button
                VStack {
                    
                    NavigationLink(destination: home()){
                        Image(systemName: "house")
                               .resizable()
                               .frame(width: 25,height: 25)
                    }
                    

                }
                
                Spacer(minLength: 0)

                //search
                VStack {
                    if self.index == ["search"] {
                        Line().stroke(Color.orange, lineWidth: 2)
                            .frame(width: 30,height: 2)
                            .offset(y:-15)
                    }

                    Button(action: {
                        index.append("search")
                    }){
                     Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25,height: 25)
                    }
                    .colorMultiply(self.index == ["search"] ? Color.orange.opacity(1): Color.black.opacity(0.4))
                .offset(y: self.index == ["search"] ? -7: 0)
                }

                
                Spacer(minLength: 0)
                
                Spacer(minLength: 0)
                
                //profile
                VStack {
                    if self.index == ["profile"] {
                        Line().stroke(Color.orange, lineWidth: 2)
                            .frame(width: 30,height: 2)
                            .offset(y:-15)
                    }
                    Button(action: {
                        index.append("profile")
                    }){
                     Image(systemName: "person")
                            .resizable()
                            .frame(width: 25,height: 25)
                    }
                    .colorMultiply(self.index == ["profile"] ? Color.orange.opacity(1): Color.black.opacity(0.4))
                .offset(y: self.index == ["profile"] ? -7: 0)
                }

                
                Spacer(minLength: 0)

                //saved
                VStack {
                    if self.index == ["saved"] {
                        Line().stroke(Color.orange, lineWidth: 2)
                            .frame(width: 30,height: 2)
                            .offset(y:-15)
                            .padding(0)
                    }
                    Button(action: {
                        index.append("saved")
                    }){
                     Image(systemName: "bookmark.fill")
                            .resizable()
                            .frame(width: 25,height: 25)
                    }
                    .colorInvert()
                    .colorMultiply(self.index == ["saved"] ? Color.orange.opacity(1): Color.black.opacity(0.4))
                .offset(y: self.index == ["saved"] ? -7: 0)
                }

                
            }.padding()
                .padding(.horizontal,20)
                .padding(.bottom,15)
            .background(.white)
            .clipShape(CShape()).shadow(radius: 2)
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
}

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 33, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
        
    }

}
