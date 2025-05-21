//
//  ContentView.swift
//  camelCaseConv
//
//  Created by noemirtil on 4/5/25.
//

import SwiftUI


/*
 Form: check https://www.swiftbeta.com/textfield-en-swiftui/
 Empezar ahí:
 */


struct ContentView: View {
	@State private var phrase: String = ""
	var body: some View {
		NavigationView {
			Form {
				Section {
					Text("Hello, world!")
				}
				Section {
					TextField("Enter a phrase", text: $phrase)
				}
				Section {
					Text("camelCase result")
					Text("Hello, world!")
				}
			}
			.navigationTitle("SwiftUI")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}


//MARK: - BACKEND

// camelCase converter by Noemí
// Check https://convertcase.net/



//MARK: - PREVIEWS


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
