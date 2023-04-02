//
//  Created by wyn on 2023/3/29.
//

import SwiftUI
import RealmSwift

let app = RealmSwift.App(id: "{}")

@main
struct ChatApp: SwiftUI.App {
    @StateObject var state = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
        }
    }
}
