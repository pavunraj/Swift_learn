//
//  leakageDetect.swift
//  leakageDetect
//
//  Created by PavunRaj on 05/11/26.
//

import Foundation

class leakageDetect {
    var name: String?
    
    init(name: String?) {
        self.name = name
//        self.callBack = callBack
    }
    private var callBack: ((Int) -> Void)?
    
    func leakageDetect() {
        helperFunction1()
        helperFunctionwithLeakage()
//        helperFunctionwithoutLeag()
//        helperFunction4()
    }
    
    private func helperFunction1() {
        print("sample")
    }
    private func helperFunctionwithLeakage() {
        callBack = { _ in
            print("HELLO", self.name)
        }
        callBack?(20)
        print("sample2")
    }
    private func helperFunctionwithoutLeag() {
        
        callBack = { [weak self] _ in
            print("HELLO", self?.name)
        }
        callBack?(20)
        print("sample")
    }
    private func helperFunction4() {
        print("sample")
    }
}
