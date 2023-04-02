//
//  Created by wyn on 2023/4/2.
//

import Combine
import SwiftUI

final class AppState: ObservableObject {
    @Published var error: String?
    @Published var busyCount = 0

    var cancellables = Set<AnyCancellable>()

    var shouldIndicateActivity: Bool {
        get {
            return busyCount > 0
        } set {
            if newValue {
                busyCount += 1
            } else {
                if busyCount > 0 {
                    busyCount -= 1
                }
            }
        }
    }
}
