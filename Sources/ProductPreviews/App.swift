import Foundation
import OpenFoodFactsModels
import NutritionPrivacyModels
import ProductPreviewModel

@main
public struct App {
	public static func main() async throws{
		let target = URL(fileURLWithPath: "./public")
		var packages = [LanguagePackage]()
		let openFoodFactsExtractor = ProductExtractor<OpenFoodFactsModels.Product>()
		let openFoodFactsPackages = try await openFoodFactsExtractor.start(source: .init(fileURLWithPath: "openfoodfacts-products.jsonl"),
																		   target: target,
																		   dataSource: .openFoodFacts)
		packages.append(contentsOf: openFoodFactsPackages)
		let data = try JSONEncoder().encode(packages)
		try data.write(to: target.appendingPathComponent("overview.json"))
	}
}
