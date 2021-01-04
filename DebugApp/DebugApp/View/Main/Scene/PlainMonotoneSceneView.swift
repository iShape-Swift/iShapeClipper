//
//  UnionSceneView.swift
//  DebugApp
//
//  Created by Nail Sharipov on 09.08.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import SwiftUI
import iGeometry
import iShapeClipper

struct UnionSceneView: View {

    @ObservedObject var state = ComplexSceneState(key: String(describing: UnionSceneView.self), data: UnionTestData.data)
    @EnvironmentObject var colorSchema: ColorSchema

    private let sceneState: SceneState
    private let iGeom = IntGeom.defGeom

    init(sceneState: SceneState) {
       self.sceneState = sceneState
    }

    private struct Triangle {
       let index: Int
       let points: [CGPoint]
    }

    var body: some View {
        var paths = state.paths
        
        let iMaster = iGeom.int(points: paths[0])
        let iSlave = iGeom.int(points: paths[1])
        let solution = Solver.union(master: iMaster, slave: iSlave)
        
        switch solution.nature {
            case .notOverlap:
                self.addSublayer(ShapeArea(points: master.toCGPoints(), color: Colors.alphaBlue))
                self.addSublayer(ShapeArea(points: slave.toCGPoints(), color: Colors.alphaBlue))
            case .masterIncludeSlave:
                self.addSublayer(ShapeArea(points: master.toCGPoints(), color: Colors.solution))
            case .slaveIncludeMaster:
                self.addSublayer(ShapeArea(points: slave.toCGPoints(), color: Colors.solution))
            default:
                for layout in solution.pathList.layouts {
                    if layout.isClockWise {
                        let path = solution.pathList.get(layout: layout)
                        let points = iGeom.float(points: path).toCGPoints()
                        self.addSublayer(ShapeArea(points: points, color: Colors.solution))
                    }
                }
                for layout in solution.pathList.layouts {
                    if !layout.isClockWise {
                        let path = solution.pathList.get(layout: layout)
                        let points = iGeom.float(points: path).toCGPoints()
                        self.addSublayer(ShapeArea(points: points, color: Colors.blue))
                    }
                }
        }
        
        
//        if paths.count == 1 {
//            shape = PlainShape(iGeom: iGeom, hull: paths[0])
//        } else {
//            let hull = paths.remove(at: 0)
//            shape = PlainShape(iGeom: iGeom, hull: hull, holes: paths)
//        }
//
//        let points = iGeom.float(points: shape.points)
//
//        let indices = shape.triangulate()
//        var triangles = [Triangle]()
//        triangles.reserveCapacity(indices.count / 3)
//        var i = 0
//        while i < indices.count {
//            let a = CGPoint(points[indices[i]])
//            let b = CGPoint(points[indices[i + 1]])
//            let c = CGPoint(points[indices[i + 2]])
//            triangles.append(Triangle(index: i / 3, points: [a, b, c]))
//            i += 3
//        }
//
//        let stroke = colorSchema.schema.defaultTriangleStroke

        return ZStack {
            ForEach(triangles, id: \.index) { triangle in
                PolygonShapeView(
                    sceneState: self.sceneState,
                    points: triangle.points,
                    index: triangle.index,
                    stroke: stroke,
                    lineWidth: 1.2
                )
            }
            PlainShapeView(sceneState: sceneState, shape: shape, stroke: colorSchema.schema.defaultPolygonStroke, iGeom: iGeom)
        }
    }
}
