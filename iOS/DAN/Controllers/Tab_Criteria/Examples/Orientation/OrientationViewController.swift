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

import UIKit

class OrientationViewController: DefaultTableViewController {

    let textCellIdentifier      = "textCell"
    let buttonCellIdentifier    = "buttonCell"
    let buttonCellNoAccessibleIdentifier    = "buttonNoAccessibleCell"

    let accessibleSection           = 1
    let accessibleCustomSection     = 2
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = .infosButton(self, action: #selector(displayVoiceOverMessage(_:)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private methods
    override func setUpDatas() {
        
        sectionHeaders = [
            "common_description",
            "common_accessibleExample",
            "common_notAccessibleExample"
        ]
        
        cellsContent = [
            ["example_orientation_description"],
            [""],
            [""]
        ]
    }
    
    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).section == 0 {
            
            let textCell: TextTableViewCell
            
            textCell            = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! TextTableViewCell
            textCell.label.text = cellsContent[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].localized
            
            return textCell
        }
        else if (indexPath as NSIndexPath).section == accessibleCustomSection {
            
            let buttonCell: ButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: buttonCellNoAccessibleIdentifier, for: indexPath) as! ButtonTableViewCell
            buttonCell.button.setTitle("example_orientation_buttonText".localized, for: UIControl.State())
            return buttonCell
        }
        else {
            
            let buttonCell: ButtonTableViewCell = tableView.dequeueReusableCell( withIdentifier: buttonCellIdentifier, for: indexPath) as! ButtonTableViewCell
            
            buttonCell.button.setTitle("example_orientation_buttonText".localized, for: UIControl.State())
            buttonCell.button.tag                   = (indexPath as NSIndexPath).section // allow to differenciate buttons while preparing for segue
            
            return buttonCell
        }
    }
    
    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath as NSIndexPath).section == 0 {
            
            return UITableView.automaticDimension
        }
        else {
            
            return 90;
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}

