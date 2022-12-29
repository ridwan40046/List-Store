//
//  ViewModel.swift
//  poc
//
//  Created by Faerae on 31/10/22.
//

class ViewModel<T> {
    var item: T!
    init(_ item: T) { setItem(item) }
    private func setItem(_ item: T) { self.item = item}
}
