//
//  TableViewController.swift
//  StaticDynamicCellSwift
//
//  Created by xiyang on 2017/4/21.
//  Copyright © 2017年 xiyang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet weak var lab_product: UILabel!
    @IBOutlet weak var lab_info: UILabel!
    
    lazy var dataSource:NSMutableArray = {
        
        return NSMutableArray()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "产品详情"
        self.tableView.register(UINib.init(nibName: "XYTableViewCell", bundle: nil), forCellReuseIdentifier: "XYTableViewCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 200
        self.lab_product.text = "波音747"
        self.lab_info.text = "波音747（英语：Boeing 747）是由美国波音公司在上个世纪六十年代末在美国空军的主导下推出的大型商用宽体客/货运输机（Wide-body commercial airliner and cargo transport aircraft）亦为世界上第一款宽体民用飞机，自1970年投入服务后，到空客A380投入服务之前，波音747保持全世界载客量最高飞机的纪录长达37年。"
        self.dataSource = NSMutableArray(array: ["开着可爽了","能够上天啊","66666666666我要上天，请不要拦我","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","开着可爽了","能够上天啊","66666666666我要上天，请不要拦我","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"])
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==1 {
            return self.dataSource.count
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section==1 {
            let cell:XYTableViewCell = tableView.dequeueReusableCell(withIdentifier: "XYTableViewCell", for: indexPath) as! XYTableViewCell
            cell.lab_content.text = self.dataSource[indexPath.row] as? String
            return cell
        }

        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.tableView.rowHeight
        
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==1 {
            return 50
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let w = self.view.bounds.size.width/2.0
            let headView = UIView(frame: CGRect(x: 0, y: 0, width: 2*w, height: 50))
            headView.backgroundColor = UIColor.white
            let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: w, height: 50))
            btn1.setTitle("评论", for: .normal)
            btn1.backgroundColor = UIColor.red
            headView.addSubview(btn1)
            
            let btn2 = UIButton(frame: CGRect(x: w, y: 0, width: w, height: 50))
            btn2.setTitle("咨询", for: .normal)
            btn2.setTitleColor(UIColor.white, for: .normal)
            btn2.backgroundColor = UIColor.red
            headView.addSubview(btn2)
            
            return headView
 
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1 {
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }
    
    

}
