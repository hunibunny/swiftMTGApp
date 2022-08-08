//
//  DiceView.swift
//  MTGTracker
//
//  Created by Pirita on 08/08/2022.
//

import SwiftUI

struct Triangle : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

struct Kite: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: 3*rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: 3*rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

public struct Pentagon: Shape {
    /// Creates a square bottomed pentagon.
    public init() {}
    
    var insetAmount: CGFloat = 0
    
    public func path(in rect: CGRect) -> Path {
        let insetRect: CGRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        let w = insetRect.width
        let h = insetRect.height

        return Path { path in
            path.move(to:    CGPoint(x: w/2, y:   0))
            path.addLine(to: CGPoint(x:   0, y: h/2))
            path.addLine(to: CGPoint(x:   0, y:   h))
            path.addLine(to: CGPoint(x:   w, y:   h))
            path.addLine(to: CGPoint(x:   w, y: h/2))
            path.closeSubpath()
        }
        .offsetBy(dx: insetAmount, dy: insetAmount)
    }
}

struct DiceView: View {
    var body: some View {
        VStack{
            HStack{
                Triangle()
                Rectangle()
            }
            HStack{
                Triangle()
                //here goes the kite
                Kite()
                //.border(Color.red)
            }
            HStack{
                Pentagon()
                Triangle()
            }
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}


/*
 HStack(spacing: 0){
     Triangle()
         .rotationEffect(.degrees(8.9))
         .frame(alignment: .trailing)
         .border(Color.red)
     Triangle()
         .rotationEffect(.degrees(-8.9))
         .frame(alignment: .leading)
         .border(Color.red)
 }
 */
