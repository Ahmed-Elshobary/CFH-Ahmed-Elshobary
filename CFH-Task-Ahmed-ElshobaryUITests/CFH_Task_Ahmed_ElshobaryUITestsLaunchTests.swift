//
//  CFH_Task_Ahmed_ElshobaryUITestsLaunchTests.swift
//  CFH-Task-Ahmed-ElshobaryUITests
//
//  Created by ahmed elshobary on 14/03/2024.
//

import XCTest

final class CFH_Task_Ahmed_ElshobaryUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
