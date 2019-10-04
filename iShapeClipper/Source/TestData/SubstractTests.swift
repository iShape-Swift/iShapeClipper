//
//  SubstractTests.swift
//  iShapeClipper
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import iGeometry

struct SubstractTests {
    
    struct Result {
        let master: [Point]
        let slave: [Point]
    }
    
    static let count = 39
    static let active = 38
    
    static func data(index: Int) -> Result {
        
        let master: [Point]
        let slave: [Point]
        
        switch index {
        case 1:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_1()
        case 2:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_2()
        case 3:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_3()
        case 4:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_4()
        case 5:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_5()
        case 6:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_6()
        case 7:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_7()
        case 8:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_8()
        case 9:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_9()
        case 10:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_10()
        case 11:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_11()
        case 12:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_12()
        case 13:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_13()
        case 14:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_14()
        case 15:
            master = SubstractTests.master_15()
            slave = SubstractTests.slave_15()
        case 16:
            master = SubstractTests.master_16()
            slave = SubstractTests.slave_16()
        case 17:
            master = SubstractTests.master_17()
            slave = SubstractTests.slave_spiral()
        case 18:
            master = SubstractTests.master_18()
            slave = SubstractTests.slave_spiral()
        case 19:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_19()
        case 20:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_20()
        case 21:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_21()
        case 22:
            master = SubstractTests.master_22()
            slave = SubstractTests.slave_22()
        case 23:
            master = SubstractTests.master_23()
            slave = SubstractTests.slave_23()
        case 24:
            master = SubstractTests.master_24()
            slave = SubstractTests.slave_24()
        case 25:
            master = SubstractTests.master_25()
            slave = SubstractTests.slave_25()
        case 26:
            master = SubstractTests.master_26()
            slave = SubstractTests.slave_26()
        case 27:
            master = SubstractTests.master_27()
            slave = SubstractTests.slave_27()
        case 28:
            master = SubstractTests.master_28()
            slave = SubstractTests.slave_28()
        case 29:
            master = SubstractTests.master_29()
            slave = SubstractTests.slave_29()
        case 30:
            master = SubstractTests.master_30()
            slave = SubstractTests.slave_30()
        case 31:
            master = SubstractTests.master_31()
            slave = SubstractTests.slave_spiral()
        case 32:
            master = SubstractTests.master_32()
            slave = SubstractTests.slave_spiral()
        case 33:
            master = SubstractTests.master_33()
            slave = SubstractTests.slave_spiral()
        case 34:
            master = SubstractTests.master_34()
            slave = SubstractTests.slave_spiral()
        case 35:
            master = SubstractTests.master_35()
            slave = SubstractTests.slave_spiral_modified_0()
        case 36:
            master = SubstractTests.master_36()
            slave = SubstractTests.slave_36()
        case 37:
            master = SubstractTests.master_37()
            slave = SubstractTests.slave_37()
        case 38:
            master = SubstractTests.master_38()
            slave = SubstractTests.slave_spiral()
        default:
            master = SubstractTests.master_square()
            slave = SubstractTests.slave_0()
        }
    
        return Result(master: master, slave: slave)
    }
    
    private static func master_square() -> [Point] {
        return [
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10)
        ]
    }
    
    
    private static func slave_0() -> [Point] {
        return [
            Point(x: -5, y: -15),
            Point(x: 5, y: -15),
            Point(x: 5, y: 0),
            Point(x: -5, y: 0)
        ]
    }
    
    
    private static func slave_1() -> [Point] {
        return [
            Point(x: -5, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 15),
            Point(x: -5, y: 15)
        ]
    }
    
    
    private static func slave_2() -> [Point] {
        return [
            Point(x: -5, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 15),
            Point(x: -5, y: 10)
        ]
    }
    
    
    private static func slave_3() -> [Point] {
        return [
            Point(x: -5, y: -10),
            Point(x: 15, y: -15),
            Point(x: 15, y: 15),
            Point(x: -5, y: 10)
        ]
    }
    
    
    private static func slave_4() -> [Point] {
        return [
            Point(x: -5, y: -10),
            Point(x: 15, y: -15),
            Point(x: 15, y: 15),
            Point(x: -10, y: 10)
        ]
    }
    
    
    private static func slave_5() -> [Point] {
        return [
            Point(x: 0, y: -10),
            Point(x: 15, y: -15),
            Point(x: 15, y: 15),
            Point(x: -20, y: 10)
        ]
    }
    
    
    private static func slave_6() -> [Point] {
        return [
            Point(x: 15, y: -15),
            Point(x: 15, y: 15),
            Point(x: -15, y: 0)
        ]
    }
    
    
    private static func slave_7() -> [Point] {
        return [
            Point(x: 0, y: -15),
            Point(x: 0, y: 0),
            Point(x: -15, y: 0)
        ]
    }
    
    
    private static func slave_8() -> [Point] {
        return [
            Point(x: 0, y: 0),
            Point(x: 10, y: 0),
            Point(x: 0, y: 10)
        ]
    }
    
    
    private static func slave_9() -> [Point] {
        return [
            Point(x: -5, y: -10),
            Point(x: 5, y: -10),
            Point(x: 0, y: 10)
        ]
    }
    
    
    private static func slave_10() -> [Point] {
        return [
            Point(x: -5, y: 5),
            Point(x: 0, y: -10),
            Point(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_11() -> [Point] {
        return [
            Point(x: -30, y: -10),
            Point(x: 0, y: -10),
            Point(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_12() -> [Point] {
        return [
            Point(x: 0, y: 0),
            Point(x: 10, y: -5),
            Point(x: 10, y: 5)
        ]
    }
    
    
    private static func slave_13() -> [Point] {
        return [
            Point(x: 5, y: -10),
            Point(x: -5, y: -10),
            Point(x: 0, y: -15)
        ]
    }
    
    
    private static func slave_14() -> [Point] {
        return [
            Point(x: -5, y: 10),
            Point(x: -10, y: 5),
            Point(x: -10, y: -5),
            Point(x: -5, y: -10),
            Point(x: 5, y: -10),
            Point(x: 10, y: -5),
            Point(x: 10, y: 5),
            Point(x: 5, y: 10)
        ]
    }
    
    
    private static func slave_15() -> [Point] {
        return [
            Point(x: 0, y: 10),
            Point(x: 0, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 10)
        ]
    }
    
    
    private static func master_15() -> [Point] {
        return [
            Point(x: -10, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10)
        ]
    }
    
    private static func slave_16() -> [Point] {
        return [
            Point(x: -10, y: 10),
            Point(x: -10, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: 10)
        ]
    }
    
    
    private static func master_16() -> [Point] {
        return [
            Point(x: -5, y: 0),
            Point(x: 5, y: 0),
            Point(x: 0, y: -5),
            Point(x: -5, y: -5)
        ]
    }
    
    
    private static func slave_spiral() -> [Point] {
        return [
            Point(x: 0, y: 0),
            Point(x: 0, y: 20),
            Point(x: -15, y: 20),
            Point(x: -15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 30),
            Point(x: -25, y: 30),
            Point(x: -25, y: -20),
            Point(x: 20, y: -20),
            Point(x: 20, y: 20),
            Point(x: 15, y: 20),
            Point(x: 15, y: -15),
            Point(x: -20, y: -15),
            Point(x: -20, y: 25),
            Point(x: 5, y: 25),
            Point(x: 5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 0)
            
        ]
    }
    
    private static func master_17() -> [Point] {
        return [
            Point(x: -7.5, y: 10),
            Point(x: 12.5, y: 10),
            Point(x: 12.5, y: 5),
            Point(x: -7.5, y: 5)
        ]
    }
    
    
    private static func master_18() -> [Point] {
        return [
            Point(x: -7.5, y: 2.5),
            Point(x: 12.5, y: 2.5),
            Point(x: 12.5, y: -2.5),
            Point(x: -7.5, y: -2.5)
        ]
    }
    
    private static func slave_19() -> [Point] {
        return [
            Point(x: 10, y: 0),
            Point(x: 0, y: 5),
            Point(x: 0, y: -5)
        ]
    }
    
    private static func slave_20() -> [Point] {
        return [
            Point(x: 10, y: 10),
            Point(x: 0, y: 5),
            Point(x: 5, y: 0)
        ]
    }
    
    
    private static func slave_21() -> [Point] {
        return [
            Point(x: 0, y: 5),
            Point(x: 10, y: 0),
            Point(x: 10, y: -5),
            Point(x: 15, y: 5)
        ]
    }
    
    private static func slave_22() -> [Point] {
        return [
            Point(x: -10, y: 10),
            Point(x: -10, y: -10),
            Point(x: 0, y: -10),
            Point(x: 0, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 10)
        ]
    }
    
    private static func master_22() -> [Point] {
        return [
            Point(x: -5, y: 0),
            Point(x: 5, y: 0),
            Point(x: 5, y: -5),
            Point(x: -5, y: -5)
        ]
    }
    
    private static func slave_23() -> [Point] {
        return [
            Point(x: -10, y: 10),
            Point(x: -10, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 10)
        ]
    }
    
    private static func master_23() -> [Point] {
        return [
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: 5, y: -5)
        ]
    }
    
    
    private static func slave_24() -> [Point] {
        return [
            Point(x: -5, y: 5),
            Point(x: 5, y: -5),
            Point(x: 15, y: -5),
            Point(x: 15, y: 5)
        ]
    }
    
    private static func master_24() -> [Point] {
        return [
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: 5, y: -5)
        ]
    }
    
    private static func slave_25() -> [Point] {
        return [
            Point(x: -5, y: 5),
            Point(x: 5, y: -5),
            Point(x: 25, y: 0),
            Point(x: 15, y: 5)
        ]
    }
    
    private static func master_25() -> [Point] {
        return [
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: 5, y: -5)
        ]
    }

    private static func slave_26() -> [Point] {
        return [
            Point(x: 5, y: 15),
            Point(x: 5, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: 5)
        ]
    }
    
    private static func master_26() -> [Point] {
        return [
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: 5, y: -5)
        ]
    }
    
    private static func slave_27() -> [Point] {
        return [
            Point(x: -10, y: 0),
            Point(x: -10, y: -10),
            Point(x: 5, y: -5),
            Point(x: 10, y: 0)
        ]
    }
    
    private static func master_27() -> [Point] {
        return [
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: 5, y: -5)
        ]
    }
    
    
    private static func slave_28() -> [Point] {
        return [
            Point(x: 0, y: 5),
            Point(x: -20, y: 5),
            Point(x: -20, y: -15),
            Point(x: 10, y: -15),
            Point(x: 10, y: 20),
            Point(x: -20, y: 20),
            Point(x: -20, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 0),
            Point(x: 0, y: 0)
        ]
    }
    
    private static func master_28() -> [Point] {
        return [
            Point(x: -10, y: -5),
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: -5)
        ]
    }
    
    private static func slave_29() -> [Point] {
        return [
            Point(x: 0, y: 5),
            Point(x: -20, y: 5),
            Point(x: -20, y: -15),
            Point(x: 10, y: -15),
            Point(x: 10, y: 20),
            Point(x: -20, y: 20),
            Point(x: -20, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 0),
            Point(x: 0, y: 0)
        ]
    }
    
    private static func master_29() -> [Point] {
        return [
            Point(x: -18.5, y: -3.5),
            Point(x: -15, y: 10),
            Point(x: -5, y: 15),
            Point(x: -10, y: 7)
        ]
    }
    
    private static func slave_30() -> [Point] {
        return [
            Point(x: 5, y: 5),
            Point(x: -15, y: 5),
            Point(x: -15, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: -15, y: 20),
            Point(x: -15, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 0),
            Point(x: 5, y: 0)
        ]
    }
    
    private static func master_30() -> [Point] {
        return [
            Point(x: -5, y: 15),
            Point(x: -0, y: 15),
            Point(x: -0, y: 3),
            Point(x: -5, y: 3)
        ]
    }
    
    private static func master_31() -> [Point] {
        return [
            Point(x: -10, y: 15),
            Point(x: 10, y: 15),
            Point(x: 10, y: -10),
            Point(x: -11, y: -5)
        ]
    }
    
    private static func master_32() -> [Point] {
        return [
            Point(x: -10, y: 15),
            Point(x: 10, y: 15),
            Point(x: 10, y: -10),
            Point(x: -14, y: -4)
        ]
    }
    
    private static func master_33() -> [Point] {
        return [
            Point(x: -23, y: 20),
            Point(x: 7, y: 20),
            Point(x: 7, y: -16),
            Point(x: -20, y: -15)
        ]
    }
    
    private static func master_34() -> [Point] {
        return [
            Point(x: -23, y: 20),
            Point(x: 7, y: 20),
            Point(x: 4, y: -16),
            Point(x: -20, y: -15)
        ]
    }
    
    private static func slave_spiral_modified_0() -> [Point] {
        return [
            Point(x: 0, y: 0),
            Point(x: 0, y: 20),
            Point(x: -15, y: 20),
            Point(x: -15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 30),
            Point(x: -25, y: 30),
            Point(x: -25, y: -20),
            Point(x: 20, y: -20),
            Point(x: 20, y: 20),
            Point(x: 15, y: 20),
            Point(x: 15, y: -14),
            Point(x: -20, y: -14),
            Point(x: -20, y: 25),
            Point(x: 5, y: 25),
            Point(x: 5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 0)
            
        ]
    }
    
    private static func master_35() -> [Point] {
        return [
            Point(x: -20, y: -15),
            Point(x: 12, y: -5),
            Point(x: 15, y: -9),
            Point(x: -15, y: -15)
        ]
    }
    
    private static func slave_36() -> [Point] {
        return [
            Point(x: 0, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 0),
            Point(x: 0, y: 0)
        ]
    }
    
    private static func master_36() -> [Point] {
        return [
            Point(x: 5, y: 10),
            Point(x: 5, y: -5),
            Point(x: -10, y: 10)
        ]
    }
    
    private static func slave_37() -> [Point] {
        return [
            Point(x: 0, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 0),
            Point(x: 0, y: 0)
        ]
    }
    
    private static func master_37() -> [Point] {
        return [
            Point(x: 5, y: 10),
            Point(x: 5, y: -5),
            Point(x: -2, y: 2),
            Point(x:  2, y: 6),
            Point(x:  -2, y: 10)
        ]
    }
    
    
    private static func master_38() -> [Point] {
        return [
            Point(x: -5, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: 10),
            Point(x: -10, y: 10),
            Point(x: -10, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -5),
            Point(x: -5, y: -5)
        ]
    }

}
