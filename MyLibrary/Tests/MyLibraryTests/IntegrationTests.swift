import XCTest
@testable import MyLibrary

final class IntegrationTests: XCTestCase {
    func testIntegrationTest() async throws{
        // Given
        let weatherService = WeatherServiceImpl()
        // When
        let myTemp = try await weatherService.getTemperature()
        // Then
        XCTAssertNotNil(myTemp)
        
        // XCTAssert(myTemp == 298.48)
    }
}
