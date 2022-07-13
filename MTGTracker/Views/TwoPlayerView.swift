//
//  TwoPlayerView.swift
//  MTGTracker
//
//  Created by Pirita on 08/07/2022.
//

/*import SwiftUI


struct TwoPlayerView: View {
    @State private var hp = 40
    private var height: CGFloat = UIScreen.screenHeight/4
    private var width: CGFloat = UIScreen.screenWidth
    private var upperColor1: Color = Color(red: 0.9, green: 0.1, blue: 0.4)
    private var middleColor1: Color = Color(red: 0.9, green: 0.1, blue: 0.1)
    private var lowerColor1: Color = Color(red: 0.9, green: 0.1, blue: 0.4)
    
    private var upperColor2: Color = Color(red: 0.1, green: 0.9, blue: 0.4)
    private var middleColor2: Color = Color(red: 0.1, green: 0.9, blue: 0.1)
    private var lowerColor2: Color = Color(red: 0.1, green: 0.9, blue: 0.4)
    
    
    var body: some View {
        VStack(spacing: 0){
            ForEach (1...2, id: \.self){ i in
                if i == 1{
                    Rectangle()
                        .fill(.linearGradient(
                            Gradient(colors: [lowerColor1, middleColor1]),
                            startPoint: UnitPoint(x: 0.5, y: 0.05),
                            endPoint: UnitPoint(x: 0.5, y: 0.95)
                        ))
                        .frame(width: width, height: height, alignment: .bottom)
                        .onTapGesture {
                            hp -= 1
                        }
                    ZStack{
                        middleColor1
                        Text(String(hp))
                            .foregroundColor(Color.black)
                            .rotationEffect(.degrees(180))
                    }
                }
                Rectangle()
                    .fill(.linearGradient(
                        Gradient(colors: i == 1 ? [middleColor1,upperColor1] : [upperColor2, middleColor2]),
                        startPoint: UnitPoint(x: 0.5, y: 0.05),
                        endPoint: UnitPoint(x: 0.5, y: 0.95)
                    ))
                    .frame(width: width, height: height, alignment: .bottom)
                    .onTapGesture {
                        hp += 1
                    }
    
                if i == 2{
                    ZStack{
                        middleColor2
                        Text(String(hp))
                            .foregroundColor(Color.black)
                            .rotationEffect(.degrees(0))
                    }
                    
                Rectangle()
                    .fill(.linearGradient(
                        Gradient(colors: [middleColor2, lowerColor2]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 0.6)
                    ))
                    .frame(width: width, height: height, alignment: .bottom)
                    .onTapGesture {
                        hp -= 1
                    }
                }
            }
        }
    }
}

struct TwoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TwoPlayerView()
    }
}
*/
