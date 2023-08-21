//
//  ExUi_UintTestUITests.swift
//  ExUi_UintTestUITests
//
//  Created by 최윤제 on 2023/08/21.
//

import XCTest

final class ExUi_UintTestUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var IDTextField: XCUIElement!
    private var PWTextField: XCUIElement!
    private var PWCheckTextField: XCUIElement!
    private var sighUpButton: XCUIElement!
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        IDTextField = app.textFields["id"]
        PWTextField = app.textFields["pw"]
        PWCheckTextField = app.textFields["pwcheck"]
        sighUpButton = app.buttons["sign"]
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    
    func testSignupViewController_DonotMatchPasswordAndRepeatPassword_PresentErrorAlertDialog() throws {
        // UI tests must launch the application that they test.
        
        // ACT
        IDTextField.tap()
        IDTextField.typeText("kong4170@naver.com")
        
        PWTextField.tap()
        PWTextField.typeText("1234")
        
        PWCheckTextField.tap()
        PWCheckTextField.typeText("1235")
        
        sighUpButton.tap()
        
        //Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),"잘못된 정보를 입력하면 경고창이 떠야하는데 안떴어요")
    }
    
    func testLaunchPerformance() throws {
        //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
        //            // This measures how long it takes to launch your application.
        //            measure(metrics: [XCTApplicationLaunchMetric()]) {
        //                XCUIApplication().launch()
        //            }
        //        }
    }}
