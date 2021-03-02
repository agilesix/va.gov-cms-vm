# Objective

Provide a low-effort method for getting up and running with a CMS development environment

## Quickstart

1. Install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
2. Download or clone this project to your workstation.
3. Copy `default.config.yml` to `config.yml` and edit to add your git information.
4. `cd` into this project directory and run `vagrant up`.

## Viewing the web/mailhog environments

### Visual Studio Code

Open a terminal and run `lando info`. Then, command-click on a URL to open it. (VS Code will automatically forward the port)

<img width="487" alt="Screen Shot 2021-03-01 at 1 23 48 PM" src="https://user-images.githubusercontent.com/101649/109554429-6fd4dd80-7a91-11eb-8880-9bbb67db412f.png">

## Interactive cypress testing

1. Go to the GUI and login with:
  - username: `vagrant`
  - password: `vagrant`
2. Click `Activities` in the upper-left corner, type `gnome-terminal` and press return:
<img width="793" alt="Screen Shot 2021-03-01 at 2 15 28 PM" src="https://user-images.githubusercontent.com/101649/109560917-b2021d00-7a99-11eb-8f05-f4f52938f3b4.png">
3. When the terminal opens, run `cd va.gov-cms; npm run test:interactive` and wait to see the test runner:
<img width="1023" alt="Screen Shot 2021-03-01 at 2 25 54 PM" src="https://user-images.githubusercontent.com/101649/109561186-0c02e280-7a9a-11eb-85ed-e3d950c20d8d.png">
