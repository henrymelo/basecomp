//
//  SuperAppUITests.swift
//  SuperAppUITests
//
//  Created by Henrique Melo on 26/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SuperApp

class SuperAppSpec: QuickSpec {
    
    override func spec() {

        describe("ViewEveris"){

            var view: ViewEveris!
            
            beforeEach {
                view = Bundle.main.loadNibNamed("ViewEveris",
                                                owner: nil,
                                                options: nil)?.first as! ViewEveris
            }
            
            it("ViewEveris UI Spec") {
                view.setupUI()
                view.layoutIfNeeded()
                //expect(view) == recordSnapshot()
                expect(view) == snapshot()
            }
        }
    }
}
