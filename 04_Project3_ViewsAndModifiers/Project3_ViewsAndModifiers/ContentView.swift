//
//  ContentView.swift
//  Project3_ViewsAndModifiers
//
//  Created by Minju Lee on 2021/12/12.
//

import SwiftUI

/*
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}
*/

/*
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
*/

/*
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
 */

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    /*
    var body: some View {
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
    */
    
    /*
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
    }
    */
    
    /*
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
    */
    
    /*
    //some을 빼고 이렇게 쓰는 건 안됨
    //var body: View {
    //이렇게 쓰는 건 허용됨
    var body: Text {
        Text("Hello World")
    }
    */
    
    /*
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
    */
    
    /*
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
     }
     */
    
    /*
    var body: some View {
        VStack {
            Text("Gryffindor")
                
                .blur(radius: 50)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.largeTitle)
        .blur(radius: 5)
    }
    */
    
    /*
    //let motto1 = Text("Draco dormiens")
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
    */
    
    /*
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var body: some View {
        spells
    }
    */
    
    /*
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var body: some View {
        VStack {
            spells
        }
    }
    */
    
    /*
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            spells
        }
    }
    */
    
    /*
    var body: some View {
        /*
        VStack(spacing: 10) {
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
        }
        */
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
    }
    */
    
    /*
    var body: some View {
        Text("Hello World")
            //.modifier(Title())
            .titleStyle()
    }
     */
    
    /*
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
     */
    
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
