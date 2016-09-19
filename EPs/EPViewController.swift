import UIKit

class EPViewController: UITableViewController {
    //MARK: Properties
    var ep: EmergencyProcedure?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
          //self.automaticallyAdjustsScrollViewInsets = false
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return ep!.steps.count }
    /*override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
    }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //switch on the procedure step type to determine which type of cell to use
        var cellToReturn:UITableViewCell? = nil
        switch (ep!.steps[(indexPath as NSIndexPath).row].type) {
        case "note":
            let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath) as! NoteCell
            cell.noteLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
 
        case "warning":
            let cell = tableView.dequeueReusableCell(withIdentifier: "warning", for: indexPath) as! WarningCell
            cell.warningLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
        case "memoryStep":
            let cell = tableView.dequeueReusableCell(withIdentifier: "memory", for: indexPath) as! MemoryStepCell
            cell.memoryLabel.text = ep?.steps[(indexPath as NSIndexPath).row].step
            //print(ep?.steps[(indexPath as NSIndexPath).row].step)
            cellToReturn = cell
       
            
        default: break
        }

     return cellToReturn!
    }
}


