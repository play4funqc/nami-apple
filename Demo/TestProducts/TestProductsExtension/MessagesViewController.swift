//
//  MessagesViewController.swift
//  TestProductsExtension
//
//  Created by Kendall Helmstetter Gelner on 10/10/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

import UIKit
import Messages
import Nami

class MessagesViewController: MSMessagesAppViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test of displaying a paywall after a small delay.  You can remove this and put a paywall display somewhere it makes more sense for your application.
        Nami.doConfigBasedWork {
            DispatchQueue.main.asyncAfter(deadline: .now()+4 ) {
                NamiPaywallManager.raisePaywall(fromVC: self)
            }
        }
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        super.willBecomeActive(with: conversation)
   
        let namiConfig = NamiConfiguration(appPlatformID: "002e2c49-7f66-4d22-a05c-1dc9f2b7f2af")
        
        // Just like in an application, we need to pass Nami the application ID the paywalls are built for.
        Nami.configure(namiConfig: namiConfig )
        
       // This call activates the Nami system for an extension.
    NamiExtensionManager.shared.startupNamiFromMessageExtension(messageViewController: self, applicationGroupName: nil)
        
        // This setting lets us test purchases in the simulator.
        NamiStoreKitHelper.shared.bypassStoreKit(bypass: true)
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // This call shuts down the Nami system gracefully in an extension, making sure everything is propery recorded.
        NamiExtensionManager.shared.extensionDidResign()
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
