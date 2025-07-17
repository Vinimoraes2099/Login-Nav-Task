import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool = false
    var createdAt: Date = Date()
}
