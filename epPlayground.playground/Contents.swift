//: Playground - noun: a place where people can play

import UIKit

class EmergencyProcedure {
    
    //MARK: properties
    var shortName: String
    var title: String
    var categoryWCA: String
    var steps: String
    
    //MARK: intitialization
    init?(shortName: String, title: String, categoryWCA: String, steps: String) {
        self.shortName = shortName
        self.title = title
        self.categoryWCA = categoryWCA
        self.steps = steps
        
        if (shortName.isEmpty || title.isEmpty || categoryWCA.isEmpty || steps.isEmpty) {
            return nil
        }
    }
    
    
}
var mySectionIndexTitles = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var EmergencyProceduresByLetter = [Array<EmergencyProcedure>]()
let epDictWarning = [
    
    "FireGround": ["Fire Engine, On Ground", "Warning","A fire has been detected in the respective nacelle. The corresponding FIRE indicator light on the FIRE SUPPRESSION panel will illuminate.\n\nNOTE: Bleed air or other hot gas leakage may trigger an engine fire warning without associated secondary indications.\n\n*1. ECLs - OFF\n*2. T-Handle (affected engine) - ARM\n\nIf fire persists:\n\n*3. Discharge Button - Press\n*4. Emergency Shutdown - Execute"],
    
    "FireEngFlight": ["FIRE Engine, In Flight","Warning","A fire has been detected in the respective nacelle. The corresponding FIRE warning light on the FIRE SUPPRESSION panel will illuminate.\n\n Note: Bleed air or other hot gas leakage may trigger an engine fire warning without associated secondary indications. Expect affected engine to be low power. Cockpit secondary indications may include increased fuel flow and elevated MGT with low engine torque.\n\n *1. Single engine profile — Establish \n\n If fire confirmed: \n\n*2. ECL (affected engine) — OFF \n*3. T-handle (affected engine) — ARM\n\nIf fire persists: \n\n*4. DISCHARGE button — Press\n\nIf fire persists:\n\n *5. Land immediately\n\nIf fire is extinguished: \n\n 6. ENG, Single, In Flight — Execute"],
    "FireWingFlight": ["FIRE Wing, In Flight","Warning","A fire has been detected, and the fire suppression system activated in the left wing,right wing, or midwing area. The corresponding warning light on the FIRE SUPPRESSION panel will illuminate.\n\nNote: A sustained MFD FIRE annunciation is an indication of a persistent fire. The FIRE SUPPRESSION panel indicator light(s) may or may not provide positive indication of a sustained fire.\n\n*1. TPUMP BOOST - OFF\n\nIf fire persists:\n\n*2. Land immediately.\n\nIf fire is extinguished:\n\n3. Land as soon as possible"],
    "FireWingGround": ["FIRE Wing, On Ground","Warning","A fire has been detected, and the fire suppression system activated in the left wing, right wing, or midwing area. The corresponding warning light on the FIRE SUPPRESSION panel will illuminate.\n\n*1. Emergency Shutdown — Execute"],
    "EngDualAbove60": ["ENG Dual, NAC ≥ 60","Warning","For landing, if conditions permit, a flare should be executed with the objective of minimizing descent rate and resulting in a 60 KCAS ROL. Prior to touchdown, a level attitude should be set to maximize impact load absorption by the landing gear and fuselage. Once stabilized in autorotation the aircraft will be in a 4500–5000 fpm descent, 10° nose low attitude with a 2:1 glide ratio.\n\nWarning:Dual engine loss in CONV will result in a rapid Nr decay. If Nr decay is not arrested rapidly, autorotation is not recoverable.\n\nSimultaneously (first 4):\n\n*1. TCL — Full aft\n*2. Nacelles — Max rate to aft stop\n*3. Airspeed — 120 KCAS\n*4. FLAPS — 0°\n\n*5. APU — EMERG RUN/ENGAGE\n*6. Landing gear — Down\n\nAt 150 ft AGL:\n\n*7. Cyclic — Flare, level prior to impact\n*8. TCL — Full forward\n"],
    "EngDualBelow60": ["ENG Dual, NAC < 60","Warning","The glide characteristics of the aircraft will allow this profile to be flown to a fixed nacelle landing for a dual engine failure. Successful conversion prior to landing is not possible. On final, runway threshold should be the aiming point, as the aircraft will float during landing flare.\n\nAircraft operating in a single engine condition can also fly the ELP to mitigate the risk of the remaining engine failing. FLAPS are set to 40° and TCL full aft. In this configuration the glide characteristics of the aircraft closely approximate the dual engine failure condition. If the remaining engine fails during the descent, selection of FLAPS AUTO is necessary to remain on profile and complete the fixed nacelle emergency landing.\n\nOnce stabilized the aircraft will be in a 3800–4000 fpm descent, 4° nose low attitude with a 4.5:1 glide ratio.\n\n*1. TCL — Full aft\n*2. Nacelles — Max rate to downstop,then 84% Nr\n*3. Airspeed — 170 KCAS\n*4. FLAPS — AUTO\n*5. APU — EMERG RUN/ENGAGE\n*6. ELP — Intercept\n\nNote:After configuring for glide, attempt engine restart if conditions permit.\n\n*7. Landing gear — EMERG DOWN (As required) (allow 20 seconds for extension)\n\nWarning: Extension of landing gear is recommended only if assured of landing on a prepared surface. Landing with gear extended on an unprepared surface may result in loss of aircraft control.\n\nNote:Expect 200 to 600 fpm increase in rate of descent with landing gear extended.\n\nAt approximately 400 — 200 ft AGL:\n\n*8. Mild Flare — EXECUTE, holding 8−10 nose up. Expect airspeed to decay to 120−115 KCAS on touchdown.\n\nNote:Flaps FULL can be used on short final to slightly extend the flare."],
    "EngSingHover": ["ENG Single, Hover","Warning","With an engine failure in a low hover, the pilot moves the TCL full forward to attempt to cushion the landing. At higher altitudes, sufficient time may be available to gain airspeed by simultaneous application of TCL, forward nacelle, and lowered pitch attitude, generating airflow over the proprotors and reducing power required. If fly-away is not possible or the pilot decides to land immediately, pitch attitude must be returned to level prior to touchdown.\n\n*1. TCL — Full forward\n*2. Cyclic — Level attitude prior to touchdown\n\nCaution:Aft stick control margin significantly decreases as nacelles are rotated towards 70 degrees. Consideration should be given to adjusting the nacelles aft prior to touchdown in order to achieve normallanding attitude.\n\nIf a flyaway is to be attempted:\n\n*3. ENG, Single, In Flight — Execute\n\nNote:Aircraft vertical velocity is sensitive to nacelle beep rate. During climb out, ensure beep rate is slow enough to not induce an uncommanded sink rate."],
    "EngSingInFlight": ["ENG Single, In Flight","Warning","Note:The engine power and torque on the drive system required for APLN flight is less than that for CONV or VTOL flight. APLN is also the preferred configuration in the event the remaining engine fails. These considerations warrant a transition to APLN without delay.\n\nAn aggressive transition to APLN at high gross weights and/or high density altitude may result in an unacceptable loss of altitude. If at VTOL or high CONV, the CONV profile should be established first to attain level or climbing flight. Once a safe altitude is achieved, transition should be made at a rate that minimizes loss of altitude.\n\nAt high nacelle and low airspeed, vertical velocity is sensitive to nacelle beep rate, especially below 75° nacelle. Airspeed has more effect on improving single engine performance than nacelle angle for most gross weights.\n\nDuring a single engine failure, the FADEC will attempt an automatic relight. If a relight does not occur within a few seconds, the engine will shut off.\n\n*1. TCL — Full forward\n*2. Single engine profile — Establish\n\nIf level flight cannot be established:\n\n3. Land as soon as possible (ROL recommended)\n\nNote:Time permitting, dumping fuel (800 lbs/ minute) or getting rid of cargo should be considered to reduce weight. Fuel dump will cause a large amount of fuel to be spread over the empennage and aft cabin.\n\nIf climbing flight can be established:\n\n4. APLN —Transition\n5. ECL (affected engine) — OFF\n\nIf engine restart is to be attempted:\n\n6. Engine Restart In Flight — Execute\n\nNote:Within one minute of the engine shutting off, the appropriate ECL should be placed in CRANK to prevent thermal lock-up and then to OFF to reset the start logic.\n\n7. TPUMP BOOST — ON\n8. XFER VALVE — OPEN\n9. Land as soon as practical (ROL recommended)\n\nCaution:If there is a risk of losing the remaining engine, intercept and fly the Emergency Landing Profile. Consideration should be given to starting the APU.\n\nNote:If it is desired to restart the affected engine on the ground, ECL of running engine must first be pulled out of FLY to reset TCRS and prevent transients. Return running engine to FLY prior to second engine start."],
    "Elev": ["ELEV","Warning","Warning: If the elevator fails trailing edge down, unrecoverable loss of longitudinal control may occur above 40 KCAS with nacelles less than 85.\n\n*1. Cyclic — Roll toward 60AOB\n*2. VTOL - Convert\n3. PFCS - RESET\n4. Land as soon as practical\n\n"],
    "Icds": ["ICDS ","Warning","stuff"],
    "Gearbox": ["PRGB/TAGB","Warning","stuff"],
    "Extrae": ["EXTRAE","Warning","yup"],
    "Sink": ["SINK ","Warning","yup"],
    "Tango": ["TANGO ","Warning","yup"]
]
/*
for (key,value) in epDictWarning {
    //read all of the eps into an array of arrays<EP>. They should be entered in at the index (0-25) of their first letter
    //grab the key 'or first letter of ep.title
    for index in 0..<mySectionIndexTitles.count {
        if key.hasPrefix(mySectionIndexTitles[index]){
            let ep = EmergencyProcedure(shortName: key, title: value[0], categoryWCA: value[1], steps: value[2])
            EmergencyProceduresByLetter[index][index] = ep!
        }
    }
    //insert the EP into the index that corresponds with the ltr in the alphabet (0-25)
}
//print(EmergencyProceduresByLetter)

*/

var numSections = 3
var numRows = 3
var array = Array<Array<Int>>()
var value = 1 

for section in 0..<numSections {
   var columnArray = Array<Int>()
    for row in 0..<numRows {
        columnArray.append(value++)
    }
    array.append(columnArray)
}
print("array \(array)")






























x

