import Foundation
import Core
import ProductPreviewModel

public struct ProductPreview: SmallProductConvertable, Decodable {
    let underlyingProductPreview: Components.Schemas.ProductPreview
    
    public init(from decoder: Decoder) throws {
        self.underlyingProductPreview = try Components.Schemas.ProductPreview(from: decoder)
    }
    
    public func getNames() -> [Core.Language : String] {
        var result: [Core.Language: String] = [:]
        if let german = underlyingProductPreview.names.first(where: { $0.languageCode == "de" }), let value = german.value {
            result[.german] = value
        }
        if let english = underlyingProductPreview.names.first(where: { $0.languageCode == "en" }), let value = english.value {
            result[.english] = value
        }
        return result
    }
    
    public func getBrand() -> String? {
        underlyingProductPreview.brands?.first?.value
    }
    
    public func getId() -> String {
        underlyingProductPreview.id
    }
    
    public func getEnergy() -> Int {
        underlyingProductPreview.calories
    }
    
    public func getQuantity() -> Quantity? {
        underlyingProductPreview.totalQuantity?.previewQuantity
    }
    
    public func getServing() -> String? {
        nil
    }
}

extension Components.Schemas.Quantity {
    var previewQuantity: Quantity {
        return .init(amount: Double(value), unit: unit.weightUnit)
    }
}

extension Components.Schemas.Quantity.unitPayload {
    var weightUnit: WeightUnit {
        switch self {
        case .microgram:
            return .microgram
        case .mg:
            return .milligram
        case .g:
            return .gramm
        case .kg:
            return .kilogramm
        case .ml:
            return .milliliter
        case .l:
            return .liter
        }
    }
}
