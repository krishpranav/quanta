//
//  PersistenceController.swift
//  quanta
//
//  Created by Krisna Pranav on 08/11/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        for _ in 0..<10 {
            let bookmark = Bookmark(context: controller.container.viewContext)
            bookmark.name = "Google"
            bookmark.url = "https://www.google.com"
        }

        return controller
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Main")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
            }
        }
    }
}
