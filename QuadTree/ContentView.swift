//
//  ContentView.swift
//  QuadTree
//
//  Created by Aaditya Singh on 31/05/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = QuadTreeViewModel()
    
    private var drag: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged { gesture in
            switch  model.mode {
            case .add:
                model.insert(gesture.location)
            case .find:
                model.find(at: gesture.location, searchSize: 40)
            }
            
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("mode", selection: $model.mode) {
                    Text("add points").tag(Mode.add)
                    Text("Find points").tag(Mode.find)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Text(model.info)
                
                QuadTreeView(model: model)
                    .gesture(drag)
                    .onPreferenceChange(SizeKey.self) { key in
                        model.windowSize = key
                    }
                
            }.navigationTitle("Quad Tree Representation")
                .toolbar { 
                    Button("clear") {
                        model.clear()
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
