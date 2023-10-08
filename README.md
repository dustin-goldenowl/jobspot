<div align="center">

  <img src="assets/images/logo.svg" alt="logo" width="200" height="auto" />
  <h1>Jobspot</h1>
  
  <p>
    This is an application for posting, applying, and finding jobs between employers and candidates similar to the Linkedin App.
  </p>
  
  
<!-- Badges -->
<p>
  <a href="https://github.com/dustin-goldenowl/jobspot/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/dustin-goldenowl/jobspot" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/dustin-goldenowl/jobspot" alt="last update" />
  </a>
  <a href="https://github.com/dustin-goldenowl/jobspot/network/members">
    <img src="https://img.shields.io/github/forks/dustin-goldenowl/jobspot" alt="forks" />
  </a>
  <a href="https://github.com/dustin-goldenowl/jobspot/stargazers">
    <img src="https://img.shields.io/github/stars/dustin-goldenowl/jobspot" alt="stars" />
  </a>
  <a href="https://github.com/dustin-goldenowl/jobspot/issues/">
    <img src="https://img.shields.io/github/issues/dustin-goldenowl/jobspot" alt="open issues" />
  </a>
  <a href="https://github.com/dustin-goldenowl/jobspot/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/dustin-goldenowl/jobspot.svg" alt="license" />
  </a>
</p>
   
<h4>
    <a href="https://github.com/dustin-goldenowl/jobspot/">View Demo</a>
  <span> · </span>
    <a href="https://github.com/dustin-goldenowl/jobspot">Documentation</a>
  <span> · </span>
    <a href="https://github.com/dustin-goldenowl/jobspot/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/dustin-goldenowl/jobspot/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  * [Screenshots](#camera-screenshots)
  * [Tech Stack](#space_invader-tech-stack)
  * [Features](#dart-features)
  * [Color Reference](#art-color-reference)
  * [Environment Variables](#key-environment-variables)
- [Getting Started](#toolbox-getting-started)
  * [Prerequisites](#bangbang-prerequisites)
  * [Installation](#gear-installation)
  * [Running Tests](#test_tube-running-tests)
  * [Run Locally](#running-run-locally)
  * [Deployment](#triangular_flag_on_post-deployment)
- [Usage](#eyes-usage)
- [Roadmap](#compass-roadmap)
- [Contributing](#wave-contributing)
  * [Code of Conduct](#scroll-code-of-conduct)
- [FAQ](#grey_question-faq)
- [License](#warning-license)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)

<!-- About the Project -->
## :star2: About the Project


<!-- Screenshots -->
### :camera: Screenshots

| On Boarding  | Sign in | Sign up |
| --- | --- | --- |
| <img src="screenshots/on_boarding_screen.png" width=250> | <img src="screenshots/sign_in_screen.png" width=250> | <img src="screenshots/sign_up_screen.png" width=250> |

| Connection  | Add Post | Edit Post |
| --- | --- | --- |
| <img src="screenshots/connection_screen.png" width=250> | <img src="screenshots/add_post_screen.png" width=250> | <img src="screenshots/edit_post_screen.png" width=250> |


<!-- TechStack -->
### :space_invader: Tech Stack

<details>
  <summary>Mobile</summary>
  <ul>
    <li><a href="https://dart.dev/">Dart</a></li>
    <li><a href="https://flutter.dev/">Flutter</a></li>
  </ul>
</details>

<details>
  <summary>Serverless</summary>
  <ul>
    <li><a href="https://console.firebase.google.com/">Firebase</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://console.firebase.google.com/">Firebase FireStore</a></li>
  </ul>
</details>

<details>
<summary>DevOps</summary>
  <ul>
    <li><a href="https://www.gtihub.com/">Github</a></li>
    <li><a href="https://www.gtihub.com/">Github ACtion</a></li>
    <li><a href="https://fastlane.tools/">Fastlane</a></li>
    <li><a href="https://firebase.google.com/docs/crashlytics/">Firebase Crashlytics</a></li>
  </ul>
</details>

<!-- Features -->
### :dart: Features

- Sign In, Sign Up
- Manage business account registration
- Account management
- Manage recruitment posts
- Manage applications
- Article management
- Manage your favorite job categories
- Manage followers
- Job seeking
- Manage notifications
- Multi language

<!-- Color Reference -->
### :art: Color Reference

| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Primary Color | ![#130160](https://via.placeholder.com/10/130160?text=+) #130160 |
| Secondary Color | ![#D6CDFE](https://via.placeholder.com/10/D6CDFE?text=+) #D6CDFE |
| Accent Color | ![#FF9228](https://via.placeholder.com/10/FF9228?text=+) #00ADB5 |
| Text Color | ![#150B3D](https://via.placeholder.com/10/150B3D?text=+) #150B3D |


<!-- Env Variables -->
### :key: Environment Variables

Coming soon

<!-- To run this project, you will need to add the following environment variables to your .env file

`API_KEY`

`ANOTHER_API_KEY` -->

<!-- Getting Started -->
## 	:toolbox: Getting Started

<!-- Prerequisites -->
### :bangbang: Prerequisites

This project uses Fastlane to auto deploy Firebase Distribution. You need to install Fastlane for this project. You need to install the ruby environment before installing Fastlane. Download and install [here](https://rubygems.org)

After installation is complete, run the command below to install Fastlane

```bash
 gem install fastlane
```

<!-- Installation -->
### :gear: Installation

Install all package in project

```bash
  flutter pub get
```
   
<!-- Running Tests -->
### :test_tube: Running Tests

To run tests, run the following command

```bash
  flutter test test/widget_test.dart
```

<!-- Run Locally -->
### :running: Run Locally

Clone the project

```bash
  git clone https://github.com/dustin-goldenowl/jobspot.git
```

Go to the project directory

```bash
  cd jobspot
```

Install dependencies

```bash
  flutter pub get
```

Start the project

```bash
  flutter run
```


<!-- Deployment -->
### :triangular_flag_on_post: Deployment

To deploy this project to Firebase Distribution

```bash
  fastlane deploy_firebase_distribution version_name: version_name version_code: version_code
```

To deploy this project to CH Play

```bash
  fastlane deploy_ch_play version_name: version_name version_code: version_code
```

<!-- Usage -->
## :eyes: Usage

Coming soon

<!-- Use this space to tell a little more about your project and how it can be used. Show additional screenshots, code samples, demos or link to other resources.


```javascript
import Component from 'my-project'

function App() {
  return <Component />
}
``` -->

<!-- Roadmap -->
## :compass: Roadmap

Coming soon

<!-- * [x] Todo 1
* [ ] Todo 2 -->


<!-- Contributing -->
## :wave: Contributing

<a href="https://github.com/dustin-goldenowl/jobspot/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=dustin-goldenowl/jobspot" />
</a>


Contributions are always welcome!

See `contributing.md` for ways to get started.


<!-- Code of Conduct -->
### :scroll: Code of Conduct
coming soon
<!-- Please read the [Code of Conduct](https://github.com/dustin-goldenowl/jobspot/blob/master/CODE_OF_CONDUCT.md) -->

<!-- FAQ -->
## :grey_question: FAQ

Coming soon

<!-- - Question 1

  + Answer 1

- Question 2

  + Answer 2 -->


<!-- License -->
## :warning: License

Distributed under the no License. See ```LICENSE``` for more information.


<!-- Contact -->
## :handshake: Contact

Walter Tran - [@ngoctien.TNT](https://www.facebook.com/ngoctien.TNT/) - walter.tran.goldenowl@gmail.com

Project Link: [https://github.com/dustin-goldenowl/jobspot](https://github.com/dustin-goldenowl/jobspot)


<!-- Acknowledgments -->
## :gem: Acknowledgements

Use this section to mention useful resources and libraries that you have used in your projects.

 - [Shields.io](https://shields.io/)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [Emoji Cheat Sheet](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md#travel--places)
 - [Readme Template](https://github.com/othneildrew/Best-README-Template)
