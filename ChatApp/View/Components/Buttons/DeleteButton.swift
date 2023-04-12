//
//  Created by wyn on 2023/4/12.
//

import SwiftUI

struct DeleteButton: View {
    let action: () -> Void
    var active = true
    var padding: CGFloat = 8
    var body: some View {
        ButtonTemplate(action: action, active: active, activeImage: "minus.square.fill", inactiveImage: "minus.square", padding: padding)
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DeleteButton(action: {}, active: false)
            DeleteButton(action: {})
            DeleteButton(action: {}, padding: 4)
        }
    }
}
