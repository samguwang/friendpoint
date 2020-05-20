//
//  ContentView.swift
//  friendpoint
//
//  Created by Sam Wang on 5/16/20.
//  Copyright © 2020 Sam Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GoogleMapsView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
