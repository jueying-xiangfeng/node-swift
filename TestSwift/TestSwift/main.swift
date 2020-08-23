//
//  main.swift
//  TestSwift
//
//  Created by Key on 2020/8/18.
//  Copyright © 2020 阅文. All rights reserved.
//

import Foundation

/************************/
// MARK: - 枚举
/*
 枚举内存窥探
 */
//enumTest1()
//enumTest2()
//enumTest3()
//enumTest4()
//enumTest5()
//enumTest6()


//enum TestEnum {
//    case test1(Int, Int, Int)
//    case test2(Int, Int)
//    case test3(Int)
//    case test4(Bool)
//    case test5
//}
//
////var t1 = TestEnum.test1(10, 20, 30)
////print(Mems.ptr(ofVal: &t1))
//
//var t1 = TestEnum.test5
////    t = .test3(6)
////    t = .test4(true)
////    t = .test5
//
//
//switch t1 {
//case let .test1(a1, a2, a3):
//    print("test1 -", a1, "-", a2, "-", a3)
////case let .test2(a1, a2):
////    print("test2 -", a1, "-", a2)
////case let .test3(a1):
////    print("test3 -", a1)
////case let .test4(a1):
////    print("test4 -", a1)
//case .test5:
//    print("test5 -")
//default:
//    break
//}
//
//
//print(Mems.ptr(ofVal: &t1))


/************************/
// MARK: - 结构体、类
//structAndClassTest1()
//structAndClassTest2()
//structAndClassTest3()
//structAndClassTest4()
//structAndClassTest5()
//structAndClassTest6()

/// 汇编层面分析
//struct Point {
//    var x: Int
//    var y: Int
//}
//
//var p1 = Point(x: 10, y: 20)
//var p2 = p1
//p2.x = 11
//p2.y = 22
//print("---")



/************************/
// MARK: - 闭包
//closureTest1()
//closureTest2()
//closureTest3()

//class Person {
//    var age = 1
//}
//
//typealias Fn = (Int) -> Int
//func getFn() -> Fn {
//    var a1 = 1
//    var a2 = 2
//    func plus(_ i: Int) -> Int {
//        a1 += i
//        a2 += i
//        return a1 + a2
//    }
//    return plus
//} // 返回的 plus 和 num 形成闭包
//
//var fn1 = getFn()
//
//print(MemoryLayout.stride(ofValue: fn1))
//
//fn1(1)
//print(fn1(1))


/************************/
// MARK: - 属性
//propertyTest1()
//propertyTest2()
//propertyTest3()
//propertyTest4()
propertyTest5()
