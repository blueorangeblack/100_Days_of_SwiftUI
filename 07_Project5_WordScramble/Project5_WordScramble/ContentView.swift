//
//  ContentView.swift
//  Project5_WordScramble
//
//  Created by Minju Lee on 2021/12/27.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        /*
        //정적으로 생성
        List {
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
        }
         */
        
        /*
        //동적으로 생성
        List {
            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }
        }
         */
        
        /*
        //동적, 정적 row 같이
        List {
            Text("Static row 1")
            Text("Static row 2")

            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }

            Text("Static row 3")
            Text("Static row 4")
        }
        */
        
        /*
        //section 사용
        //.listStyle 설정
        List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(.grouped)
        */
        
        /*
        //Form과 다르게 List는 ForEach를 사용하지 않고 동적 행을 생성할 수 있음
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
         */
        
        /*
        //id 매개변수
        List(people, id: \.self) {
            Text($0)
        }
         */
        
        //+ 동적, 정적 row 같이
        List {
            Text("Static Row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static Row")
        }
    }
    
    //main 앱 번들에 있는 파일의 URL 읽기
    func loadFile() {
        //파일이 존재하지 않을 수 있어서 옵셔널 바인딩
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            //URL이 있으면 문자열 읽기
            //파일을 찾을 수 없거나 로드할 수 없으면 오류가 발생할 수 있으므로 try
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
    }
    
    func test() {
        /*
        //1) 문자열이 공백으로 분할되어 있는 경우
        let input = "a b c"
        //문자열을 분할하여 문자열 배열로 변환
        let letters = input.components(separatedBy: " ")
         */
        
        /*
        //2) 문자열이 줄바꿈으로 분할되어 있는 경우
        let input = """
a
b
c
"""
        //문자열을 분할하여 문자열 배열로 변환
        let letters = input.components(separatedBy: "\n")
        
        //랜덤 항목 (배열이 비어있을 수 있으므로 옵셔널)
        let letter = letters.randomElement()
        
        //공백 제거
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        */
        
        
        //3) 틀린 철자 확인
        //3-1) 확인 할 단어와 UITextChecker 인스턴스 만들기
        let word = "swift"
        let checker = UITextChecker()
        //3-2) 확인하려는 문자열의 양 알려주기
        //Objective-C는 모든 문자의 전체 길이를 사용하여 Objective-C 문자열 range를 생성하도록 Swift에 요청해야 합
        let range = NSRange(location: 0, length: word.utf16.count)
        //3-3) UITextChecker에서 단어의 철자 오류를 발견한 위치를 보고하도록 요청
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //철자 오류가 없으면 (Objective-C는 optional이 없음) NSNotFound를 반환
        //철자 오류가 없으면 true
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
