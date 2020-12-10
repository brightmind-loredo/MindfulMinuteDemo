# iOS HealthKit Demo:
How to write to Apple's HealthKit

## Notes:

1. Run MindfulMinuteDemo in XCode & Emulator/iPhone 8.
2. Click "Add a Mindful Minute to HealthKit"
3. Check HealthKit to verify Mindful Minutes are getting recorded by starting Health app
4. Health -> Summary screen -> Show all Health Data button -> Scroll down the data list to "Mindful Minutes".
5. Each time you click the Add link it will add another minute to Health data.  But you must wait at least 3 minutes between clicks.

Most of the code in ViewController.swift will be very useful for the integration.  HealthKit needs to be initialized. The app needs to get permission to write to Healthkit. Then app can write the session start and end times.  HealthKit will calculate the number of minutes between these two date/time values.


