//
//  TableViewCell.swift
//  poc
//
//  Created by Faerae on 31/10/22.
//

import UIKit

open class TableViewCell<T>: UITableViewCell {
    open var item: T!

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    open func setupViews() {}

    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
