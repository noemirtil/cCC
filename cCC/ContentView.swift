//
//  ContentView.swift
//
//  camelCaseConverter
//
//  Created by noemirtil on 24/5/25.
//
// Check https://convertcase.net/
// Form: check https://www.swiftbeta.com/textfield-en-swiftui/


import SwiftUI

struct ContentView: View {
    
    //MARK: - VARIABLES
    //    @State var input = "This is a simple camelCase converter app"
    @State private var input: String = "" // Creates the empty input String
    // why private?
    @State var output: String = "" // Creates the empty output String
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, tester!")
                }
                Section {
                    TextField("Words to convert to camelCase", text: $input)
                        .disableAutocorrection(true)
                }
                Section {
                    Text("camelCase result:")
                    Text(output)
                }
                Button("Convert") {
                    convert()
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    //MARK: - FUNCTIONS
    
    
    
    func convert() {
        output = ""
        var inputWords = [String]() // Creates the empty array for the substrings which will represent each word of the input
        inputWords += input.components(separatedBy: " ") // Appends the substrings to the array based on the space separations
        for compon in inputWords {
            if compon == inputWords[0] { // Applies only to the first word
                output += compon.lowercased() // The first word shall be entirely lowercased
            }
            else { // Applies to each other word
                if let firstChar = compon.uppercased().first {// Create an isolated capitalized first character. The .first method makes it optional
                    let cappedWord: String = "\(firstChar)" + compon[compon.index(compon.startIndex, offsetBy: 1)...] // The first character joins back the tail of the word
                    output += cappedWord // All the words are united in a single camelCased String
                }
            }
        }
        input = ""
        //        print(output) // for debugging
    }
}



    //MARK: - PREVIEWS


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
