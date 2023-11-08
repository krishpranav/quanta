//
//  WebViewModel.swift
//  quanta
//
//  Created by Krisna Pranav on 08/11/23.
//

import Foundation
import Combine

class WebViewModel: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTile: String = "Google"
    var showLoader = PassthroughSubject<Bool, Never>()
}

////  WebViewNavigation:
///  - forward
///  - backward
///  - reload
///  - load
enum WebViewNavigation {
    case backward, forward, reload, load
}
