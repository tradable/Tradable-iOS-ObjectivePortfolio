ObjectivePortfolio is a simple project written in Objective-C. It aims to show how to set up a project with TradableAPI framework and how to start using the API.

Here are the most important steps when it comes to importing TradableAPI framework into your Objective-C project in XCode:

1. Copy the <i>TradableAPI.framework</i> into the <i>Frameworks</i> folder in your project directory.
2. Drag the framework to <i>Embedded Binaries</i> section in your project target settings, under <i>General</i> tab.
3. In your project target settings, under <i>Build Settings</i> tab set <i>Embedded Content Contains Swift Code</i> to <i>Yes</i>.
4. Add <i>@import TradableAPI;</i> line in your .m files where you want to use the API functionality.
