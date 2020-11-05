//
//  UITableView+Extension.swift
//  ios-gox
//
//  Created by Willa on 02/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UITableView{
    
    static var tableViewSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .white
        spinner.frame = CGRect(x: CGFloat.zero, y: CGFloat.zero, width: 44, height: 44)
        return spinner
    }()
    
    /// Register custom table cell to it;s table view
    /// - Parameter type: TableViewCell type
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    
    /// Deque a tableview cell to the tableview, and return UITableViewCell with the given type
    /// In order to make this work, the first  step is register a custom table the corespond table view,
    /// - Parameter type: TableViewCell Type
    /// - Returns: TableViewCell with the given type
    func dequeueReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
    
    /// Scroll tableview to top without animation
    /// row 0 seciton 0
    func scrollToTop() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    
    /// table view scroll to bottom
    /// - Parameter animated: animation, default is true
    func tableViewScrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if (rows > 0){
            self.scrollToRow(at: IndexPath(row: rows - 1, section: sections - 1), at: .bottom, animated: animated)
        }
    }
    
    
    /// determine if the last cell of the tableview is visible on the screen
    /// - Returns: Boolean
    func isLastCellVisible() -> Bool{
        if let visiblePaths = indexPathsForVisibleRows,
            visiblePaths.contains([0, numberOfRows(inSection: self.numberOfSections-1) - 1]) {
            return true
        }else{
             return false
        }
    }
    
    /// If cells is visible (according to last cell perspective), 0 equal to last cell.
    
    /// Determine if the given cell index is visible on the screen, the index is counted from the last cell
    /// - Parameters:
    ///   - lastCellCount: array of index cell, 0 equal to last cell
    ///   - section: section of table cell
    /// - Returns: Boolean
    func visibleCellsForLast(lastCellCount: [Int], inSection section: Int = 0) -> Bool{
        var indexPaths = [IndexPath]()
        lastCellCount.forEach { (i) in
            indexPaths.append(IndexPath(row: numberOfRows(inSection: section) - 1 - i, section: section))
        }
        if let visiblePaths = indexPathsForVisibleRows,
            visiblePaths.contains(where: indexPaths.contains){
            return true
        }else{
             return false
        }
    }
    
    
    /// Is first cell visible
    /// row 0 seciton 0
    /// - Returns: Boolean
    func isFirstCellVisible() -> Bool{
        if let visiblePaths = indexPathsForVisibleRows,
            visiblePaths.contains(IndexPath(row: 0, section: 0)){
            return true
        }else{
            return false
        }
    }
    
    
    /// Add spinner view on table view footer
    /// - Parameter isHidden: is spinner hidden
    func footerSpinnerIsHidden(_ isHidden: Bool){
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .white
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat.zero, y: CGFloat.zero, width: bounds.width, height: 44)
        tableFooterView = spinner
        tableFooterView?.isHidden = isHidden
    }
    
//    /// Add spinner view on table view footer
//    /// - Parameter isHidden: is spinner hidden
//    func headerSpinnerIsHidden(_ isHidden: Bool){
//        let spinner = UIActivityIndicatorView(style: .medium)
//        spinner.color = .white
//        spinner.startAnimating()
//        spinner.frame = CGRect(x: CGFloat.zero, y: CGFloat.zero, width: bounds.width, height: 44)
//        tableHeaderView = spinner
//        tableFooterView?.isHidden = isHidden
//    }
    
    
    /// ADD tableView.addHeaderSpinner() FISRT THEN CALL THIS FUCNTION TO MAKE AN EFFECT
    /// - Parameter spinning: spinner is animatin
    func headerSpinnerIsSpinning(_ spinning: Bool){
        if spinning{
            UITableView.tableViewSpinner.isHidden = false
            UITableView.tableViewSpinner.startAnimating()
        }else{
            UITableView.tableViewSpinner.isHidden = true
            UITableView.tableViewSpinner.stopAnimating()
        }
    }
    
    func addHeaderSpinner(){
        tableHeaderView = UITableView.tableViewSpinner
    }
    
}




