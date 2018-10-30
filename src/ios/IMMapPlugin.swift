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
        vc.present(mapVc, animated: true) {
            
        }
    }
    
    func didTouchXButton(_ vc: MapViewController) {
        vc.dismiss(animated: true) {
            
        }
    }
    
    func willShare(withLink link: String, inViewController vc: MapViewController) {
        
    }
}
