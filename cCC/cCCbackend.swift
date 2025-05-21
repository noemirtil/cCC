// By noemirtil - May the 21th, 2025
// Improved calrity, efficiency AND reliability (of the optional)


import SwiftUI
/*
 Form: check https://www.swiftbeta.com/textfield-en-swiftui/
 Empezar ahí:
 */

//MARK: - FRONTEND

//struct ContentView: View {
//	@State private var phrase: String = ""
//	var body: some View {
//		NavigationView {
//			Form {
//				Section {
//					Text("Hello, world!")
//				}
//				Section {
//					TextField("Enter a phrase", text: $phrase)
//				}
//				Section {
//					Text("camelCase result")
//					Text("Hello, world!")
//				}
//			}
//			.navigationTitle("SwiftUI")
//			.navigationBarTitleDisplayMode(.inline)
//		}
//	}
//}

//MARK: - BACKEND

let input = "This is a simple camelCase converter app" // The input shall be already filled with a nice example
var inputWords = [String]() // Creates the empty array for the substrings which will represent each word of the input
inputWords += input.components(separatedBy: " ") // Appends the substrings to the array based on the space separations
var output = "" // Creates the empty output String
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
print(output)

//MARK: - PREVIEWS

//struct ContentView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentView()
//	}
//}
