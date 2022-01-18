//
//  NavScreen2.swift
//  Homework1.4
//
//  Created by Артем Порозов on 09.01.2022.
//

import SwiftUI

struct NavScreen2: View {
    
    @EnvironmentObject var routeModel: NavigationContainerViewModel

    var body: some View {
        VStack {
            HStack {
                Button("< Nav Screen") {
                    routeModel.pop()
                }
                .font(.headline)
                .padding()
                Spacer()
            }
            Spacer()
            Text("Nav Screen 2")
            Spacer()
        }
    }
    
}

struct ModalScreen2_Previews: PreviewProvider {
    static var previews: some View {
        NavScreen()
    }
}
