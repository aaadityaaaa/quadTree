//
//  QuadTree.swift
//  QuadTree
//
//  Created by Aaditya Singh on 01/06/22.
//

import Foundation
import CoreGraphics.CGBase



struct QuadTree {
    
    private(set) var count = 0
    
    init(region: CGRect) {
        
    }
    
    @discardableResult
    mutating func insert(_ point: CGPoint) -> Bool {
        false
    }
    
    
    func find(in searchRegion: CGRect) -> [CGPoint] {
        []
    }
    
    func points() -> [CGPoint] {
        []
    }
    
    func regions() -> [CGRect] {
        []
    }
    
    
    private final class Node {
        
        let maxItemCapacity = 4
        var points: [CGPoint] = []
        var region: CGRect
        var quad: Quad?
        
        init(region: CGRect, points: [CGPoint] = [], quad: Quad? = nil) {
            self.region = region
            self.points = points
            self.quad = quad
            self.points.reserveCapacity(maxItemCapacity)
            precondition(points.count <= maxItemCapacity)
        }
        
        
        
        
        
        struct Quad {
            
        }
    }
    
    
    
    
}






