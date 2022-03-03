/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import Foundation
import WebKit

class LegalNoticeViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    let webView = WKWebView()
    let urlfr = "legal_notice_fr"
    let urlen = "legal_notice_en"
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "legal_notice_nav_title".localized
        var htmlPath = String()
        
        let langStr = Locale.current.languageCode
        if langStr == "en" {
            htmlPath = Bundle.main.path(forResource: urlen, ofType: "html")!
        } else {
            htmlPath = Bundle.main.path(forResource: urlfr, ofType: "html")!
        }
        
        let htmlUrl = URL(fileURLWithPath: htmlPath, isDirectory: false)
        webView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
