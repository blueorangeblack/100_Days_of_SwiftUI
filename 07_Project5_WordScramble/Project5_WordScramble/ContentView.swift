//
//  ContentView.swift
//  Project5_WordScramble
//
//  Created by Minju Lee on 2021/12/27.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {

        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        // 1. lowercase and trim the word, to make sure we don't add duplicate words with case differences
        // 소문자로 바꾸고 공백제거
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 2. exit if the remaining string is empty
        // 1자 이상인지 확인
        guard answer.count > 0 else { return }
        
        // 3. validation
        // 유효성 검사
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        // 4. Insert that word at position 0 in the usedWords array
        // usedWords 배열의 가장 앞에 해당 단어 추가
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        // 5. Set newWord back to be an empty string
        //newWord 초기화
        newWord = ""
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        // 번들에서 start.txt 찾기
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            // 2. Load start.txt into a string
            // 문자열에 로드
            if let startWords = try? String(contentsOf: startWordsURL) {
                
                // 3. Split the string up into an array of strings, splitting on line breaks
                // 줄바꿈 기준으로 문자열을 나눠서 배열로 만들기
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                // 임의의 단어를 루트단어로 설정하기. 할 수 없다면 silkworm을 기본 값으로 설정
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // If we are here everything has worked, so we can exit
                return
            }
        }
        
        // If were are *here* then there was a problem – trigger a crash and report the error
        // url을 찾을 수 없거나(bundle에서 start.txt를 찾을수 없거나), 로드할 수 없는 경우
        fatalError("Could not load start.txt from bundle.")
    }
    
    // 1) 이미 사용한 단어인지 확인
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // 2) 사용할 수 있는 단어인지 확인
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    // 3) 철자가 맞는 단어인지 확인
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        // 확인하려는 문자열의 양 알려주기
        // Objective-C는 모든 문자의 전체 길이를 사용하여 Objective-C 문자열 range를 생성하도록 Swift에 요청해야 함
        let range = NSRange(location: 0, length: word.utf16.count)
        // UITextChecker에서 단어의 철자 오류를 발견한 위치를 보고하도록 요청
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        // 철자 오류가 없으면 (Objective-C는 optional이 없음) NSNotFound를 반환
        // 철자 오류가 없으면 true
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
