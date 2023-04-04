//
//  Created by wyn on 2023/4/4.
//

import Foundation
import RealmSwift

final class Photo: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var id = UUID().uuidString
    @Persisted var thumbNail: Data?
    @Persisted var picture: Data?
    @Persisted var date: Date?
}
