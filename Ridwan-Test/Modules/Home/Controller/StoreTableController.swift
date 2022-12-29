//
//  StoreTableController.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 29/12/22.
//

import Foundation
import UIKit
import LBTATools

protocol StoreTableControllerDelegate: AnyObject {
    func storeTableController(
        _ storeTableController: StoreTableController,
        didSelectItemAt index: Int,
        storeModel: StoreViewModel
    )
}

class StoreTableController: TableViewController<StoreListCell, StoreViewModel> {
    let cellId: String = "cellId"
    
    weak var storeDelegate: StoreTableControllerDelegate?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        storeDelegate?.storeTableController(self,
                                            didSelectItemAt: indexPath.row,
                                            storeModel: items[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                 for: indexPath) as! StoreListCell
        cell.item = items[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
