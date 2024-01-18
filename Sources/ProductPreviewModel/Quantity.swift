import Foundation

public struct Quantity: RawRepresentable {
    public typealias RawValue = String

	public let unit: WeightUnit
	public let amount: Double

	public init(amount: Double, unit: WeightUnit) {
		self.amount = amount
		self.unit = unit
	}

	public init?(rawValue: String) {
		guard let firstNonNumericIndex = rawValue.firstIndex(where: { !$0.isNumber }) else {
			return nil
		}
		let numberString = String(rawValue[..<firstNonNumericIndex])
		guard let amount = Double(numberString) else {
			return nil
		}
		self.amount = amount
		switch rawValue {
		case _ where rawValue.lowercased().contains("ml"):
			self.unit = .milliliter
		case _ where rawValue.lowercased().contains("g"):
			self.unit = .gramm
		case _ where rawValue.lowercased().contains("l"):
			self.unit = .liter
		case _ where rawValue.lowercased().contains("kg"):
			self.unit = .kilogramm
		default:
			return nil
		}
	}

	public var rawValue: String {
		return "\(Int(amount).description)\(unit.rawValue)"
	}
}

extension Quantity: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        guard let quantity = Quantity(rawValue: rawValue) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid Quantity format")
        }
        
        self = quantity
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
