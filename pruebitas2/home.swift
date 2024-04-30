//
//  home.swift
//  pruebitas2
//
//  Created by Isidro Jesus Muñoz on 30/04/24.
//

import SwiftUI

struct home: View {
    @State private var text: String = ""
    var body: some View {
        VStack{
            Spacer()
            Text("Home")
            TextField("name", text: $text)
                .padding()
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
    }
}

#Preview {
    home()
}
