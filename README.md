<p align="center">
  <a href="" rel="noopener">
 <img src="https://i.imgur.com/AZ2iWek.png" alt="Project logo"></a>
</p>
<h3 align="center">EmpowerHer</h3>

<div align="center">

  [![Hackathon](https://img.shields.io/badge/hackathon-name-orange.svg)](http://leaninhacks.devfolio.co) 
  [![Status](https://img.shields.io/badge/status-active-success.svg)]() 
  [![GitHub Issues](https://img.shields.io/github/issues/kylelobo/The-Documentation-Compendium.svg)](https://github.com/TanyaNijhawan2004/EmpowHER/issues)
  [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/kylelobo/The-Documentation-Compendium.svg)](https://github.com/TanyaNijhawan2004/EmpowHER/pulls)


</div>

---

<p align="center"> EmpowHer - Empowering Girls to Support Girls
    <br> 
</p>

## 📝 Table of Contents
- [Problem Statement](#problem_statement)
- [Idea / Solution](#idea)
- [Dependencies / Limitations](#limitations)
- [Future Scope](#future_scope)
- [Setting up a local environment](#getting_started)
- [Technology Stack](#tech_stack)
- [Team](#acknowledgments)

## 🧐 Problem Statement <a name = "problem_statement"></a>
The female community has always faced problems related to their intimacy and personal hygiene and expressing / discussing about these problems has been considered to be a taboo. A shyness / shame factor also rotates around the mind when one goes to the doctor and is not able to express themselves properly in front of the doctor. 

As a result of this what generally they do is to go to Google or Quora or Reddit and search for a specific solution or prefer seeking help from the female community.  But again, the web is free for ALL and as a con of this, they have to face spam, abusive and defaming messages from the male society which goes onto further affect their mental health.

- IDEAL: The ideal solution for the afforementioned problem would be :
  - An Camera authenticated login to ensure only females to use the platform and discarding the security breaches in any format.
  - A self trained language model in order to ensure crisp and descriptive answers for even the niche of the problems or questions that are faced by the females.
  - An in house developed algorithm to flag abusive, spam and non related content from the community platform and to maintain the dignity of the platform.
- REALITY: Due to lack of proper solutions for deploying our ML models we were bound to use third part softwares but in turn I would say that Open AIs engines and APIs have helped us achieve maximum output from our current prototype.
- CONSEQUENCES: As a result we are now dependent on a third part provider for running our services and any hinderance on their end would lead to stopping of our services as well.

## 💡 Idea / Solution <a name = "idea"></a>
EmpowerHER: An AI-Powered Women's Health and Empowerment Platform
It is a comprehensive platform designed to uplift and empower women through health and community support. With a focus on women's health, the platform features an AI-based gynecological doctor assistant that provides reliable medical advice and guidance.
In addition to health support, It also comes with a community platform that provides a safe space for women to connect, share, and support one another. This space serves as a resource for women looking for advice and guidance on various topics related to their well-being.
We are also dedicated to improving the hygiene and health of rural women. The platform partners with Self-Help Groups (SHGs) to provide resources and education to rural communities, promoting improved hygiene and health practices.
Whether you're looking for medical advice, a supportive community, or resources to improve your health, EmpowerHER has got you covered this helps you to take the first step towards a healthier, happier life.

## ⛓️ Dependencies / Limitations <a name = "limitations"></a>
- Dependencies
```
  cupertino_icons: ^1.0.2
  firebase_core: ^2.5.0
  firebase_auth: ^4.2.6
  cloud_firestore: ^4.3.2
  http: ^0.13.5
  google_fonts:
  sizer:
  google_sign_in:
  intl:
  lottie:
  intro_screen_onboarding_flutter: ^1.0.0
  shared_preferences:
```
- Challenges / Limitations
The only limitation that we faced was deployment of ML models and some of our team members being still naive in the process ahd to turn down the idea and instead go with the famous Open AI's GPT-3 language model in order to solve our problems. The GPT-3 model is quite extensive and delivers absolute mind boggling answers on the user side with pretty ease. We also used the Open AI's moderation model which uses the WDAT algorithm to flag absuive, hate, violence and spam content and thus helped us in maintaining cleaniness on the community platform. Although we weren't able to use the camera login for security purposes of the user, we are currently moving forward with a more niche manner of identifying the gender from the first name of the user. 

## 🚀 Future Scope <a name = "future_scope"></a>
As a future scope to this project, there is a lot that can be integrated in order to make it a more smoother and scalable product. We would be introducing our revenue model as a future scope i.e. onboarding doctors and allowing the users to interact and get expert help from the top gyanaecologiests in the country. In addition to that who doesn't love having a personal health assistant and community who is there to help you at all times and therefore in future we look forward to use our own customised ML / AI models in order to solve niche problems and queries digitally and as well as collaborating with SHGs to run more campaigns and give it back to female community to our best.

## 🏁 Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development 
and testing purposes

### Prerequisites

- Android Studio / VS Code
- Flutter SDK

### Setup

[Refer to this link for setting up your environment!](https://docs.flutter.dev/get-started/editor?tab=vscode)

### Installing

Step 1

```
https://github.com/TanyaNijhawan2004/EmpowHER.git
```

Step 2 

```
cd $projectName
```

Step 3

```
flutter pub get
```

Step 4

```
flutter run lib/main.dart
```

**Note:** Make sure to have an ANdroid emulator instant running.

## ⛏️ Built With <a name = "tech_stack"></a>
- [Flutter](https://flutter.dev/) - Mobile App Framework
- [Firebase](https://firebase.google.com/) - Backend Service
- [Open AI](https://openai.com/) - AI engines


## 🎉 Built By Team CS <a name = "acknowledgments"></a>
- Dibyanshu Mohanty
- Tanya Nijhawan
- Madhusmita Panda
- Ayushie Bhawsar
