//
//  DevicesTest.swift
//  RemoteControlTests
//
//  Created by ISAAC DAVID SANTIAGO on 26/06/22.
//

import XCTest

@testable import RemoteControl

class DevicesTest: XCTestCase {
    let firebaseCliente = FirebaseClient()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDeviceByUser(){
        let computer = "computer1"
        let expectation = expectation(description: "getting device from firebasee")

        firebaseCliente.getDeviceById(id: computer) { device in
            print("device",device)
            XCTAssertTrue(device != nil)
            expectation.fulfill()
        } failure: {
            print("Error al obtener el dispositivo")
        }
        waitForExpectations(timeout: 5) { error in
            
        }
    }

    func testDevicesByUser()  {
        let user = "7u4i3N3dn6PKGxGVGmPhqykgkTz1"
        let expectation = expectation(description: "getting devices from firebasee")

        firebaseCliente.getDevicesByUser(user:user){ devices in
            print("devices",devices)
            XCTAssertTrue(devices.count == 2)
            expectation.fulfill()
        } failure: {
            print("error")
        }
        waitForExpectations(timeout: 5) { error in
              if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
              }
        }
    }


}
