import UIKit

class EPViewController: UITableViewController {
    //MARK: Properties
    var ep: EmergencyProcedure?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        self.view.backgroundColor = UIColor.epYellow()
        tableView.separatorStyle = .none
    }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
          //self.automaticallyAdjustsScrollViewInsets = false
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return ep!.steps.count }
    /*override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
    }*/
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.epYellow()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //switch on the procedure step type to determine which type of cell to use
        var cellToReturn:UITableViewCell? = nil
        switch (ep!.steps[(indexPath as NSIndexPath).row].type) {
        case "warning":
            let cell = tableView.dequeueReusableCell(withIdentifier: "warning", for: indexPath) as! WarningCell
            cell.warningLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            cell.warningLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
            cell.warningTitleLabel.text = "Warning"
            cell.warningTitleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
        case "caution":
            let cell = tableView.dequeueReusableCell(withIdentifier: "caution", for: indexPath) as! CautionCell
            print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cell.cautionLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            cell.cautionLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
            cell.cautionTitleLabel.text = "Caution"
            cell.cautionTitleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
        case "note":
            let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath) as! NoteCell
            cell.noteLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            cell.noteLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
            cell.noteTitleLabel.text = "Note"
            cell.noteTitleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
        case "memoryStep":
            let cell = tableView.dequeueReusableCell(withIdentifier: "memory", for: indexPath) as! MemoryStepCell
            cell.memoryLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            cell.memoryLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
            
        case "step":
            let cell = tableView.dequeueReusableCell(withIdentifier: "step", for: indexPath) as! StepCell
            cell.stepLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            cell.stepLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
            
        case "logic":
            let cell = tableView.dequeueReusableCell(withIdentifier: "logic", for: indexPath) as! LogicCell
            cell.logicLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            cell.logicLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
            //cell.logicLabel.font = UIFont.font
            //cell.logicLabel.font = UIFont.italicSystemFont(ofSize: 20.0)
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
       
            
        default: break
        }

     return cellToReturn!
    }
}
