import Foundation

/// Use int instead of string to reduce the file size
public enum DataSource: Int, Codable {
	case openFoodFacts
	case nutritionPrivacy
}
