//
//  userInfo.swift
//  Deltna
//
//  Created by Mohammad on 9/6/22.
//

import UIKit
import FirebaseAuth

extension UUID {
      // The user's ID, unique to the Firebase project.
      // Do NOT use this value to authenticate with your backend server,
      // if you have one. Use getTokenWithCompletion:completion: instead.
    public static let uid = Auth.auth().currentUser?.uid
}
