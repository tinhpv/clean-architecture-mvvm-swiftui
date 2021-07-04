//
//  LoadingView.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/5/21.
//
import SwiftUI

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    @Binding var text: String
    var content: () -> Content
    
    var body: some View {
        GeometryReader { _ in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                
                VStack {
                    if !self.text.isEmpty {
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                            .padding(.top)
                        Text(self.text)
                            .padding([.leading, .trailing, .bottom])
                    } else {
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                    }
                }
                .frame(minWidth: 78,
                       idealWidth: nil,
                       maxWidth: nil,
                       minHeight: 78,
                       idealHeight: nil,
                       maxHeight: nil,
                       alignment: .center)
                .background(Color(red: 227.0 / 255.0,
                                  green: 229.0 / 255.0,
                                  blue: 230.0 / 255.0))
                .foregroundColor(Color.primary)
                .cornerRadius(6)
                .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true),
                    text: .constant("Loading...")) { Text("Hello") }
    }
}
