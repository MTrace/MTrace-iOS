class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    storyboard = UIStoryboard.storyboardWithName("MTraceMain", bundle:nil)
    mainSplitVC = storyboard.instantiateViewControllerWithIdentifier("mainSplitVC")
    @window.rootViewController = mainSplitVC

    true
  end
end
