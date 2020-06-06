**Contents**
[ Short Description. ](#desc)

<a name="desc"></a>
## **Short description**

**What\'s the problem?**

Now with more relaxation to the lockdown, number of people with COVID-19
infections might increase. One of the challenges would be to get people
with symptoms medically tested for the infection. People might panic and
visit multiple places for getting it tested.

**Our solution**

The solution is a result of a real life experience where in one of the
patient was not able to find the right place to test COVID-19,
triggering panic in the family.

Our idea is to help people to find the closest laboratory and get
tested. "FindMyLab" application would help in finding the government
certified labs close to the patient's location. Also book appointment
based on their need.\
The user can book an appointment through the app and visit the lab at
his requested slot.\
\
It can be enhanced further to guide patients with next steps such as
hospitalization, linking plasma donors in case they are found positive
for infection .

**Demo video**

**The architecture**

![A close up of a map Description automatically
generated](.//media/image1.png){width="6.263888888888889in"
height="2.39375in"}

**Architecture Overview:**

1.  FindMyLab is a mobile app developed using OpenSource Flutter.

2.  FindMyLab backend components will host the RESt APIs. The REST APIs
    will help to

-   Register a laboratory with location details.

-   Gives list of nearest labs to the user.

-   Helps user to block a slot in a lab

3.  Database stores all the data collected through FindMyLab mobile app.

**As a laboratory owner:**

1.  Installs the FindMyLab app on the phone

2.  Lab owner registers with location details and testing slots.

3.  Lab details are persisted in Database.

**As a user:**

1.  Mobile user installs FindMyLab application and logs in to the
    application.

2.  Finds closest government certified COVID-19 labs and books the slot.

3.  Available slot for lab gets updated in Database as booked.

**Project roadmap**

![A picture containing table Description automatically
generated](.//media/image2.png){width="6.263888888888889in"
height="3.410416666666667in"}

**Getting started**

**To Install FindMyLab:**

-   Download app-release.apk file from the Git repo in android device.

-   Click on file to install the app.

-   You are ready to use the app now.

**Technology pre requisites for feature enhancement.**

-   FindMyLab is developed using Flutter open source.

-   Refer to
    [link](https://medium.com/@sethladd/installing-flutter-on-a-mac-13a26340f80a)
    for setting up flutter on your system.

-   After the feature development, run below command to create a APK
    file to install new features on device. For more details [click
    here](https://flutter.dev/docs/deployment/android).

**flutter build apk**

**Publish to Google Playstore**

FindMyLab app can be made avaliable through Google Play Store. For
detailed instructions on publishing to the Google Play Store, see
the [[Google Play
launch]{.underline}](https://developer.android.com/distribute/googleplay/start) documentation
