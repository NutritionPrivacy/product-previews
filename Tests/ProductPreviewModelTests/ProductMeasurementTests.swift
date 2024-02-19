import ProductPreviewModel
import XCTest

final class ProductMeasurementTests: XCTestCase {

    func test_rawValue_conversion() {
        // Explicitly test raw value conversion since we use integers to save space
        XCTAssertEqual(ProductMeasurement(rawValue: 0), ProductMeasurement.volume)
        XCTAssertEqual(ProductMeasurement(rawValue: 1), ProductMeasurement.weight)
        XCTAssertEqual(ProductMeasurement(rawValue: 2), ProductMeasurement.unknown)
    }

}
