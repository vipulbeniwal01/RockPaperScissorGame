//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Vipul Beniwal on 03/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var cpu_hand = "2"
    @State var your_hand = "1"
    @State var your_score = 0
    @State var cpu_score = 0
    @State var result = "Game not yet completed"
    var body: some View {
        ZStack{
            Image("black_background").resizable().ignoresSafeArea()
            VStack{
                Text("ROCK PAPER SCISSOR").fontWeight(.heavy).foregroundColor(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.top, 20.0)
                Spacer()
                HStack{
                    Spacer()
                    Text("CPU's Hand")
                    Spacer()
                    Text("Your's Hand")
                    Spacer()
                }.foregroundColor(.white)
                HStack{
                    Image(cpu_hand).resizable().aspectRatio(contentMode: .fit)
                    Image(your_hand).resizable().aspectRatio(contentMode: .fit)
                }
                Spacer()
                Text("Choose one of them").foregroundColor(.white).padding(.bottom, 8.0)
                
                HStack{
                    Spacer()
                    Button {
                        your_hand = "1"
                        deal()
                    } label: {
                        Text("Rock")
                    }
                    Spacer()
                    Button {
                        your_hand = "2"
                        deal()
                    } label: {
                        Text("Paper")
                    }
                    Spacer()
                    Button {
                        your_hand = "3"
                        deal()
                    } label: {
                        Text("Scisson")
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Your Score")
                            .padding(.bottom, 5.0)
                        Text(String(your_score))
                    }.padding()
                    Spacer()
                    VStack{
                        Text("CPU Score")
                            .padding(.bottom, 5.0)
                        Text(String(cpu_score))
                    }
                    Spacer()
                }.padding(.bottom, 14.0).foregroundColor(.white)
                
                HStack{
                    Text("Result : ")
                    Text(result+"    ")
                    
                }.foregroundColor(.white)
                Button {
                    reset()
                        
                } label: {
                    Text("Reset").padding(.top, 8.0)
                }

            }
        }
        
    }
    func deal(){
        var a = Int.random(in: 1...3)
        var b = Int(your_hand)
        cpu_hand = String(a)
        if(your_score<5&&cpu_score<5){
            if(a==1&&b==2){
                your_score+=1
            }
            else if(a==1&&b==3){
                cpu_score+=1
            }
            else if(a==2&&b==3){
                your_score+=1
            }
            else if(a==3&&b==1){
                your_score+=1
            }
            else if(a==3&&b==2){
                cpu_score+=1
            }
            else if(a==2&&b==1){
                cpu_score+=1
            }
        }
        else{
            if(cpu_score==5){
                result = "LOST!"
            }
            else{
                result = "WIN!!!"
            }
        }
    }
    func reset(){
        your_score=0
        cpu_score=0
        result = "Game not yet completed"
    }
}

#Preview {
    ContentView()
}
