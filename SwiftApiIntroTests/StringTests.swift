//
//  StringTests.swift
//  SwiftApiIntro
//
//  Created by 有村 皓太郎 on 2017/04/18.
//
//

import XCTest

class StringTests: XCTestCase {
    
    func testReplace() {
        let hoge = "hoge"
        let koge = hoge.replacingOccurrences(of: "h", with: "k")
        
        XCTAssertEqual(hoge, "hoge")
        XCTAssertEqual(koge, "koge")
    }
    
    func testClass(){
        let hoge = "hoge"
        let type = String(describing: type(of: hoge))
        XCTAssertEqual(type, "String")
    }
    
    func testUtf16(){
        //from https://oleb.net/blog/2016/08/swift-3-strings/
        let single = "Pok\u{00E9}mon"
        let double = "Pok\u{0065}\u{0301}mon"
        
        XCTAssertEqual(single, "Pokémon")
        XCTAssertEqual(double, "Pokémon")
        
        XCTAssertEqual(single.utf16.count, 7)
        XCTAssertEqual(double.utf16.count, 8)
    }
}
