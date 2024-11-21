import SwiftUI
import SwiftData
import BodyDiaryStorage
import BodyDiaryKit
import BodyDiaryUI

@main
struct BodyDiaryApp: App {
    
    private let forceDarkMode: Bool
    
    var sharedModelContainer: ModelContainer = {
        let schema = BodyDiaryStorageService.getCurrentSchema()
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        AppConfigurator().setup()
        
        self.forceDarkMode = true
    }

    var body: some Scene {
        WindowGroup {
            StartAppScreen()
                .preferredColorScheme(forceDarkMode ? .dark : .light)
        }
        .modelContainer(sharedModelContainer)
    }
}