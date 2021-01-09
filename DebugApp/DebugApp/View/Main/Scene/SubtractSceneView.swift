//
//  SubtractSceneView.swift
//  DebugApp
//
//  Created by Nail Sharipov on 09.01.2021.
//  Copyright © 2021 Nail Sharipov. All rights reserved.
//


import SwiftUI
import iGeometry
import iShapeClipper

struct SubtractSceneView: View {

    @ObservedObject var state = ComplexSceneState(key: String(describing: SubtractSceneView.self), data: SubtractTestData.data)
    @EnvironmentObject var colorSchema: ColorSchema

    private let sceneState: SceneState
    private let iGeom = IntGeom.defGeom

    init(sceneState: SceneState) {
       self.sceneState = sceneState
    }

    private struct Area {
        let index: Int
        let color: Color
        let points: [CGPoint]
    }

    var body: some View {
        var paths = state.paths
        
        let master = paths[0]
        let slave = paths[1]
        
        let iMaster = iGeom.int(points: master)
        let iSlave = iGeom.int(points: slave)
        let solution = Solver.subtract(master: iMaster, slave: iSlave)
        
        var areas = [Area]()
        
        switch solution.nature {
            case .notOverlap:
                areas.append(Area(index: 0, color: ColorSchema.alphaBlue, points: master.cgPoints))
                areas.append(Area(index: 1, color: ColorSchema.alphaBlue, points: slave.cgPoints))
            case .masterIncludeSlave:
                areas.append(Area(index: 0, color: ColorSchema.solution, points: master.cgPoints))
            case .slaveIncludeMaster:
                areas.append(Area(index: 0, color: ColorSchema.solution, points: slave.cgPoints))
            default:
                var i = 0
                for layout in solution.pathList.layouts {
                    if layout.isClockWise {
                        let path = solution.pathList.get(layout: layout)
                        let points = iGeom.float(points: path).cgPoints
                        areas.append(Area(index: i, color: ColorSchema.solution, points: points))
                        i += 1
                    }
                }
                for layout in solution.pathList.layouts {
                    if !layout.isClockWise {
                        let path = solution.pathList.get(layout: layout)
                        let points = iGeom.float(points: path).cgPoints
                        areas.append(Area(index: i, color: ColorSchema.blue, points: points))
                        i += 1
                    }
                }
        }
        
        let shape: PlainShape
        if paths.count == 1 {
            shape = PlainShape(iGeom: iGeom, hull: master)
        } else {
            let hull = paths.remove(at: 0)
            shape = PlainShape(iGeom: iGeom, hull: hull, holes: paths)
        }

        return ZStack {
            ForEach(areas, id: \.index) { area in
                AreaShapeView(
                    sceneState: self.sceneState,
                    points: area.points,
                    color: area.color
                )
            }
            PlainShapeView(sceneState: sceneState, shape: shape, stroke: colorSchema.schema.defaultPolygonStroke, iGeom: iGeom)
        }
    }
}
