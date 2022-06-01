//
//  QuadTreeViewModel.swift
//  QuadTree
//
//  Created by Aaditya Singh on 01/06/22.
//

import Foundation
import SwiftUI

enum Mode {
    case add, find
}



final class QuadTreeViewModel: ObservableObject {
    //CGRect is nothing but a structure which contains the location and dimension of a rectangle
    private var quadTree = QuadTree(region: CGRect(x: 0, y: 0, width: 1, height: 1))
    //CGSize only contains width and height value
    var windowSize: CGSize?
    //these properties are kinda self explanatory like they initialize a findWindow which is optional so nil at first also points found are stored in an array, CGPoint basically stores points in 2-dimentional plane so more like coordinate geometry and then there's a mode for swapping between views i guess
    //so far so good!
    @Published var findWindow: CGRect?
    @Published var foundPoints: [CGPoint] = []
    @Published var mode: Mode = .add
    
    var info: String {
        switch mode {
        case .add:
            return "Point Count is \(pointCount)"
        case .find:
            return "Found \(foundPoints.count) points out of \(pointCount)"
        }
    }
    
    var points: [CGPoint] {
        quadTree.points()
    }
    
    var regions: [CGRect] {
        quadTree.regions()
    }
    
    //need to learn more about get and set properties
    var pointCount: Int {
        quadTree.count
    }
    
    
    func find(at point: CGPoint, searchSize: CGFloat) {
        guard let size = windowSize  else {
            return
        }
        let searchSize2: CGFloat = searchSize/2
        findWindow = CGRect(x: point.x, y: point.y, width: 0, height: 0).insetBy(dx: -searchSize2, dy: -searchSize2)
        foundPoints = quadTree.find(in: CGRect(x: point.x - searchSize2, y: point.y - searchSize2, width: searchSize / size.width, height: searchSize / size.height))
    }
    
    
    func insert(_ point: CGPoint) {
        guard let size = windowSize else {
            return
        }
        objectWillChange.send()
        let x = point.x / size.width
        let y = point.y / size.height
        quadTree.insert(CGPoint(x: x, y: y))
    }
    
    
    func clear() {
        quadTree = QuadTree(region: CGRect(x: 0, y: 0, width: 1, height: 1))
        foundPoints = []
        mode = .add
        findWindow = nil
        
    }
    
    //kinda getting a hang of it 
    
 
    
    
    
    
}
