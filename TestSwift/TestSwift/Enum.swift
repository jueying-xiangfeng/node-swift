//
//  Enum.swift
//  TestSwift
//
//  Created by Key on 2020/8/18.
//  Copyright © 2020 阅文. All rights reserved.
//

import Foundation


/************************/
/*
 枚举内存窥探
 
 如下实验：枚举、原始值、关联值 各种情况
 
 - 1 个字节存储成员值
 - N 个字节存储关联值（N取占用内存最大的关联值），任何一个 case 的关联值都公用这 N 个字节
 
 （共用体）
 */

func enumTest1() {
    enum TestEnum {
        case test1, test2, test3, test4
    }

    var t = TestEnum.test1

    print(Mems.ptr(ofVal: &t))

    t = .test2
    t = .test3

    print(MemoryLayout<TestEnum>.size)      // 1
    print(MemoryLayout<TestEnum>.stride)    // 1
    print(MemoryLayout<TestEnum>.alignment) // 1
    // 00 00 00 00 00 00 00 00
    // 01 00 00 00 00 00 00 00
    // 02 00 00 00 00 00 00 00
}

func enumTest2() {
    // 枚举 - 原始值
    enum TestEnum : Int {
        case test1 = 1, test2 = 2, test3 = 3
    }

    var t = TestEnum.test1
    // 00 00 00 00 00 00 00 00
    print(Mems.ptr(ofVal: &t))

    t = .test2
    // 01 00 00 00 00 00 00 00
    
    t = .test3
    // 02 00 00 00 00 00 00 00
    
    print(MemoryLayout<TestEnum>.size)      // 1
    print(MemoryLayout<TestEnum>.stride)    // 1
    print(MemoryLayout<TestEnum>.alignment) // 1
}

func enumTest3() {
    // 枚举 - 关联值
    enum TestEnum {
        case test1(Int, Int, Int)
        case test2(Int, Int)
        case test3(Int)
        case test4(Bool)
        case test5
    }

    var t = TestEnum.test1(1, 2, 3)
    // 01 00 00 00 00 00 00 00
    // 02 00 00 00 00 00 00 00
    // 03 00 00 00 00 00 00 00
    // 00
    // 00 00 00 00 00 00 00
    
    
    print(Mems.ptr(ofVal: &t))
    
    t = .test2(4, 5)
    // 04 00 00 00 00 00 00 00
    // 05 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 01
    // 00 00 00 00 00 00 00
    
    
    t = .test3(6)
    // 06 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 02
    // 00 00 00 00 00 00 00
    
    
    t = .test4(true)
    // 01 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 03
    // 00 00 00 00 00 00 00
    
    
    t = .test5
    // 00 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 00 00 00 00 00 00 00 00
    // 04
    // 00 00 00 00 00 00 00
    
    print(MemoryLayout<TestEnum>.size)      // 25
    print(MemoryLayout<TestEnum>.stride)    // 32
    print(MemoryLayout<TestEnum>.alignment) // 8
}

/// switch 原理 -- 汇编分析
func enumTest4() {
    // 枚举 - 关联值
    enum TestEnum {
        case test1(Int, Int, Int)
        case test2(Int, Int)
        case test3(Int)
        case test4(Bool)
        case test5
    }
    
    var t1 = TestEnum.test1(10, 20, 30)
    t1 = .test2(4, 5)
//    t = .test3(6)
//    t = .test4(true)
//    t = .test5
    
    
    switch t1 {
    case let .test1(a1, a2, a3):
        print("test1 -", a1, "-", a2, "-", a3)
    case let .test2(a1, a2):
        print("test2 -", a1, "-", a2)
    case let .test3(a1):
        print("test3 -", a1)
    case let .test4(a1):
        print("test4 -", a1)
    case .test5:
        print("test5 -")
    }
    
    var aa = 1 ?? 2
    
    
    print(Mems.ptr(ofVal: &t1))
    
    
    print(MemoryLayout<TestEnum>.size)      // 1
    print(MemoryLayout<TestEnum>.stride)    // 1
    print(MemoryLayout<TestEnum>.alignment) // 1
}
