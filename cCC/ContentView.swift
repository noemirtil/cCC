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
    @State var pascal: Bool = false // Creates the UpperCamelCase-PascalCase option
    
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            //            Color.ice
            Color("ice")
                .ignoresSafeArea()
                .opacity(0.9)
            VStack {
                Spacer()
                Text("camelCase Converter")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                    .padding()
                    .background(in: RoundedRectangle(cornerRadius: 20))
                    .backgroundStyle(
                        Color("bubble")
                            .opacity(0.8)
                            .gradient)
                    .shadow(radius: 1)
                
                Spacer()
                
                Form {
                    Section {
                        TextField("Please type some words to convert to camelCase", text: $input, axis: .vertical)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        //                            .lineLimit(2, reservesSpace: true)
                            .lineLimit(2...3)
                        
                        //                        add paste button (see storyboard???)
                    }
                    Section {
                        Text("Enjoy this nice converted string:")
                        Text(output) // why no need for a $ ????
                        //                            .lineLimit(2, reservesSpace: true)
                            .lineLimit(2...3)
                        //                        add copy button
                    }
                    Toggle("PascalCase", isOn: $pascal)
                }
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .navigationBarTitleDisplayMode(.inline)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(
                    Color.accentColor
                ) // refers to the accent color defined in the Build Settings window, which points towards the corresponding color in the assets
                .scrollContentBackground(.hidden) // to hide the default gray background of the form
                
                Button("Convert") {
                    convert()
                }
                .padding(18)
                .background(in: RoundedRectangle(cornerRadius: 20))
                .backgroundStyle(
                    Color("bubble")
                        .opacity(0.8)
                        .gradient)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .shadow(radius: 4)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
            
        }
    }
    
    //MARK: - FUNCTIONS
    
    
    
    func convert() {
        output = ""
        var inputWords = [String]() // Creates the empty array for the substrings which will represent each word of the input
        inputWords += input.components(separatedBy: " ") // Appends the substrings to the array based on the space separations
        for compon in inputWords {
            if compon == inputWords[0] && pascal == false { // Applies only to the first word if the PascalCase toggle is unselected
                output += compon.lowercased() // The first word shall be entirely lowercased
            }
            else { // Applies to each other word
                if let firstChar = compon.uppercased().first {// Create an isolated capitalized first character. The .first method makes it optional
                    let cappedWord: String = "\(firstChar)" + compon[compon.index(compon.startIndex, offsetBy: 1)...] // The first character joins back the tail of the word
                    output += cappedWord // All the words are united in a single camelCased String
                }
            }
        }
        input = "" // to reset the input field
    }
}



//MARK: - PREVIEWS


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
