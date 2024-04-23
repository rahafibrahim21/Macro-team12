//
//  ProfileView.swift
//  Macro-rahaf
//
//  Created by Rahaf ALghuraibi on 09/10/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72,height: 72)
                        .background(.gray)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Section("genral"){
                    HStack{
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                }
                Section("Account"){
                    Button{
                        viewModel.signOut()
                    }label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor:.red)
                        
                    }
                    Button{
                        print("Delete account")
                    }label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor:.red)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
