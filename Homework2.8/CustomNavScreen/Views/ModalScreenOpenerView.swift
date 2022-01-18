//
//  ModalScreenOpenerView.swift
//  Homework1.1
//
//  Created by Артем Порозов on 07.12.2021.
//

import SwiftUI

struct ModalScreenOpenerView: View {
    
    @EnvironmentObject var thirdScreenViewModel: CustomNavScreenViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel

    var body: some View {
        VStack {
            Spacer()
            Button("Show Nav Screen") {
                routeModel.push(screenView: LazyView(NavScreen()).toAnyView())
            }
            Spacer()
        }
    }
    
}
