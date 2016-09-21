/*
 clear background
 only first and last corners rounded
 user clicks an ep and then clicks off reset to main view
 */
import UIKit
import QuartzCore

class EPTableViewController: UITableViewController, UINavigationControllerDelegate, UITabBarControllerDelegate, UITabBarDelegate {
    
    //MARK: Properties
    fileprivate var EmergencyProceduresByLetter = [[EmergencyProcedure]]() //would need a didSet if the model ever changed
    // private var userhasSelectedAnEP = false
    fileprivate struct Storyboard { static let EpCellIndentifier = "reusableCell" }
    
    //I am manually making some EPs for testing. This will come from JSON file
    
    fileprivate func epFiller(){
        //make the procedure steps and put them in an array of ProcedureSteps, in order to make an EP object
        
        for section in 0..<PocketCheckListV22.mySectionIndexTitles.count {
            //declare a new row for the section
            var rowArray = [EmergencyProcedure]()
            let tempEpName = "Fire"
            
            if (tempEpName.hasPrefix(PocketCheckListV22.mySectionIndexTitles[section])) {
                var tmpProcStepArray = [ProcedureStep]()
                let procStep1 = ProcedureStep(type: "warning", step: "A fire has been detected in the respective nacelle. The corresponding FIRE indicator light on the FIRE SUPPRESSION panel will illuminate.")
                tmpProcStepArray.append(procStep1!)
                let procStep2 = ProcedureStep(type: "note", step: "Bleed air or other hot gas leakage may trigger an engine fire warning without associated secondary indications.")
                tmpProcStepArray.append(procStep2!)
               let procStep3 = ProcedureStep(type: "memoryStep", step: "*1. ECLs - OFF")
                tmpProcStepArray.append(procStep3!)
                let procStep4 = ProcedureStep(type: "memoryStep", step: "*2. T-Handle (affected engine) - ARM")
                tmpProcStepArray.append(procStep4!)
                let procStep5 = ProcedureStep(type: "logic", step: "If fire persists:")
                tmpProcStepArray.append(procStep5!)
                let procStep6 = ProcedureStep(type: "memoryStep", step: "*3. Discharge Button - Press")
                tmpProcStepArray.append(procStep6!)
                let procStep7 = ProcedureStep(type: "memoryStep", step: "*4. Emergency Shutdown - Execute ")
                tmpProcStepArray.append(procStep7!)
                
                
                                
                
                let ep = EmergencyProcedure(shortName:"FireGround", title: "Fire Engine, On Ground", categoryWCA: "Warning", steps: tmpProcStepArray)
                rowArray.append(ep!)
                
            }
            EmergencyProceduresByLetter.append(rowArray)
        }
        
        
    }
    /* private func epFiller(epDict name: String?) {
     for section in 0..<PocketCheckListV22.mySectionIndexTitles.count {
     //declare an new array for that section
     var rowArray = [EmergencyProcedure]()
     
     for (key,value) in PocketCheckListV22.returnADict(nameOfDict: name)! {
     
     if key.hasPrefix(PocketCheckListV22.mySectionIndexTitles[section]){
     
     
     //needs to pass an array of procedureSteps into 'steps'
     let ep = EmergencyProcedure(shortName: key, title: value[0], categoryWCA: value[1], steps: value[2])
     //rowArray.sort({$0 < $1})
     rowArray.append(ep!)
     }
     }
     rowArray.sortInPlace( { $0.title < $1.title } )
     EmergencyProceduresByLetter.append(rowArray)
     }
     }*/
    
    fileprivate func loadTab() {
        //need a conditonal for, if when the user selects a tab, and it is already displaying an EP,then segue back or just show the main EP page
        //if userhasSelectedAnEP {
        epFiller()
        /* switch(tabBarController!.selectedIndex)
         {
         case 0: epFiller()
         case 1: epFiller(epDict: "Cautions")
         case 2: epFiller(epDict: "Advisories")
         case 3: epFiller(epDict: "Ground")
         case 4: epFiller(epDict: "Flight")
         default: break
         }
         }*/
    }
    /*func displayICMessage(){
     if (_msgDisplayedAtleastOnce == false) {
     let myMessage = UIAlertController(title: "Current Interim Change 74", message: "Oct 2016", preferredStyle: UIAlertControllerStyle.Alert)
     myMessage.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(action:UIAlertAction!) in print("User hit ok")}))
     presentViewController(myMessage, animated: true, completion: nil)
     var _msgDisplayedAtleastOnce = true
     }
     }*/
    /*override func viewDidAppear(animated: Bool) {
     }*/
    
    override func viewWillAppear(_ animated: Bool) {
        //clearsSelectionOnViewWillAppear = true
        super.viewWillAppear(animated)
        loadTab()
        //tableView.reloadData()
    }
    fileprivate func configureTableView(){
        
        // tableView.sectionIndexColor = UIColor.darkTextColor()
        //tableView.sectionIndexBackgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.2)
        tableView.sectionIndexMinimumDisplayRowCount = 20
        tableView.sectionIndexTrackingBackgroundColor = UIColor.white
        tableView.sectionIndexColor = UIColor.black
        //tableView.sectionHeaderHeight = 17
        tableView.separatorColor = UIColor.black
        //tableView.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
        
        //tableView.backgroundView = nil
        //tableView.backgroundColor = UIColor.greenColor()
        //tableView.layer.cornerRadius = 150
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return PocketCheckListV22.mySectionIndexTitles.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmergencyProceduresByLetter[section].count
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return PocketCheckListV22.mySectionIndexTitles
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //tableView.backgroundColor = UIColor.yellow
    }
    /* override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     if(!EmergencyProceduresByLetter[section].isEmpty) {
     return String(mySectionIndexTitles[section])
     }
     else { return nil }
     }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.EpCellIndentifier, for: indexPath) as! EPTableViewCell
        
        let emergencyProcedure = EmergencyProceduresByLetter[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        
        //cell.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
        cell.epName.text = emergencyProcedure.title
        cell.epName.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //print("got to prep seg")
        if segue.identifier == "showSegueEP" {
            //let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
            //  print("got to after if")
            let destinationViewController = segue.destination as! EPViewController
            //print("got to segue")
            if let selectedEPcell = sender as? EPTableViewCell {
                let indexPath = tableView.indexPath(for: selectedEPcell)!
                let selectedEP = EmergencyProceduresByLetter[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
                destinationViewController.ep = selectedEP
                destinationViewController.navigationItem.title = selectedEP.title
                //userhasSelectedAnEP = true
            }
        }
        
    }
}
