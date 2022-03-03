//
//  HomeView.swift
//  SpendCalendar-SwiftUI
//
//  Created by Juan Sebastian Orozco Buitrago on 3/2/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - Animation Properties
    @State var animatedStates: [Bool] = Array(repeating: false, count: 3)
    // Hero Effect
    @Namespace var animation
    // Current Date
    @State var currentDate: Date = Date()
    
    //MARK: - BODY
    
    var body: some View {
        ZStack {
            // If we hide the view while its trasitioning it will give some opacity change in the view
            // Ignore the warning since the view is anuway going to removed later
            if !animatedStates[1] {
                RoundedRectangle(
                    cornerRadius: animatedStates[0] ? 30 : 0,
                    style: .continuous)
                    .fill(Color("Purple"))
                    .matchedGeometryEffect(id: "DATEVIEW", in: animation)
                    .ignoresSafeArea()
                
                // Splash logo
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 162)
                    .scaleEffect(animatedStates[0] ? 0.25 : 1)
                    .matchedGeometryEffect(id: "SPLASHLOGO", in: animation)
            }
            
            if animatedStates[0] {
                //MARK: - HOME VIEW
                VStack(spacing: 0) {
                    
                    //MARK: - Nav Bar
                    Button {
                
                    } label: {
                        Image(systemName: "rectangle.leadinghalf.inset.filled")
                            .font(.title3)
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .overlay(content: {
                        Text("All debts")
                            .font(.title3)
                            .fontWeight(.semibold)
                    })
                    .padding(.bottom, 30)

                    
                    // Custom Calendar
                    // Video in the Description, Check it out
                    CustomDatePickerView(currentDate: $currentDate)
                        .overlay(alignment: .topLeading, content: {
                            // Splash logo
                            Image("Logo")
                                .scaleEffect(0.1)
                                .frame(maxWidth: 10, maxHeight: 10)
                                .matchedGeometryEffect(id: "SPLASHLOGO", in: animation)
                                .offset(x: 40, y: 25)

                        })
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(Color("Purple"))
                                .matchedGeometryEffect(id: "DATEVIEW", in: animation)
                                .ignoresSafeArea()
                        }
                    
                    //MARK: - Users ScrollView
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 20) {
                            
                            ForEach(users) { user in
                                //MARK: - User Card View
                                UserCardView(user: user, index: getIndex(user: user))
                            }
                        }
                        .padding(.vertical)
                        .padding(.top, 30)
                    }
                } //: VSTACK
                .padding([.horizontal, .top])
                .frame(maxHeight: .infinity, alignment: .top)
            }
        } //: ZSTACK
        .onAppear(perform: startAnimations)
    }
    
    func getIndex(user: User) -> Int {
        return users.firstIndex { currentUser in
            return user.id == currentUser.id
        } ?? 0
    }
    
    // Animating View
    func startAnimations() {
        
        //MARK: - Displaying Splash Icon for Some time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                animatedStates[0] = true
            }
            
            // Removing View after the View is animated
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                animatedStates[1] = true
            }
        }
    }
}

//MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
