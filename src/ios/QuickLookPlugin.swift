import QuickLook

@objc(HWPQuickLookPlugin) class QuickLookPlugin: CDVPlugin {
     var previewQL: QLPreviewController!

        var urlList : [NSURL]?

        func previewController(controller: QLPreviewController, previewItemAtIndex index: Int) -> QLPreviewItem {
            var fileURL : NSURL!
            print(index)
            print(urlList![0])
            fileURL = urlList![index]
            return fileURL
        }
        func numberOfPreviewItemsInPreviewController(controller: QLPreviewController) -> Int {
            return 1
        }

        func preview(command: CDVInvokedUrlCommand){
            let myUrl = command.arguments[0] as! String
            urlList = [NSURL(string: myUrl)!]
            self.previewQL = QLPreviewController()
            self.previewQL.dataSource = self
            self.previewQL.currentPreviewItemIndex = 0

            self.viewController?.showViewController(self.previewQL, sender: nil)
        }

}