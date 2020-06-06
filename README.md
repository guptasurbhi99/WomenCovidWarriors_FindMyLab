**Contents**

[1. Short Description. ](#desc)

[2. Demo Video. ](#demo)

[3. The Architecture. ](#arch)

[4. Project RoadMap. ](#roadmap)

[5. Getting Started. ](#start)

[6. Publish To Google Play Store. ](#playstore)

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

<a name="demo"></a>
## **Demo video**

[![Watch the video](.//media/image3.png)](https://akamai.webex.com/webappng/sites/akamai/recording/play/d0ac9b3c2cf84d6a900875a1645543f9)

<a name="arch"></a>
## **The Architecture**

![A close up of a map Description automatically
generated](.//media/image1.png)

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

<a name="roadmap"></a>
## **Project Roadmap**

![A picture containing table Description automatically
generated](.//media/image2.png)

**Handshake with Plasma donors**

Going forward we want to address this problem as well. A couple of simple steps and it can be acheived.
When any user signs up we ask them if they are ready to donate plasma. We store this response alongwith the blood group of the user in our database.
When a lab or hospital owner logs in, we can show him the list of users who are willing to donate plasma along with the contact details and blood group. This will aid the hospitals to reach out to individuals and immediately arrange plasma to save lives fast.

**Payment Gateway**

We can also integrate a payment gateway into our system to avoid any transaction through cash and preventing the spread.
<a name="start"></a>
## **Getting started**

**To Install FindMyLab:**

-   Download [app-release.apk](https://github.com/guptasurbhi99/WomenCovidWarriors_FindMyLab/blob/master/app-release.apk) file from the Git repo in android device.

-   Click on file to install the app.

-   You are ready to use the app now.

**Technology pre requisites for feature enhancement.**

-   FindMyLab is developed using Flutter open source.

-   Refer to
    [link](https://medium.com/@sethladd/installing-flutter-on-a-mac-13a26340f80a)
    for setting up flutter on your system.

-   After the feature development, run below commands to create a APK
    file to install new features on device. For more details [click
    here](https://flutter.dev/docs/deployment/android).

         flutter pub get
         flutter pub run flutter_launcher_icons:main
         flutter build apk

<a name="playstore"></a>
## **Publish to Google Playstore**

FindMyLab app can be made avaliable through Google Play Store. For
detailed instructions on publishing to the Google Play Store, see
the [Google Play
launch](https://developer.android.com/distribute/googleplay/start) documentation
