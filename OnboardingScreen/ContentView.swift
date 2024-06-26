//
//  ContentView.swift
//  OnboardingScreen
//
//  Created by Md omor on 23/3/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        
        if currentPage > totalPage {
            Home()
        }
        else{
            OnboardingScreen()
        }
      
        
    }
}

#Preview {
    ContentView()
}

//home screen
struct Home :View {
    var body: some View {
        Text("welcome to Home Screen").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.heavy)
        Text("my first app")
    }
}


var totalPage = 3;
//Onboading Screen
struct OnboardingScreen :View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        ZStack{
            if currentPage == 1{
                ScreenView(image:"food1", title:"Order Food", details: "ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley")
            }
            if currentPage == 2{
                ScreenView(image:"food2", title:"payment method", details: "ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley")
            }
            if currentPage == 3{
                ScreenView(image:"food3", title:"Confirm Order", details: "ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley")
            }
            
        }
    }
}

struct ScreenView: View {
    @AppStorage("currentPage") var currentPage = 1
    var image: String
    var title: String
    var details: String
    var body: some View {
        VStack{
            HStack{
                Text("Hello Foodies").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .kerning(1.2)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Skip").fontWeight(.semibold).kerning(1.2)
                })
                
            }.padding().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Image(image).resizable().aspectRatio(contentMode: .fit)
                .padding(.horizontal,10)
                .frame(height: 400)
            Spacer(minLength: 0)
            
            Text(title).font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom,5)
                .foregroundColor(Color("Color"))
            
            
            Text(details).font(.body).fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 30)
            
            Button(action: {
                if currentPage <= totalPage{
                    currentPage += 1
                }
                else{
                    currentPage = 1
                }
            }, label:{
                Text("Next")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Color"))
                    .cornerRadius(40)
                    .padding(.horizontal,16)
            })
            
            
            
        }
    }
}
