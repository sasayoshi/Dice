//
//  ContentView.swift
//  Dice
//
//  Created by sasayoshi on 2024/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button {
                playDice()
            } label: {
                Text("サイコロを振る")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .disabled(isRolling)
            Spacer()
        }
        .padding()
    }
    
    private func playDice(){
        print("ボタンが押されたよ")
        isRolling = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_  in
            randomNumber = Int.random(in: 1...6)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            timer?.invalidate()
            timer = nil
            isRolling = false
        }
    }
}

#Preview {
    ContentView()
}
