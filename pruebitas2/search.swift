//
//  search.swift
//  pruebitas2
//
//  Created by Isidro Jesus Muñoz on 30/04/24.
//

import SwiftUI

struct search: View {
    @State private var textooo:String = ""
    var body: some View {
        VStack{
            Spacer()
            Text("search")
            TextField("nose", text: $textooo)
                .padding()
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
    }
}

#Preview {
    search()
}
