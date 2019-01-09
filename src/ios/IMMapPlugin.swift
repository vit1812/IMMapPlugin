import IMMap

@objc(IMMapPlugin) class IMMapPlugin : CDVPlugin, MapViewControllerDelegate {
    @objc(openMap:)
    func openMap(command: CDVInvokedUrlCommand) {
        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: ""
        )
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
        let appDelegate = UIApplication.shared
        guard let w = appDelegate.windows.first else {return}
        guard let vc = w.rootViewController else {return}
        guard let mapVc = MapViewController.mapViewController() else {return}
        mapVc.delegate = self
        mapVc.view.frame = vc.view.frame
        mapVc.checkToOpenAirportList()
        vc.present(mapVc, animated: true) {
            
        }
    }
    
    @objc(openMapWithAirportCode:)
    func openMapWithAirportCode(command: CDVInvokedUrlCommand) {
        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: ""
        )
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
        let appDelegate = UIApplication.shared
        guard let w = appDelegate.windows.first else {return}
        guard let vc = w.rootViewController else {return}
        let code = command.arguments[0] as? String ?? ""
        guard let mapVc = MapViewController.mapViewController(withAirportCode: code) else {return}
        mapVc.delegate = self
        mapVc.view.frame = vc.view.frame
        vc.present(mapVc, animated: true) {
            
        }
    }
    
    @objc(setCurrentLanguageCode:)
    func setCurrentLanguageCode(command: CDVInvokedUrlCommand) {
        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: ""
        )
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
        let code = command.arguments[0] as? String ?? ""
        DataManagement.sharedInstance.setCurrentLanguageCode(code)
    }
    
    func didTouchXButton(_ vc: MapViewController) {
        vc.dismiss(animated: true) {
            
        }
    }
    
    func willShare(withLink link: String, inViewController vc: MapViewController) {
        
    }
}
