//
//  ContentView.swift
//  Macro-rahaf
//
//  Created by Rahaf ALghuraibi on 08/10/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }else{
                LogingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
