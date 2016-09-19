import Foundation

class EmergencyProcedure {
    
    //MARK: properties
    var shortName: String
    var title: String
    var categoryWCA: String
    var steps: [ProcedureStep]
    
    //MARK: intitialization
    init?(shortName: String, title: String, categoryWCA: String, steps: [ProcedureStep]) {
        self.shortName = shortName
        self.title = title
        self.categoryWCA = categoryWCA
        self.steps = steps
        
        if (shortName.isEmpty || title.isEmpty || categoryWCA.isEmpty || steps.isEmpty) {
            return nil
        }
    }
    
    
}