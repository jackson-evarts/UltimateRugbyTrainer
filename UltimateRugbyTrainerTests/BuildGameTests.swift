//
//  BuildGameTests.swift
//  UltimateRugbyTrainerTests
//
//  Created by Jackson Evarts on 10/5/24.
//

import XCTest
@testable import UltimateRugbyTrainer

final class BuildGameTests: XCTestCase {

    // 1. Happy Path
    func testSuccessfulIntensity1Build(){
        // a. Given (Arrange)
        let intensity = 1
        let playLogic = PlayLogic()
        
        
        // b. When (Act)
        let gameArr = playLogic.buildGame(intensity: intensity)
        
        
        // c. Then (Assert)
        //XCTAssert(gameArr.contains((0, "Kickoff")))
        
    }

}
