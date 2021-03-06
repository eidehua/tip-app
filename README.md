# Pre-work - *tips*

**tips** is a tip calculator application for iOS.

Submitted by: **Edward Xue**

Time spent: **6** hours spent in total

## User Stories

The following **required** functionality is complete:
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- [x] settings page not only change default tip percentage, but customize all three % available to choose from!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/mVesrls.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
Optionals ? !

Adding a navigation controller is causing this crash: 
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle </Users/edwardxue/Library/Developer/CoreSimulator/Devices/6887B27C-A796-4B03-9AD6-4778C30233C7/data/Containers/Bundle/Application/ED6F53FA-CEF2-4B7E-974D-8F34360EA944/tips.app> (loaded)' with name 'UIViewController-BYZ-38-t0r' and directory 'Main.storyboardc''

If my story board entry point is on the navigation controller, I get the above crash. If I place it back on the main page, it works fine (but navigation breaks)
Apparently all I had to do was clean the project to fix this! Should have cleaned it a lot earlier. 

Getting all the updates correctly and converting from the input types to numbers or string was pretty time consuming

## License

Copyright 2015 Edward Xue

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.