//
//  LightWeightMigration_CoreDataApp.swift
//  LightWeightMigration CoreData
//
//  Created by PavunRaj on 06/11/26.
//

import SwiftUI
import CoreData

@main
struct LightWeightMigration_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
