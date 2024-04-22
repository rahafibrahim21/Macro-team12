//
//  InputView.swift
//  Macro-rahaf
//
//  Created by Rahaf ALghuraibi on 08/10/1445 AH.
//

import SwiftUI

struct InputView: View {
    @Binding var text:String
    let title : String
    let placeholder : String
    var isSecureField = false
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField{
               SecureField(placeholder,text: $text)
                    .font(.system(size: 14))
            }else{
                TextField(placeholder,text: $text)
                    .font(.system(size: 14))
            }
            Divider()
                
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
