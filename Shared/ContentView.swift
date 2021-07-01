//
//  ContentView.swift
//  Shared
//
//  Created by Szymon Lorenz on 31/5/21.
//

import SwiftUI

extension Color {
    static var clipchamp: Color {
        Color(.sRGB, red: 21.0/255.0, green: 20.0/255.0, blue: 53.0/255.0, opacity: 1)
    }
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Color.clipchamp
            VStack(alignment: .trailing) {
                display
                keyboard
            }
        }.ignoresSafeArea()
    }
    
    var display: some View {
        Text(viewModel.displayedValue)
            .font(.title)
            .foregroundColor(.white)
            .padding(.horizontal)
    }

    var keyboard: some View {
        VStack {
            ForEach(viewModel.rows, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { actionKey in
                        keyboardButton(key: actionKey, action: viewModel.action(_:))
                    }
                }
            }
        }
    }
    
    func keyboardButton(key: String, action: (String) -> Void) -> some View {
        Circle()
            .fill(key.isEmpty ? Color.clear : Color.white)
            .overlay(Text(key))
            .disabled(key.isEmpty)
            .frame(width: 44, height: 44)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
