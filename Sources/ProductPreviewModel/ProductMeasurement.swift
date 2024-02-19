import Foundation

public enum ProductMeasurement: Int, Codable {
    case volume
    case weight
    case unknown
}

public extension WeightUnit {
    var productMeasurement: ProductMeasurement {
        switch self {
        case .milliliter, .liter:
            return .volume
        case .microgram, .milligram, .gramm, .kilogramm:
            return .weight
        }
    }
}
