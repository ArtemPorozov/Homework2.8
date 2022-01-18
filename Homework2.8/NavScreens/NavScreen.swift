//
//  NavScreen.swift
//  Homework1.4
//
//  Created by Артем Порозов on 09.01.2022.
//

import SwiftUI

struct NavScreen: View {
    
    @EnvironmentObject var routeModel: NavigationContainerViewModel

    var body: some View {
        VStack {
            HStack {
                Button("< Custom Nav Screen") {
                    routeModel.pop()
                }
                .font(.headline)
                .padding()
                Spacer()
            }
            Spacer()
            Button("Show Nav Screen 2") {
                routeModel.push(screenView: LazyView(NavScreen2()).toAnyView())
            }
            Spacer()
        }
    }
    
}

struct ModalScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavScreen()
    }
}
