//
//  ABTableViewController.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 27.11.2020.
//

import UIKit

class TodoItemsViewController: UITableViewController {
    // MARK: - VARS
    private var items = [TodoItem]()
    private var uniqueDatesArray = [Date]()
    private var sectionsOfItems = [[TodoItem]]()
    private var sectionDates = [Date]()
    private var datesWithItems = [Date: [TodoItem] ]()
    
    let timeFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        return df
    } ()
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        return df
    } ()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = generateTestData()
        self.uniqueDatesArray = uniqueDatesChecking(in: items)
        self.sectionsOfItems = createSectionsOfItems(from: items)
        processItems()
        self.setupUI()
        setupNavigationBar()
        self.title = "ToDoItems List"
        
    }
    
    // MARK: - UI
    fileprivate func setupUI() {
        // table view
        self.tableView.register(ToDoItemTableCell.self, forCellReuseIdentifier: "ToDoItemTableCell")
    }
    
    // MARK: - NAVIGATION BAR
    fileprivate func setupNavigationBar(){
        let addNewItemButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onAddNewItemButton))
        self.navigationItem.rightBarButtonItem = addNewItemButton
        
    }
    
    @objc func onAddNewItemButton(){
        let navigationController = UINavigationController(rootViewController: AddViewController(style: .insetGrouped))
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - DATA
    fileprivate func generateTestData() -> [TodoItem] {
        var items = [TodoItem]()
        let colors: [UIColor?] = [.red, .green, .blue, .purple, .yellow, nil]
        for i in 1...100 {
            items.append(TodoItem(
                name: "Todo Item - \(i)",
                date: Calendar.current.date(byAdding: .day, value: Int.random(in: 1...7), to: Date()) ?? Date(),
                color: colors[Int.random(in: 0...5)],
                priority: Priority(rawValue: Int.random(in: 1...5)) ?? .normal,
                complete: Int.random(in: 1...5) == 1
            ))
        }
        return items
    }
    
    fileprivate func processItems() {
        for item in self.items {
            let date = Calendar.current.startOfDay(for: item.date)
            
            if self.sectionDates.contains(date) {
                self.datesWithItems[date]?.append(item)
            } else {
                self.sectionDates.append(date)
                self.datesWithItems[date] = [ item ]
            }
        }
    }
    
    fileprivate func uniqueDatesChecking(in data: [TodoItem]) -> [Date] {
        guard data.count > 0 else {
            return [Date]()
        }
        guard data.first?.date.onlyDate != nil else { return [Date]() }
        
        // everything is fine
        var uniqueDates = [Date]()
        
        uniqueDates.append((data.first?.date.onlyDate)!)
        var checkDate = data.first?.date.onlyDate
        for item in data {

            if item.date.onlyDate != checkDate {
                if !uniqueDates.contains(item.date.onlyDate) {
                    uniqueDates.append(item.date.onlyDate)
                    checkDate = item.date.onlyDate
                }
            }
        }
        uniqueDates = uniqueDates.sorted()
        return uniqueDates
    }

    fileprivate func createSectionsOfItems(from array: [TodoItem]) -> [[TodoItem]] {
        var sections = [[TodoItem]](repeating: [], count: uniqueDatesArray.count)
        for item in uniqueDatesArray {
            for toDoItem in array {
                if toDoItem.date.onlyDate == item { sections[uniqueDatesArray.firstIndex(of: item)!].append(toDoItem) }
            }
        }
        return sections
    }
    
    // MARK: - HELPERS
    fileprivate func getTimeFrom(date: Date) -> String? {
        return self.timeFormatter.string(from: date)
    }
    fileprivate func getDayFrom(date: Date) -> String? {
        return self.dateFormatter.string(from: date)
    }
    
    // MARK: - ACTIONS
    fileprivate func onCellDoneButton(indexPath: IndexPath) {
        let date = self.sectionDates[indexPath.section]
        guard var items = self.datesWithItems[date] else { return }
        var item = items[indexPath.row]
        item.complete = !item.complete

        items[indexPath.row] = item
        self.datesWithItems[date] = items
        self.tableView.reloadRows(at: [indexPath], with: .automatic)

    }
    
} //class end

// MARK: - Table view data source
extension TodoItemsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionDates.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.black
        (view as! UITableViewHeaderFooterView).textLabel?.textAlignment = .center
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return uniqueDatesArray[section].getDateInString()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datesWithItems[self.sectionDates[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = self.datesWithItems[self.sectionDates[indexPath.section]] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemTableCell", for: indexPath) as! ToDoItemTableCell
        
        let item = items[indexPath.row]
        
        let name = NSMutableAttributedString(string: item.name, attributes: [ .foregroundColor: item.color ?? .black ])
        if item.complete {
            name.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, name.length))
        }
        
        cell.nameLabel.attributedText = name
        cell.timeLabel.text = self.getTimeFrom(date: item.date)
        cell.doneButton.setImage(
            UIImage(systemName: item.complete ? "checkmark.circle" : "circle",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .ultraLight)),
                    for: .normal)
        cell.doneButton.targetAction = { [weak self] in
            self?.onCellDoneButton(indexPath: indexPath)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let items = self.datesWithItems[self.sectionDates[indexPath.section]] else { return }
        
        let viewController = ToDoItemDetailsViewController()
        viewController.item = items[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
        navigationController?.title = "ToDoItem Information"
    }
}






