# BLE_Peripheral_IOS

Swift-iOS app, acting likes a BLE Peripheral (you can think it as a server in socket programming), advertising "BLE" 10 times/s, having a characteristic to receive the data. If it receives "RED", turn the LED (the circle in the middle of the app) to RED, if it receives "GREEN", turn the LED to green, otherwise let's the LED grey.

Design Requirements

- Library: contains only the business logic (Bluetooth, events...) - no GUI in the lib, will produce the APIs wrapped in a Framework for iOS.
- Application: consumes the library, take the logic from the library and use it to display on the GUI.
