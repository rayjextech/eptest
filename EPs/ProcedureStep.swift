import Foundation

class ProcedureStep {
    
    //MARK: properties
    var type: String
    var step: String
    
    //MARK: intitialization
    init?(type: String, step: String) {
        self.type = type
        self.step = step
        
        if (type.isEmpty || step.isEmpty) {
            return nil
        }
    }
    
    
}