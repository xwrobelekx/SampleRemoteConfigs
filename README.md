# SampleRemoteConfigs
## The purpose of this sample project is to demonstrate how to implement Firebase remote configs.

## Steps:

1. Clone this project
2. Replace Bundle Identifie
3. Register for github Firebase account if you dont have one.
4. Create new firebse project
5. You will need to provide projects Bundle Identifier (use your own, and make sure it matched project bundle identifer)
6. From fire base downlad the `GoogleService-Info.plist` and place it in the project.
7. In firebase you will need to set up your Remote Configs.

 Currently this project uses those 3 feature flags:
        `green_screen_feature_flag`
        `red_screen_feature_flag`
        `yellow_screen_feature_flag`
        
8. Set those flags in the Firebase remote configs. - Make sure that you pubish your changes when you're done.
9. Run the project.

![Simulator Screen Recording - iPhone 14 Pro - 2023-08-25 at 14 38 16](https://github.com/xwrobelekx/SampleRemoteConfigs/assets/16248193/71dabc5f-851c-41d9-a712-cad16784d3eb)


### Lets remotley switch `Red Screen` off:
<img width="720" alt="Screenshot 2023-08-25 at 2 41 12 PM" src="https://github.com/xwrobelekx/SampleRemoteConfigs/assets/16248193/f4528bb6-688b-479a-bcc1-5b39957fa579">


### And now run the app again and notice that the `Red Tab` is gone:


![Simulator Screen Recording - iPhone 14 Pro - 2023-08-25 at 14 46 05](https://github.com/xwrobelekx/SampleRemoteConfigs/assets/16248193/b01b7182-eaa4-46c0-94f4-7a186d74fdef)



