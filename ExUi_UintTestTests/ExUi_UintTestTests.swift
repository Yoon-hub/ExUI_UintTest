//
//  ExUi_UintTestTests.swift
//  ExUi_UintTestTests
//
//  Created by 최윤제 on 2023/08/21.
//

import XCTest
@testable import ExUi_UintTest

final class ExUi_UintTestTests: XCTestCase {
    
    var loginValidator: LoginValidator!
    
    override func setUpWithError() throws { // 테스트코드 실행전 값을 세팅하는 부분
        loginValidator = LoginValidator()
    }
    
    override func tearDownWithError() throws { // 모든 테스트가 호출 후에 호출
        loginValidator = nil
    }
    
    
    /*
     테스트 이름 작성법
     1. test할 class명 앞에 test를 붙인다
     2. test할 상황 설명
     3. 예상되는 결과
     */
    
    /*
     테스트 순서
     Arrange -> Act -> Assert
     Arrange: 테스트에 필요한 클래스나 객체를 나열
     Act: 테스트를 진핼할 어떠한 행동을 나타냄
     Assert: Act를 XCAssert에서 실행합니다. (,를 붙이고 만약 원하는 결과가 나오지 않았을 때를 에러로 알려줄 수 있습니다.)
     */
    
    func testLoginValidtor_WhenValidEmailProvided_ShouldReturnTrue() { // 테스트 코드를 작성하는 메인 코드
        // Arrage
        let user = User(email: "kong4170@naver.com", password: "1234")
        
        // Act
        let emailValid = loginValidator.isValidEmail(email: user.email)
        
        //Assert
        XCTAssertTrue(emailValid, "emailValid은 True를 반환해야되는데 False를 반환했어 @를 포함시켜야 해!")
        
    }
    
    func testPerformanceExample() throws { // 성능 측정
        
        measure {
        }
    }
    
}
